# Lab 1



###  1. Parameters in starter_se.py

The file *starter_se.py* is using some default variables, as the parameters of the execution simulator in **gem5**. Through a parser function is offered to the user the possibility to choose those parameters, using arguments. These parameters are the following:

- *--cpu* : this argument declares the type of the kernel of the CPU, among 3 possible choices (atomic, minor, hpi, default="atomic").
- *--cpu-freq* : this argument declares clock frequency (default="4GHz").
- *--num-cores* : this argument declares the number of CPU cores (default=1).
- *--mem-type* : this argument declares the type of RAM (default="DDR3_1600_8x8").
- *--mem-channels* : this argument declares the number of memory channels (default=2).
- *--mem-ranks* : this argument declares the number of memory ranks per channel.
- *--mem-size* : this argument declares the physical memory size (default="2GB").

Moreover we can obtain some information about caches. It is observable that there are two levels of caches, L1 (private) and L2 (shared) respectively. Each line of cache has a size of 64 bytes.



### 2. System information by config.ini and config.json

Information about the simulated system are produced, after running the following bash command:

```bash
$ ./build/ARM/gem5.opt -d hello_result configs/example/arm/starter_se.py --cpu="minor" "tests/test-progs/hello/bin/arm/linux/hello"
```

Except for the output file *stats.txt*, which is produced after the simulation, two more files (namely *config.ini* and *confi.json*) are also generated. These files contain information about the system that is simulated by gem5.

---

##### 2a. Verification of system parameters

- *[system], line 21* : the variable mem_ranges=0:2147483648 indicates the physical addresses of the memory. As it is easily concluded the total size of the memory is 2GB (default value).

- *[system.clk_domain], line 44* :  the variable clock=1000 indicates that the frequency of the **system domain clock** is 1000000000000 / 1000 = 1GHz.
- *[system.cpu_cluster.clk_domain], line 58* : the variable clock = 250 indicates that the frequency of the **CPU clock** is set at 4GHz.
- *[system.cpu_cluster.cpus], line 65* :  the variable type =MinorCPU indicates the architecture of the CPU. The reason this variable has not its default value (AtomicSimpleCPU) is the argument --cpu="minor".
- *[system.mem_ctrls0.dram], line 1427* : the variable ranks_per_channel=2 indicates that there are 2 memory ranks in each channel. Consequently, the memory ranks for each channels are accessed through the names *system.mem_ctrls0* and *system.mem_ctrls1*, which can be found at line 13, under [system]. The same value of ranks_per_channel can be be obviously found at [system.mem_ctrls1.dram], line 1557.

**[TYPE OF MEMORY]**



---

##### 2b. Committed Instructions

The number of total committed instructions based on *stats.txt* is **5028**, as can be found at line 14 *system.cpu_cluster.cpus.committedInsts*.

**[config.ini results]**



---

##### 2c. L2 cache

The total number of accesses in L2 cache is **469**, as can be seen at line 523  under *system.cpu_cluster.l2.overall_accesses::total* 

---



### 3. Types of CPUs and Memories

Gem5 can simulate 4 different types of CPUs. The common point of them is that they execute the instructions with respect to the order they arrive. This architecture is called in-order CPU.

