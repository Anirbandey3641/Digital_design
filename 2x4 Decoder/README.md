# 2-to-4 Decoder — Verilog RTL

## Overview

This project implements a **2-to-4 Binary Decoder** using Verilog HDL.

A decoder is a combinational digital circuit that converts an `N-bit` binary input into one of `2^N` possible output lines.

This project uses **2 input lines and 4 output lines**. For every possible combination of the two inputs, exactly one output is activated HIGH.

The design was implemented and verified using **Xilinx Vivado** through RTL schematic analysis and behavioral simulation.

---

## Features

- 2-bit input
- 4-bit decoded output
- Active-HIGH outputs
- One-hot output operation
- Combinational logic design
- Implemented using NOT and AND logic
- Verilog HDL implementation
- RTL schematic analysis
- Behavioral simulation
- Self-checking testbench
- Verification of all input combinations

---

## Input and Output

| Signal | Width | Description |
|:---|:---:|:---|
| `a` | 1 bit | First decoder input |
| `b` | 1 bit | Second decoder input |
| `o1` | 1 bit | Output corresponding to input `00` |
| `o2` | 1 bit | Output corresponding to input `01` |
| `o3` | 1 bit | Output corresponding to input `10` |
| `o4` | 1 bit | Output corresponding to input `11` |

---

## Truth Table

| `a` | `b` | `o1` | `o2` | `o3` | `o4` |
|:---:|:---:|:---:|:---:|:---:|:---:|
| 0 | 0 | 1 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 | 0 | 0 |
| 1 | 0 | 0 | 0 | 1 | 0 |
| 1 | 1 | 0 | 0 | 0 | 1 |

The decoder follows a **one-hot output scheme**, where only one output is HIGH for each valid input combination.

---

## Boolean Expressions

The four outputs correspond to the four possible minterms of the two input variables:

| Output | Boolean Expression |
|:---:|:---|
| `o1` | `~a & ~b` |
| `o2` | `~a & b` |
| `o3` | `a & ~b` |
| `o4` | `a & b` |

---

## Functional Operation

The decoder maps the two input bits to one of four output lines:

| Input | Active Output |
|:---:|:---:|
| `00` | `o1` |
| `01` | `o2` |
| `10` | `o3` |
| `11` | `o4` |

For example:

- When `a = 0` and `b = 0`, `o1` becomes HIGH.
- When `a = 0` and `b = 1`, `o2` becomes HIGH.
- When `a = 1` and `b = 0`, `o3` becomes HIGH.
- When `a = 1` and `b = 1`, `o4` becomes HIGH.

---

## Logic Implementation

The decoder is implemented using basic combinational logic.

The design consists of:

- 2 NOT gates for generating the complemented inputs
- 4 two-input AND gates for generating the decoded outputs

The structure implements the four required minterms of the two input variables.

---

## Block Diagram

```text
                 ┌──────────────────────┐
                 │                      │
        a ──────►│                      │────► o1
                 │                      │
        b ──────►│      2-to-4          │────► o2
                 │      DECODER         │
                 │                      │────► o3
                 │                      │
                 │                      │────► o4
                 └──────────────────────┘
```
---

## RTL Schematic

The RTL schematic generated in **Xilinx Vivado** represents the internal combinational logic of the 2-to-4 decoder.

The design consists of:

- 2 input signals: `a` and `b`
- 2 inverter (NOT) gates
- 4 two-input AND gates
- 4 output signals: `o1`, `o2`, `o3`, and `o4`

The inverter gates generate the complemented input signals `~a` and `~b`. These signals, along with the original inputs, are connected to the four AND gates to generate the decoded outputs.

The implemented logic is:

- `o1 = ~a & ~b`
- `o2 = ~a & b`
- `o3 = a & ~b`
- `o4 = a & b`

The Vivado RTL schematic confirms that the decoder is implemented as a purely **combinational logic circuit** using NOT and AND gates.

### RTL Schematic

![2-to-4 Decoder RTL Schematic](rtl_schematic/Screenshot (271).png)

## Simulation Waveform

The behavioral simulation waveform demonstrates the relationship between the two input signals and the four decoded outputs.

The waveform confirms that only the corresponding output becomes HIGH for each input combination.

### Simulation Waveform

![Simulation Waveform](simulation/waveform.png)

---

## Project Structure

```text
Decoder_2to4/
│
├── decoder_2to4.v
├── decoder_2to4_tb.v
├── README.md
│
├── simulation/
│   └── waveform.png
│
└── rtl_schematic/
    └── decoder_rtl.png

```
## Conclusion

This project demonstrates the successful implementation of a **2-to-4 binary decoder using Verilog HDL**.

The decoder converts a 2-bit binary input into one of four mutually exclusive active-HIGH outputs. The design uses basic NOT and AND logic to implement the required Boolean expressions.

All four possible input combinations were tested using a self-checking testbench, and the decoder successfully produced the expected one-hot output for each input combination.

The project provides a practical understanding of **combinational logic, binary decoding, Boolean expressions, Verilog HDL, simulation, and RTL schematic analysis**.
