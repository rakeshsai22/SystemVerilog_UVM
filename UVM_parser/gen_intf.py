import os
from pathlib import Path
from step1_parse_ports import extract_ports_and_params

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

def generate_interface_file(verilog_file: str):
    # Parse design
    module_name, parameters, ports = extract_ports_and_params(verilog_file)

    # Determine design folder and output path
    design_path = Path(verilog_file).resolve()
    design_dir = design_path.parent
    verif_dir = design_dir / f"{module_name}_verif"
    verif_dir.mkdir(exist_ok=True)

    # Generate interface content
    interface_code = generate_uvm_interface(module_name, ports)

    # Write file
    interface_file = verif_dir / f"{module_name}_if.sv"
    interface_file.write_text(interface_code)
    print(f"[INFO] Interface file generated at: {interface_file}")

# === Main Driver ===
if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python step2_generate_interface.py <verilog_file>")
        sys.exit(1)

    generate_interface_file(sys.argv[1])
