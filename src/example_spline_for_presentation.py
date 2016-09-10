from pyeemd import eemd
from pyeemd.utils import plot_imfs

import numpy as np
import matplotlib
import matplotlib.pyplot as plt

from os import listdir 
from os.path import isfile, join

matplotlib.rcParams.update({'font.size': 10})

# now at progress/emd
in_dir = "../../data/txt_data/"
filenames = [ file for file in listdir(in_dir) if file.endswith("txt")]
knee = np.loadtxt( in_dir + filenames[10], delimiter='\n')

print 'running eemd'
imfs = eemd( knee, ensemble_size=50, num_siftings=10)

plot_imfs(imfs, new_figs=True, plot_splines=True)

plt.show()
