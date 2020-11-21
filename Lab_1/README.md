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

The total number of accesses in L2 cache is **469**, as can be seen at line 523 *system.cpu_cluster.l2.overall_accesses::total* 

---



### 3. Types of CPUs and Memories

Gem5 can simulate 4 different types of CPUs. The common point of them is that they execute the instructions with respect to the order they arrive. This architecture is called in-order CPU.

- **Minor CPU**
  [gem5.org]
- **AtomicSimple CPU**
  []
- **TimingSimple CPU**
  []
- **HPI CPU**
  []



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

- 
-  
-  
-  
- 