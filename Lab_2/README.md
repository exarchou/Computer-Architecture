# Lab 2



### 1. Run SPEC CPU2006 Benchmarks in gem5

In this first section the following **SPEC CPU2006 Benchmarks** were used, in order to discovers the CPU capabilities:

- **401.bzip2** is a benchmark which forces the CPU compress and decompress different types of files.

  ```bash
  ./build/ARM/gem5.opt -d spec_results/specbzip configs/example/se.py --cpu-type=MinorCPU --caches --l2cache -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000
  ```

- **429. mcf** is a benchmark which is derived from **MCF**, a program used for single-depot vehicle scheduling in public mass transportation.

  ```bash
  ./build/ARM/gem5.opt -d spec_results/specmcf configs/example/se.py --cpu-type=MinorCPU --caches --l2cache -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000
  ```

- **456.hmmer** is a benchmark which forces CPU to analyze protein sequences using profile hidden Markov models

  ```bash
  ./build/ARM/gem5.opt -d spec_results/spechmmer configs/example/se.py --cpu-type=MinorCPU --caches --l2cache -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000
  ```

- **458.sjeng** is a benchmark which uses a highly-ranked chess program that also plays several chess variants.

  ``` bash
  ./build/ARM/gem5.opt -d spec_results/specsjeng configs/example/se.py --cpu-type=MinorCPU --caches --l2cache -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000
  ```

- **470.lbm** is a benchmark which implements the so-called "Lattice Boltzmann Method" to simulate incompressible fluids in 3D.

  ```bash
  ./build/ARM/gem5.opt -d spec_results/speclibm configs/example/se.py --cpu-type=MinorCPU --caches --l2cache -c spec_cpu2006/470.lbm/src/speclibm -o "20spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" -I 100000000
  ```

  

#### 1.1 Cache Memory parameters

The generated files *config.ini* contain information about all configurable parameters of the simulation. The parameters about cache memories mainly concern: 

* **L1 Instruction Cache size**

  *Line 833, [system.cpu.icache]*: The variable size = 32768 indicates that the L1-Instruction Cache has a size of **32kB**.

* **L1 Instruction Cache Associativity**

  *Line 816, [system.cpu.icache]*: The variable assoc = 2 indicates that the L1-Instruction Cache has a 2-way Set Associativity.

* **L1 Data Cache size**

  *Line 169, [system.cpu.dcache]*: The variable size = 65536 indicates that the L1-Data Cache has a size of **64kB**.

* **L1 Data Cache Associativity**

  *Line 152, [system.cpu.dcache]*: The variable assoc = 2 indicates that the L1-Data Cache has a 2-way Set Associativity.

* **L2 Cache size**

  *Line 1078, [system.l2]*: The variable size = 2097152 indicates that L2-Cache has a size of **2MB**.

* **L2 Cache Associativity**

  *Line 1061, [system.l2]*: The variable assoc = 8 indicates that L2-Cache has a 8-way Set Associativity.

* **Cache Line size**

  *Line 15, [system]*: The variable cache_line_size = 64 indicates that the size of the Cache Line is **64 Bytes**

---



#### 1.2 Execution TIme, CPI & Miss Rates

|       | simulation seconds | cycles per instruction (CPI) | L2 cache miss rate | L1 i-cache miss rate | L1 d-cache miss rate |
| :---: | :----------------: | :--------------------------: | :----------------: | :------------------: | :------------------: |
| bzip  |      0.083654      |           1.673085           |      0.295247      |       0.000075       |       0.014312       |
|  mcf  |      0.062553      |           1.251067           |      0.067668      |       0.019032       |       0.002062       |
| hmmer |      0.070205      |           1.404100           |      0.031973      |       0.000170       |       0.006198       |
| sjeng |      0.513823      |          10.276466           |      0.999978      |       0.000020       |       0.121831       |
| libm  |      0.000045      |           8.039123           |      0.930807      |       0.090809       |       0.062190       |



