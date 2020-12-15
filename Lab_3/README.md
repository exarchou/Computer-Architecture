# Lab 3

### 1. McPAT

McPAT (**M**ulti**c**ore **P**ower, **A**rea, and **T**iming) is an integrated power, area, and timing modeling framework for multithreaded, multicore, and manycore architectures. It models power, area, and timing simultaneously and consistently and supports comprehensive early stage design space exploration for multicore and manycore processor configurations ranging from 90nm to 22nm and beyond. McPAT includes models for the components of a complete chip multiprocessor, including in-order and out-of-order processor cores, networks-on-chip, shared caches, and integrated memory controllers. McPAT models timing, area, and dynamic, short-circuit, and leakage power for each of the device types forecast in the ITRS roadmap including bulk CMOS, SOI, and double-gate transistors. McPAT has a flexible XML interface to facilitate its use with different performance simulators.

To download McPAT the following GitHub Repository has to be cloned:

```
$ git clone https://github.com/kingmouf/cmcpat.git my_mcpat
```

##### 1.1 Dynamic Power & Leakage

Inside the folder *ProcessorDescriptionFiles* of the installation there are *xml* files with different processors specification. To run McPAT for Xeon processor, the following command must be used:

```
$ ./mcpat -infile ProcessorDescriptionFiles/Xeon.xml -print_level 1
```

where 1 stands for how analytic the results printed in the console will be.

Observing the results we can see informations about **Dynamic Power** and **Leakage**.

- **Peak Power**: is the upper limit of the total power that the CPU can dissipate. As we can see in the following equation, the power dissipation of CMOS circuits consists of three main components:

  [![img](https://github.com/exarchou/Computer-Architecture/raw/main/Lab_3/images/power.png)](https://github.com/exarchou/Computer-Architecture/blob/main/Lab_3/images/power.png)

- **Dynamic Power**: is the power spent in charging and discharging the capacitive loads when the circuit switches state, where *C* is the total load capacitance, *Vdd* is the supply voltage, *∆V* is the voltage swing during switching, *fclk* is the clock frequency, and *α* indicates the fraction of total circuit capacitance being charged during a clock cycle.

- **Short-circuit Power**: is the power consumed when both the pull-up and pull-down devices in a CMOS circuit are partially on for a small, but finite amount of time. Short-circuit power is about 10% of the total dynamic power.

- **Leakage**: this term refers to the static power consumed due to leakage current through the transistors, which in reality function as “imperfect” switches. There are two distinct leakage mechanisms, and the magnitude of each leakage current is proportional to the width of the transistor and depends on the logical state of the device. The first type of leakage, **subthreshold leakage**, occurs when a transistor that is supposedly in the off state actually allows a small current to pass between its source and drain. The second type, **gate leakage**, is the current that leaks through the gate terminal.



Consequently, we can understand that **Dynamic Power** is consumed, due to the capacitive load of the switching transistors, while **Leakage** refers to the imperfections of the inactive transistors of the system. 

Therefore, running a demanding program in our system, which requires more transistor to switch HIGH/LOW states, would result in increased Dynamic Power. On the other hand, a less demanding program, which would use a significant less number of transistor, causing more in idle transistor and thus expanded Leakage.

Obviously, those values do not depend on the execution time, because we are referring to Watt (Joule/sec),





##### 1.2 Low VS High Power CPU in a battery-supplied system

Let's suppose, at this point, that we have to choose between two processors, one consuming **4 Watt** and another consuming **40 Watt**, to embed in a battery-supplied system. Achieving a longer battery life with the second processor requires reduced execution time, namely the time of processor's activity. This information about the **total simulation time** is not produced by McPAT. Therefore, we could combine **McPAT** with **gem5** to calculate the energy efficiency of each processor.

Moreover, the efficiency of a CPU can be increased via the compression of *Dynamic Power* and *Leakages*:

- A reduction in the clock frequency of the CPU, as well as the parameter *a*, would have a straight impact on the *Dynamic Power* by reducing the frequency of transistors switchings, however the system would become significantly slower.
- The supply Voltage of the chip could be minimized, in order to achieve not only less *Dynamic Power*, but also less *Leakages*.
-  The *cut-off* of the supply of inactive transistors should be considered, in order to reduce the *Leakage*.









































