# CMOS Inverter – NOT Gate

## Project Overview

This project demonstrates the design and simulation of a CMOS inverter (NOT gate) using Cadence Virtuoso.

A CMOS inverter is one of the fundamental building blocks of digital integrated circuits. It consists of a PMOS transistor connected to the supply voltage and an NMOS transistor connected to ground.

The circuit performs logical inversion:

- When Vin = LOW, Vout = HIGH
- When Vin = HIGH, Vout = LOW

The inverter was analyzed using DC and transient simulations.

---

## Circuit Description

The CMOS inverter consists of:

- One PMOS transistor
- One NMOS transistor
- VDD = 1.8 V
- Input voltage (Vin)
- Output voltage (Vout)

The gates of the PMOS and NMOS transistors are connected together to form the input.

Their drains are connected together to form the output.

The PMOS source is connected to VDD, while the NMOS source is connected to ground.

---

## Technology and Simulation

| Parameter | Value |
|---|---|
| Circuit | CMOS Inverter |
| Logic Function | NOT |
| Supply Voltage | 1.8 V |
| Simulation Tool | Cadence Virtuoso |
| Analysis | DC and Transient |
| Input Pattern | 1001001 |

---

## DC Analysis

A DC sweep was performed by varying the input voltage from 0 V to 1.8 V.

The resulting voltage-transfer characteristic demonstrates the inversion behavior of the CMOS inverter.

The switching region occurs around the middle of the supply voltage.

The observed operating point was approximately:

**883.23 mV**

At this region, the input and output voltages undergo a rapid transition.

### DC Response

![DC Response](Simulation/dc_response.png)

---

## Transient Analysis

A transient simulation was performed using a digital input pattern.

The applied input pattern was:

```text
1001001
