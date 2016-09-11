import matplotlib.pyplot as plt
import numpy as np

original = np.loadtxt('001_L2.txt')
no_spike = np.loadtxt('no-spike.txt')
spike = np.loadtxt('spike.txt')
med = np.loadtxt('med')

plt.plot(original, 'k', no_spike, 'b', spike, 'r', med, 'm')
plt.xlabel('index point of the signal')
plt.ylabel('acceleration ($m/s^2$)')
plt.title('Test plotting signal')
plt.show()
