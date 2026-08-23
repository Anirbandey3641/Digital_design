# 16-bit Arithmetic Logic Unit (ALU) — Verilog RTL

## Overview

This project implements a 16-bit Arithmetic Logic Unit (ALU) using Verilog HDL.

The ALU performs arithmetic, logical, comparison, and shift operations based on a 4-bit operation-select input. The design also generates Zero, Carry, and Overflow status flags.

The design was developed and functionally verified using Xilinx Vivado.

---

## Features

- 16-bit data path
- 4-bit operation selector
- Arithmetic operations
- Logical operations
- Shift operations
- Comparison operation
- Zero flag
- Carry flag
- Signed overflow detection
- Verilog HDL testbench
- Behavioral simulation
- RTL schematic analysis

---

## ALU Operations

| ALU_Sel | Operation | Description |
|----------|-----------|-------------|
| `0000` | ADD | A + B |
| `0001` | SUB | A - B |
| `0010` | AND | A & B |
| `0011` | OR | A \| B |
| `0100` | XOR | A ^ B |
| `0101` | NOT | ~A |
| `0110` | LEFT SHIFT | A << 1 |
| `0111` | RIGHT SHIFT | A >> 1 |
| `1000` | COMPARE | A < B |

---


## Block Diagram

```text
                 ┌─────────────────────────┐
 A[15:0] ───────►│                         │
                 │                         │────► ALU_Out[15:0]
 B[15:0] ───────►│       16-bit ALU        │────► Carry
                 │                         │────► Overflow
 ALU_Sel[3:0] ──►│                         │────► Zero
                 └─────────────────────────┘
```

---

## Synthesis Results

The 16-bit ALU was synthesized using Xilinx Vivado.

| Resource | Used | Utilization |
|----------|-----:|------------:|
| Slice LUTs | 96 | 0.29% |
| LUT as Logic | 96 | 0.29% |
| F7 Muxes | 13 | 0.08% |
| Bonded I/O | 55 | 26.19% |

### Resource Analysis

The design uses only 0.29% of the available Slice LUT resources, indicating a relatively small combinational logic footprint.

The 96 LUTs are used as logic rather than memory. The design also uses 13 F7 multiplexer resources for operation selection and associated combinational logic.

The I/O utilization is higher at 26.19% because the ALU exposes 16-bit operands, a 4-bit operation selector, a 16-bit result, and status flags as external signals.

## Automated Verification

A self-checking Verilog testbench was developed to automatically verify the ALU functionality.

The testbench checks:

- Addition
- Subtraction
- AND
- OR
- XOR
- NOT
- Left shift
- Right shift
- Comparison
- Carry generation
- Signed overflow
- Zero detection
- Boundary conditions

### Verification Result

```text
==============================================
        16-BIT ALU SELF-CHECKING TEST
==============================================

All functional and boundary-condition tests
passed successfully.

==============================================
       ALL TESTS PASSED SUCCESSFULLY
==============================================
```

---

```text
Add self-checking ALU testbench and verification
