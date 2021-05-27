from scipy.signal import bode, TransferFunction, zpk2tf
import matplotlib.pyplot as plt

# Sample from scipy documentation
sys = TransferFunction([1], [1, 1])
w, mag, phase = bode(sys)
plt.figure()
plt.semilogx(w, mag)    # Bode magnitude plot
plt.figure()
plt.semilogx(w, phase)  # Bode phase plot
plt.show()