- **Minor CPU**
  [Minor](http://doxygen.gem5.org/release/current/namespaceMinor.html) is an in-order processor model with a fixed pipeline but configurable data structures and execute behavior. It is intended to be used to model processors with strict in-order execution behavior and allows visualization of an instruction’s position in the pipeline through the MinorTrace/minorview.py format/tool. The intention is to provide a framework for micro-architecturally correlating the model with a particular, chosen processor with similar capabilities. The hierarchy of major unit ownership from [MinorCPU](http://doxygen.gem5.org/release/current/classMinorCPU.html) down looks like this:
  
  --- Pipeline - container for the pipeline, owns the cyclic 'tick' event mechanism and the idling (cycle skipping) mechanism.
  
  --- --- Fetch1 - instruction fetch unit responsible for fetching cache lines (or parts of lines from the I-cache interface).
  
  --- --- --- Fetch1::IcachePort - interface to the I-cache from Fetch1.
  
  --- --- Fetch2 - line to instruction decomposition.
  
  --- --- Decode - instruction to micro-op decomposition.
  
  --- --- Execute - instruction execution and data memory interface.
  
  --- --- --- LSQ - load store queue for memory ref. instructions.
  
  --- --- --- LSQ::DcachePort - interface to the D-ache from Execute.
  
  MinorCPU has a four-stage pipeline, which is consisted of: fetching lines, decomposition into macro-ops, decomposition of macro-ops into micro-ops and execute.
  
- **AtomicSimple CPU**
  The AtomicSimpleCPU is the version of SimpleCPU that uses atomic memory accesses. It uses the latency estimates from the atomic accesses to estimate overall cache access time. The AtomicSimpleCPU is derived from BaseSimpleCPU, and implements functions to read and write memory, and also to tick, which defines what happens every CPU cycle. It defines the port that is used to hook up to memory, and connects the CPU to the cache.
  
- **TimingSimple CPU**
  The TimingSimpleCPU is the version of SimpleCPU that uses timing memory accesses. It stalls on cache accesses and waits for the memory system to respond prior to proceeding. Like the AtomicSimpleCPU, the TimingSimpleCPU is also derived from BaseSimpleCPU, and implements the same set of functions. It defines the port that is used to hook up to memory, and connects the CPU to the cache. It also defines the necessary functions for handling the response from memory to the accesses sent out.
  
- **Base Simple CPU**
  
  The BaseSimpleCPU serves several purposes:
  
  - ​	Holds architected state, stats common across the SimpleCPU models.
  - ​	Defines functions for checking for interrupts, setting up a fetch request, handling pre-execute setup, handling post-execute actions, and advancing the PC to the next instruction. These functions are also common across the SimpleCPU models.
  - ​	Implements the ExecContext interface.
  
  The BaseSimpleCPU can not be run on its own but need one class that is inherited from the previous two models.
  
- **HPI CPU**
  High Performance In-Order (HPI) CPU is based on the Arm architecture and is built to represent a modern in-order Armv8-A implementation. One of its basic characteristics is that it uses the same 4-stage pipeline that is used in the Minor CPU. Moreover, there are separate instruction and data buses, hence an instruction cache (ICache) and a data cache (DCache). So, there are distinct instruction and data L1 caches backed by a unified L2 cache.



##### 3a. MinorCPU vs TimingSimpleCPU 

A very simple C program that calculates the factorial of 20 is written. In order to simulate this execution in **gem5** the program *test.c* was cross-compiled, using the command:

```bash
arm-linux-gnueabihf-gcc --static test.c -o test_arm
```

The executable file was run on an ARM simulator with **Minor CPU**, using the command:

```bash
./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/MinorCPU configs/example/se.py --cpu-type=MinorCPU --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'
```

The same simulation was implemented for **TimingSimple CPU**:

```bash
./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/TimingSimpleCPU configs/example/se.py --cpu-type=TimingSimpleCPU --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'
```

The results of the simulation are saved as *stats.txt* files. The performance of each CPU is summed up  in the total number of ticks for the clock of CPU:

- *MinorCPU*: 35,469,000 ticks
- *TimingSimpleCPU*: 42,349,000 ticks

---

##### 3b. Results Interpretation

As it was expected the execution with Minor kernel is much faster than the execution with TimingSimple kernel. The reason for this is the 4-stage pipeline of Minor kernel architecture. Using this architecture one instruction can be fetched by the CPU, while the previous is being processed by the ALU.



---

##### 3c. MinorCPU vs TimingSimpleCPU  with respect to Clock and RAM

In this final section we want to simulate the performance of Minor and Timing Simple CPU with respect to Clock Frequency and the technology of the RAM chip. For this reason a shell script was created, which implements the previous simulation for different:

- **CPU types**: *--cpu-type=MinorCPU*  or   *--cpu-type=TimingSimpleCPU*
- **CPU clocks**: *--cpu-clock=xGHz* , where x = 2,3,4
- **Memory types**: *--mem-type=DDR3_1600_8x8*  or  *--mem-type=DDR4_2400_8x8*  or   *--mem-type=LPDDR2_S4_1066_1x32*

These parameters are given to bash commands with the form of arguments. The final shell script is called with the following command:

```bash
. script.sh
```

The results of the simulations, regarding the total clock ticks, are summarized on the tables below:

- Total ticks of **Minor CPU**:
  

|        | LPDDR2_S4_1066_1x32 | DDR3_1600_8x8 | DDR4_2400_8x8 |
| :----: | :-----------------: | :-----------: | :-----------: |
| 2.0GHz |     44,874,000      |  35,469,000   |  34,646,000   |
| 3.0GHz |     43,023,600      |  33,116,517   |  32,253,381   |
| 4.0GHz |     41,466,000      |  31,537,000   |  30,504,000   |



- Total ticks of **TimingSimple CPU**:

|        | LPDDR2_S4_1066_1x32 | DDR3_1600_8x8 | DDR4_2400_8x8 |
| :----: | :-----------------: | :-----------: | :-----------: |
| 2.0GHz |     50,923,000      |  42,349,000   |  42,244,000   |
| 3.0GHz |     45,943,011      |  37,553,076   |  37,251,045   |
| 4.0GHz |     43,337,000      |  34,859,000   |  34,408,000   |

Useful statistic conclusions come of these results:

- MinorCPU is noticeably faster than TimingSimpleCPU for the same simulation.
-  Upgrading from LPDDR2_S4_1066_1x32 to DDR3_1600_8x8 equals an important increment in speed of execution.
-  Upgrading from DDR3_1600_8x8 to DDR4_2400_8x8 equals a weak increment in speed of execution.
-  Upgrading from 2GHz to 3GHz equals an increment in speed of execution of about 5-7% for MinorCPU and about 11-13% for TimingSimpleCPU.
- Upgrading from 3GHz to 4GHz equals an increment in speed of execution of about 4-5% for MinorCPU and about 5-8% for TimingSimpleCPU.