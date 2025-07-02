import re
import sys
from pathlib import Path

# Step 1: Clean input Verilog
def remove_comments(code: str) -> str:
    code = re.sub(r'/\*.*?\*/', '', code, flags=re.S)  # block comments
    code = re.sub(r'//.*', '', code)                   # line comments
    return code

# Step 2: Extract ports + parameters
def extract_ports_and_params(file_path: str):
    verilog_code = Path(file_path).read_text()
    verilog_code = remove_comments(verilog_code)

    # Parse parameters
    param_pattern = re.compile(r'parameter\s+(\w+)\s*=\s*([^,;\n)]+)')
    parameters = {name: value.strip() for name, value in param_pattern.findall(verilog_code)}

    # Match module header
    module_match = re.search(r'module\s+(\w+)\s*(#\s*\(.*?\))?\s*\((.*?)\);\s*', verilog_code, re.S)
    if not module_match:
        raise ValueError("Module declaration not found")

    module_name = module_match.group(1)
    ports_block = module_match.group(3)

    ports_block = re.sub(r'\n\s*', ' ', ports_block)
    port_lines = re.split(r',(?![^\[]*\])', ports_block)

    port_info = {}
    for line in port_lines:
        line = line.strip()
        if not line:
            continue
        m = re.match(
            r'(input|output|inout)\s*' 
            r'(reg|wire|logic)?\s*'
            r'(\[[^\]]+\])?\s*'
            r'([\w\s,]+?)'
            r'(\[[^\]]+\])?\s*$', 
            line
        )
        if m:
            direction, dtype, packed, names, unpacked = m.groups()
            names = [n.strip() for n in names.split(',')]
            for name in names:
                if name:
                    port_info[name] = {
                        'direction': direction,
                        'type': dtype if dtype else 'logic',
                        'packed': packed if packed else '',
                        'unpacked': unpacked if unpacked else ''
                    }

    return module_name, parameters, port_info

# Step 3: Generate interface code
def generate_uvm_interface(module_name: str, ports: dict, clk_name: str = 'clk') -> str:
    lines = [f"interface {module_name}_if(input logic {clk_name});"]
    for name, info in ports.items():
        if name == clk_name:
            continue
        packed = f"{info['packed']} " if info['packed'] else ''
        unpacked = f"{info['unpacked']} " if info['unpacked'] else ''
        lines.append(f"  {info['type']} {packed}{name} {unpacked};")
    lines.append("endinterface")
    return "\n".join(lines)  

# Step 4a: Create verification folder and write interface
def generate_verification_folder(verilog_file: str, module_name: str, ports: dict):
    design_path = Path(verilog_file).resolve()
    design_dir = design_path.parent
    verif_dir = design_dir / f"{module_name}_verif"
    verif_dir.mkdir(exist_ok=True)

    interface_code = generate_uvm_interface(module_name, ports)
    interface_file = verif_dir / f"{module_name}_if.sv"
    interface_file.write_text(interface_code)
    print(f"[INFO] Interface file generated at: {interface_file}")
    return verif_dir

# Step 4b: Generate tb_top.sv
def generate_tb_top(verilog_file: str, module_name: str, parameters: dict, ports: dict):
    design_path = Path(verilog_file).resolve()
    verif_dir = design_path.parent / f"{module_name}_verif"
    tb_file = verif_dir / "tb_top.sv"

    clk_candidates = ['clk', 'clock', 'clk_i', 'i_clk']
    clk_name = next((p for p in ports if p.lower() in clk_candidates), 'clk')

    port_conns = []
    for name in ports:
        if name == clk_name:
            port_conns.append(f"    .{name}({name})")
        else:
            port_conns.append(f"    .{name}(vif.{name})")

    param_str = ""
    if parameters:
        param_list = [f".{p}({v})" for p, v in parameters.items()]
        param_str = f"#(\n    {',\n    '.join(param_list)}\n) "

    dut_ports_str = ",\n".join(port_conns)

    tb_lines = [
        '`timescale 1ns/1ps',
        '`include "uvm_macros.svh"',
        'import uvm_pkg::*;',
        f'`include "{module_name}_if.sv"', 
        f'`include "{module_name}_pkg.sv"',
        '',
        'module tb;',
        '',
        f'  logic {clk_name};',
        f'  {module_name}_if vif ({clk_name});',
        '',
        '  // Clock generation',
        f'  initial {clk_name} = 0;',
        f'  always #5 {clk_name} = ~{clk_name};',
        '',
        '  // DUT instantiation',
        f'  {module_name} {param_str}dut (',
        f'{dut_ports_str}',
        '  );',
        '',
        '  // Connect to UVM',
        '  initial begin',
        f'    uvm_config_db#(virtual {module_name}_if)::set(null, "*", "vif", vif);',
        '    run_test();',
        '  end',
        '',
        'endmodule'
    ]

    tb_file.write_text("\n".join(tb_lines))
    print(f"[INFO] Testbench top generated at: {tb_file}")

