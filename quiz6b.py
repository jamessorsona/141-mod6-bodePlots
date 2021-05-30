import matplotlib.pyplot as plt
import numpy as np
from scipy import signal
from math import log10, sqrt

############ PARAMETERS ##############
print()

A = 200
zeros = []
poles = [-10**4, -10**6]

p1, p2 = poles
print("Gain:", A)
print("Pole 1:", p1)
print("Pole 2:", p2)
print()


########## COMPUTATIONS #############
##### 1 Open-Loop DC Gain (dB)
Ao = 20 * log10(A)
##### 2 Open-Loop Bandwidth
# just the first pole
## Feedback Factor
F = (  ( (p1+p2)**2 / (4*p1*p2) )  -1) / A
##### 3 Loop Gain
T = A*F
##### 4 DC Closed Loop Gain
To_mag = A/(1+T)
To = 20*log10( To_mag )
##### 5 Absolute Frequency of Coincident Poles
# just the average of the two poles
wcl = abs((p1+p2)/2)
##### 6
closedLoopBW = wcl * sqrt(To_mag / pow(10, (To-3)/20) - 1)


####################################
print("1. Open-loop DC Gain (dB):", Ao)
# print("Feedback Factor:", F)
print("2. Open Loop Bandwidth:", p1)
print("3. Loop Gain:", T)
print("4. DC Closed Loop Gain (dB):", To)
print("5. Absolute Frequency of Coincident Poles:", wcl)
print("6. Closed Loop BW with Coincident Poles:", closedLoopBW)


##################### BODE PLOTS ##########################
gain = A * np.prod(poles, dtype=np.float64) 
num, den = signal.zpk2tf(zeros, poles, gain)

H = signal.TransferFunction(num, den)
w, mag, phase = signal.bode(H)

plt.figure()
plt.semilogx(w, mag)
plt.figure()
plt.semilogx(w, phase)
plt.show()

