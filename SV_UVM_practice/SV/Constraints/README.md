# SystemVerilog Constraints Examples

This repository contains **6 SystemVerilog files** demonstrating various constraint-based randomization techniques. Each file focuses on a specific problem and provides a solution using SystemVerilog constraints.

---

## Files and Problem Statements

### **1. `constraint_1.sv`**
- **Problem**: Randomize multiple variables (`var1`, `var2`, `var3`, `var4`, `A`, `B`, `j`, `k`, `val`) with specific constraints:
  - `var1`, `var2`, `var3`, `var4` are constrained to specific ranges and relationships.
  - `A` is constrained to be between 25 and 50, and greater than 40.
  - `B` is constrained to specific ranges.
  - `val` is constrained to values 0, 1, 2, or 3.
  - `var3` is constrained to be even and a power of 2.
- **Solution**: [constraint_1.sv](./constraint_1.sv)

---

### **2. `constraint_2.sv`**
- **Problem**:
  1. Randomize an array `a[]` of size 10 with constraints:
     - Even-indexed elements are set to 0.
     - Odd-indexed elements are set to `(i+1)/2`.
  2. Randomize a variable `val` in the range `[990:1000]` and convert it to a real number by dividing by 10.
  3. Randomize a variable `val` in the range `[5:50]` such that it is divisible by 5.
  4. Randomize two variables `val` and `uval` to generate unique odd numbers in the range `[1:10]`.
- **Solution**: [constraint_2.sv](./constraint_2.sv)

---

### **3. `constraint_3.sv`**
- **Problem**:
  1. Randomize a 4-bit dynamic array of size 15 to 20 with constraints:
     - Even numbers in odd locations.
     - Odd numbers in even locations.
  2. Randomize two variables `a` and `b` such that:
     - `a` and `b` are not equal.
     - The number of bits toggled in `a` with respect to `b` is 5.
  3. Randomize a variable `a` such that its value is not the same as the previous 5 occurrences.
- **Solution**: [constraint_3.sv](./constraint_3.sv)

---

### **4. `constraint_4.sv`**
- **Problem**: Demonstrate various constraint-based randomization techniques:
  - Simple constraints.
  - Range constraints.
  - Inversion constraints.
  - Weighted distribution constraints.
  - Pre-randomization function usage.
- **Solution**: [constraint_4.sv](./constraint_4.sv)

---

### **5. `constraint_5.sv`**
- **Problem**:
  1. Randomize a variable inside a module.
  2. Randomize an object with parameterized constraints.
  3. Demonstrate the use of macros and parameters in constraints.
- **Solution**: [constraint_5.sv](./constraint_5.sv)

---

### **6. `constraint_6.sv`**
- **Problem**: Generate unique values for:
  - Static arrays.
  - Dynamic arrays.
  - Associative arrays.
  - Individual variables.
- **Solution**: [constraint_6.sv](./constraint_6.sv)

---

## How to Run the Code

1. **Simulator**: Use a SystemVerilog-compatible simulator (e.g., Synopsys VCS, Cadence Xcelium, or Mentor Questa).
2. **Compilation**:
   ```bash
   vcs -sverilog constraint_1.sv constraint_2.sv constraint_3.sv constraint_4.sv constraint_5.sv constraint_6.sv
   ```
3. **Simulation**:
   ```bash
   ./simv
   ```

---

## Key Concepts

1. **Constraints**:
   - Used to restrict the range of values generated during randomization.
   - Example: `constraint A_c {A inside {[25:50]};}`

2. **Unique Values**:
   - Use `unique` to generate unique values for arrays or variables.

3. **Post-Randomization**:
   - Use `post_randomize()` to perform actions after randomization.

4. **Weighted Distribution**:
   - Use `dist` to assign probabilities to specific values.

5. **Dynamic Arrays**:
   - Use `rand bit[]` to declare dynamic arrays.

6. **Associative Arrays**:
   - Use `rand bit[scale_e]` to declare associative arrays with enumerated types.

---

## Notes

1. **`$write` vs `$display` vs `$strobe`**:
   - `$write`: Prints without a newline.
   - `$display`: Prints with a newline.
   - `$strobe`: Prints final values at the end of the simulation time step.

2. **2-State vs 4-State Variables**:
   - 2-state variables (`bit`, `int`, etc.) are more efficient for simulation.
   - 4-state variables (`logic`, `reg`) can represent `X` and `Z` states.

3. **Queues**:
   - Use `int queue[$:N]` for bounded queues.
   - Use `int queue[$]` for unbounded queues.


---

Feel free to explore the code and experiment with different constraints! If you have any questions or suggestions, please open an issue or submit a pull request.