def generate_sequence_item(module_name: str, ports: dict, verif_dir: Path):
    file_path = verif_dir / f"{module_name}_seq_item.sv"

    input_ports = {k: v for k, v in ports.items() if v['direction'] == 'input'}
    lines = [f"class {module_name}_seq_item extends uvm_sequence_item;"]

    for name, info in input_ports.items():
        width = info['packed'] if info['packed'] else ''
        lines.append(f"  rand {info['type']} {width} {name};")

    lines += [
        "",
        f"  `uvm_object_utils({module_name}_seq_item)",
        "",
        f"  function new(string name = \"{module_name}_seq_item\");",
        "    super.new(name);",
        "  endfunction",
        "",
        "endclass"
    ]

    file_path.write_text("\n".join(lines))
    print(f"[INFO] Sequence item generated at: {file_path}")

def generate_sequence(module_name: str, verif_dir: Path):
    file_path = verif_dir / f"{module_name}_seq.sv"
    item_var = f"{module_name}_item"

    lines = [
        f"class {module_name}_seq extends uvm_sequence #({module_name}_seq_item);",
        f"  `uvm_object_utils({module_name}_seq)",
        "",
        f"  function new(string name = \"{module_name}_seq\");",
        "    super.new(name);",
        "  endfunction",
        "",
        "  task body();",
        f"    {module_name}_seq_item {item_var};",
        "    repeat (10) begin",
        f"      {item_var} = {module_name}_seq_item::type_id::create(\"{item_var}\");",
        f"      assert({item_var}.randomize());",
        f"      start_item({item_var});",
        f"      finish_item({item_var});",
        "    end",
        "  endtask",
        "",
        "endclass"
    ]

    file_path.write_text("\n".join(lines))
    print(f"[INFO] Sequence generated at: {file_path}")

def generate_driver(module_name: str, ports: dict, verif_dir: Path):
    file_path = verif_dir / f"{module_name}_driver.sv"
    input_ports = {k: v for k, v in ports.items() if v['direction'] == 'input'}
    item_var = f"{module_name}_item"
    vif_var = f"{module_name}_vif"

    lines = [
        f"class {module_name}_driver extends uvm_driver #({module_name}_seq_item);",
        f"  `uvm_component_utils({module_name}_driver)",
        "",
        f"  virtual {module_name}_if {vif_var};",
        "",
        f"  function new(string name, uvm_component parent);",
        "    super.new(name, parent);",
        "  endfunction",
        "",
        "  function void build_phase(uvm_phase phase);",
        "    super.build_phase(phase);",
        f"    if (!uvm_config_db#(virtual {module_name}_if)::get(this, \"\", \"vif\", {vif_var}))",
        "      `uvm_fatal(\"NOVIF\", \"Virtual interface not found\")",
        "  endfunction",
        "",
        "  task run_phase(uvm_phase phase);",
        "    forever begin",
        f"      {module_name}_seq_item {item_var};",
        f"      seq_item_port.get_next_item({item_var});"
    ]

    for name in input_ports:
        lines.append(f"      {vif_var}.{name} = {item_var}.{name};")

    lines += [
        "      seq_item_port.item_done();",
        "    end",
        "  endtask",
        "endclass"
    ]

    file_path.write_text("\n".join(lines))
    print(f"[INFO] Driver generated at: {file_path}")


def generate_agent(module_name: str, verif_dir: Path):
    file_path = verif_dir / f"{module_name}_agent.sv"
    lines = [
        f"class {module_name}_agent extends uvm_agent;",
        f"  `uvm_component_utils({module_name}_agent)",
        "",
        f"  {module_name}_driver     {module_name}_drv;",
        f"  uvm_sequencer #({module_name}_seq_item) {module_name}_sqr;",
        "",
        "  function new(string name, uvm_component parent);",
        "    super.new(name, parent);",
        "  endfunction",
        "",
        "  function void build_phase(uvm_phase phase);",
        "    super.build_phase(phase);",
        f"    {module_name}_drv = {module_name}_driver::type_id::create(\"{module_name}_drv\", this);",
        f"    {module_name}_sqr = uvm_sequencer#({module_name}_seq_item)::type_id::create(\"{module_name}_sqr\", this);",
        "  endfunction",
        "",
        "  function void connect_phase(uvm_phase phase);",
        "    super.connect_phase(phase);",
        f"    {module_name}_drv.seq_item_port.connect({module_name}_sqr.seq_item_export);",
        "  endfunction",
        "endclass"
    ]
    file_path.write_text("\n".join(lines))
    print(f"[INFO] Agent generated at: {file_path}")


