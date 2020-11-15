# Question 3a

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/MinorCPU configs/example/se.py --cpu-type=MinorCPU --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/TimingSimpleCPU configs/example/se.py --cpu-type=TimingSimpleCPU --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'

# Question 3c

# MinorCPU

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/Minor_DDR3_1600_8x8_2GHz configs/example/se.py --cpu-type=MinorCPU --cpu-clock=2GHz --mem-type=DDR3_1600_8x8 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/Minor_DDR4_2400_8x8_2GHz configs/example/se.py --cpu-type=MinorCPU --cpu-clock=2GHz --mem-type=DDR4_2400_8x8 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/Minor_LPDDR2_S4_1066_1x32_2GHz configs/example/se.py --cpu-type=MinorCPU --cpu-clock=2GHz --mem-type=LPDDR2_S4_1066_1x32 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'


./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/Minor_DDR3_1600_8x8_3GHz configs/example/se.py --cpu-type=MinorCPU --cpu-clock=3GHz --mem-type=DDR3_1600_8x8 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/Minor_DDR4_2400_8x8_3GHz configs/example/se.py --cpu-type=MinorCPU --cpu-clock=3GHz --mem-type=DDR4_2400_8x8 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/Minor_LPDDR2_S4_1066_1x32_3GHz configs/example/se.py --cpu-type=MinorCPU --cpu-clock=3GHz --mem-type=LPDDR2_S4_1066_1x32 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'


./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/Minor_DDR3_1600_8x8_4GHz configs/example/se.py --cpu-type=MinorCPU --cpu-clock=4GHz --mem-type=DDR3_1600_8x8 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/Minor_DDR4_2400_8x8_4GHz configs/example/se.py --cpu-type=MinorCPU --cpu-clock=4GHz --mem-type=DDR4_2400_8x8 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/Minor_LPDDR2_S4_1066_1x32_4GHz configs/example/se.py --cpu-type=MinorCPU --cpu-clock=4GHz --mem-type=LPDDR2_S4_1066_1x32 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'


# TimingSimpleCPU

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/TimingSimple_DDR3_1600_8x8_2GHz configs/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock=2GHz --mem-type=DDR3_1600_8x8 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/TimingSimple_DDR4_2400_8x8_2GHz configs/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock=2GHz --mem-type=DDR4_2400_8x8 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/TimingSimple_LPDDR2_S4_1066_1x32_2GHz configs/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock=2GHz --mem-type=LPDDR2_S4_1066_1x32 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'


./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/TimingSimple_DDR3_1600_8x8_3GHz configs/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock=3GHz --mem-type=DDR3_1600_8x8 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/TimingSimple_DDR4_2400_8x8_3GHz configs/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock=3GHz --mem-type=DDR4_2400_8x8 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/TimingSimple_LPDDR2_S4_1066_1x32_3GHz configs/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock=3GHz --mem-type=LPDDR2_S4_1066_1x32 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'


./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/TimingSimple_DDR3_1600_8x8_4GHz configs/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock=4GHz --mem-type=DDR3_1600_8x8 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/TimingSimple_DDR4_2400_8x8_4GHz configs/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock=4GHz --mem-type=DDR4_2400_8x8 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'

./build/ARM/gem5.opt -d /home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/Question_3c/TimingSimple_LPDDR2_S4_1066_1x32_4GHz configs/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock=4GHz --mem-type=LPDDR2_S4_1066_1x32 --caches -c '/home/dimitris/Desktop/GitHub/Computer-Architecture/Lab_1/test_arm'



