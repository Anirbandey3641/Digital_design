# CMOS NAND Gate

## Overview

This project implements a **2-input CMOS NAND gate** using complementary PMOS and NMOS transistor networks in **Cadence Virtuoso**.

The design was simulated to verify its **DC characteristics and transient switching behavior**.

## Design

The NAND gate consists of:

- **PMOS pull-up network:** PM1 and PM2 connected in parallel
- **NMOS pull-down network:** NM1 and NM2 connected in series
- Supply voltage: **VDD = 1.8 V**
- Load capacitance: **50 fF**
- Technology: **CMOS**
- Simulation tool: **Cadence Virtuoso**

### Transistor Dimensions

| Transistor | Type | W | L |
|------------|------|---|---|
| PM1 | PMOS | 1.02 µm | 180 nm |
| PM2 | PMOS | 1.02 µm | 180 nm |
| NM1 | NMOS | 1 µm | 180 nm |
| NM2 | NMOS | 1 µm | 180 nm |

## NAND Logic

The Boolean expression for a 2-input NAND gate is:

**Y = ~(A · B)**

| A | B | Vout |
|---|---|------|
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

The output becomes LOW only when both inputs A and B are HIGH.

## DC Analysis

A DC sweep was performed to observe the relationship between the input voltage and output voltage.

For the shown simulation:

- Input A = **900 mV**
- Output = **883.424 mV**
- VDD = **1.8 V**

The DC characteristic demonstrates the expected transition of the NAND output as the input voltage changes.

## Transient Analysis

Transient simulation was performed by applying digital input signals to **A** and **B**.

The waveform shows:

- Input A switching between approximately **0 V and 1.8 V**
- Input B switching between approximately **0 V and 1.8 V**
- Output switching between approximately **0 V and 1.8 V**
- The output goes LOW when both inputs are HIGH.
- The output goes HIGH when at least one input is LOW.

This verifies the expected NAND-gate switching operation.

## Simulation Results

### DC Response

The DC response confirms the voltage-transfer behavior of the CMOS NAND gate.

### Transient Response

The transient waveform confirms the digital switching behavior of the NAND gate for different input conditions.

## Conclusion

The **2-input CMOS NAND gate** was successfully designed and simulated in Cadence Virtuoso.

The DC and transient simulations demonstrate the expected NAND logic functionality, with the output remaining HIGH when at least one input is LOW and switching LOW when both inputs are HIGH.

## Tools Used

- Cadence Virtuoso
- CMOS Transistor-Level Design
- DC Analysis
- Transient Analysis

## Author

Anirban Dey

B.Tech — Electronics & VLSI
Maulana Abul Kalam Azad University of Technology, West Bengal

GitHub:
https://github.com/Anirbandey3641/Digital_design