def generate_env(module_name: str, verif_dir: Path):
    file_path = verif_dir / f"{module_name}_env.sv"

    lines = [
        f"class {module_name}_env extends uvm_env;",
        f"  `uvm_component_utils({module_name}_env)",
        "",
        f"  {module_name}_agent   {module_name}_agt;",
        f"  {module_name}_monitor {module_name}_mon;",
        "",
        "  function new(string name, uvm_component parent);",
        "    super.new(name, parent);",
        "  endfunction",
        "",
        "  function void build_phase(uvm_phase phase);",
        "    super.build_phase(phase);",
        f"    {module_name}_agt = {module_name}_agent::type_id::create(\"{module_name}_agt\", this);",
        f"    {module_name}_mon = {module_name}_monitor::type_id::create(\"{module_name}_mon\", this);",
        "  endfunction",
        "",
        "endclass"
    ]

    file_path.write_text("\n".join(lines))
    print(f"[INFO] Environment (with monitor) generated at: {file_path}")



def generate_test(module_name: str, verif_dir: Path):
    file_path = verif_dir / f"{module_name}_test.sv"
    lines = [
        f"class {module_name}_test extends uvm_test;",
        f"  `uvm_component_utils({module_name}_test)",
        "",
        f"  {module_name}_env {module_name}_env;",
        "",
        "  function new(string name, uvm_component parent);",
        "    super.new(name, parent);",
        "  endfunction",
        "",
        "  function void build_phase(uvm_phase phase);",
        "    super.build_phase(phase);",
        f"    {module_name}_env = {module_name}_env::type_id::create(\"{module_name}_env\", this);",
        "  endfunction",
        "",
        "  task run_phase(uvm_phase phase);",
        "    phase.raise_objection(this);",
        "",
        f"    {module_name}_seq my_seq;",
        f"    my_seq = {module_name}_seq::type_id::create(\"my_seq\");",
        f"    my_seq.start({module_name}_env.{module_name}_agt.{module_name}_sqr);",
        "",
        "    phase.drop_objection(this);",
        "  endtask",
        "",
        "endclass"
    ]
    file_path.write_text("\n".join(lines))
    print(f"[INFO] Test class generated at: {file_path}")


def generate_package(module_name: str, verif_dir: Path):
    file_path = verif_dir / f"{module_name}_pkg.sv"
    lines = [
        f"package {module_name}_pkg;",
        '  import uvm_pkg::*;',
        "",
        f'  `include "{module_name}_seq_item.sv"',
        f'  `include "{module_name}_seq.sv"',
        f'  `include "{module_name}_driver.sv"',
        f'  `include "{module_name}_monitor.sv"',
        f'  `include "{module_name}_agent.sv"',
        f'  `include "{module_name}_env.sv"',
        f'  `include "{module_name}_test.sv"',
        "",
        f"endpackage"
    ]
    file_path.write_text("\n".join(lines))
    print(f"[INFO] Package generated at: {file_path}")

def generate_monitor(module_name: str, ports: dict, verif_dir: Path):
    file_path = verif_dir / f"{module_name}_monitor.sv"

    # We'll monitor outputs
    output_ports = {k: v for k, v in ports.items() if v['direction'] == 'output'}
    vif_var = f"{module_name}_vif"

    lines = [
        f"class {module_name}_monitor extends uvm_component;",
        f"  `uvm_component_utils({module_name}_monitor)",
        "",
        f"  virtual {module_name}_if {vif_var};",
        "",
        f"  function new(string name, uvm_component parent);",
        "    super.new(name, parent);",
        "  endfunction",
        "",
        "  function void build_phase(uvm_phase phase);",
        f"    if (!uvm_config_db#(virtual {module_name}_if)::get(this, \"\", \"vif\", {vif_var}))",
        "      `uvm_fatal(\"NOVIF\", \"Virtual interface not found\")",
        "  endfunction",
        "",
        "  task run_phase(uvm_phase phase);",
        "    forever begin",
        "      @(posedge vif.clk);"
    ]

    print_stmt = "      $display(\"[MONITOR] Time=%0t"
    args = ["$time"]

    for name in output_ports:
        print_stmt += f" {name}=%0h"
        args.append(f"{vif_var}.{name}")

    print_stmt += "\", " + ", ".join(args) + ");"
    lines.append(print_stmt)

    lines += [
        "    end",
        "  endtask",
        "endclass"
    ]

    file_path.write_text("\n".join(lines))
    print(f"[INFO] Monitor generated at: {file_path}")




# === Main entry point ===
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python uvm_parser.py <verilog_design_file>")
        sys.exit(1)

    verilog_file = sys.argv[1]
    # read the design
    module_name, parameters, ports = extract_ports_and_params(verilog_file)
    # folder and interface.sv
    verif_dir = generate_verification_folder(verilog_file, module_name, ports)
    # tb_top
    generate_tb_top(verilog_file, module_name, parameters, ports)

    generate_sequence_item(module_name, ports, verif_dir)
    generate_sequence(module_name, verif_dir)
    generate_driver(module_name, ports, verif_dir)
    generate_agent(module_name, verif_dir)
    generate_env(module_name, verif_dir)
    generate_test(module_name, verif_dir)
    generate_package(module_name, verif_dir)
    generate_monitor(module_name,ports, verif_dir)

