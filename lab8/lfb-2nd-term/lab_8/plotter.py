import numpy as np
import matplotlib.pyplot as plt 
import os
from subprocess import Popen, PIPE
from time import sleep

data = []
for p in range(1,17):
    tmp = []
    for _ in range(50):
        program_path = os.getcwd()+"/07trhTimeTest"
        pr = Popen([program_path,str(p)], stdout=PIPE, stdin=PIPE)
        sleep(0.1)
        result = pr.stdout.readline().strip()
        tmp.append(int(result))

    data.append(sum(tmp)/len(tmp))
    print(f"n = {p}, done with {data[-1]}")

data = np.array(data)
plt.plot(range(1,17), data)
plt.savefig("times1.png")
# os.system(f"./07trhTimeTest {n_threads}")