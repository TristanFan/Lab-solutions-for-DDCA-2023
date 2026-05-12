# Lab Solutions for DDCA 2023

This repository contains my lab solutions for **Digital Design and Computer Architecture (DDCA) 2023**, taught by Prof. Onur Mutlu.

Course page: <https://safari.ethz.ch/digitaltechnik/spring2023/doku.php?id=start>

> This repository is for learning, review, and portfolio purposes. Please follow your course's academic integrity policy if you are taking DDCA or a similar course.

## Repository structure

```text
.
├── Lab2/                  # Basic combinational logic and adders
├── Lab4/                  # Sequential logic / finite-state-machine related files
├── Lab5/                  # ALU implementation
├── Lab6/                  # ALU variants and testbench files
├── Lab7/                  # MIPS assembly exercises
└── Lab8/                  # Single-cycle MIPS / memory-mapped I/O / final integration
```

Notes:

- Lab 3 was completed inside the Lab 2 project directory, so some Lab 2 and Lab 3 materials may be mixed.
- Some folders contain both a self-contained implementation and a version that reuses previous modules.
- File names are kept close to the original lab workflow to make comparison with the course material easier.

## Main contents

| Lab | Topic | Representative files |
| --- | --- | --- |
| Lab2 | Adders, decoders, basic digital logic | `FullAdder.v`, `FourBitAdder.v`, `Adder_segment.v`, `Decoder.v` |
| Lab4 | Finite-state machine and clock divider | `FiniteStateMachine.v`, `clk_div.v` |
| Lab5 | ALU design | `In-one-file/ALU.v`, `use-previous-parts/ALU_modifeid.v` |
| Lab6 | ALU testing and alternative implementations | `ALU_test.v`, `ALU_test.tcl`, `testvectors_hex.txt` |
| Lab7 | MIPS assembly programming | `lab7.asm`, `lab7_sad.asm`, helper assembly files |
| Lab8 | MIPS processor integration and I/O | `MIPS.v`, `ControlUnit.v`, `RegisterFile.v`, `DataMemory.v`, `InstructionMemory.v`, `top.v` |

## How to use

Clone the repository:

```bash
git clone https://github.com/TristanFan/Lab-solutions-for-DDCA-2023.git
cd Lab-solutions-for-DDCA-2023
```

Open the corresponding lab folder in your HDL tool or editor. The Verilog files were developed for the DDCA lab flow and may require the original lab project settings, constraints, or simulation setup.

For MIPS assembly exercises in Lab 7, the repository includes `Mars.jar` and helper scripts/files.

## Suggested workflow

1. Start from the lab handout and understand the required module interface.
2. Compare the relevant Verilog or assembly file in this repository.
3. Run simulation or synthesis in your own environment.
4. Modify and test incrementally instead of copying the final solution blindly.

## Disclaimer

This is a personal learning repository. The solutions may not be the only correct implementations and may not exactly match the official reference solutions.

## License

No license has been specified yet. If you want others to reuse the code formally, add a license such as MIT, BSD, or Apache-2.0.
