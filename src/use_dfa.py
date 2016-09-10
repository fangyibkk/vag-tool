#!/usr/bin/python

import numpy as np
import sys

from os import listdir 
from os.path import isfile, join

in_dir = sys.argv[1]
out_dir = sys.argv[2]
alpha_path = sys.argv[3]
filenames = [ file for file in listdir(in_dir) if file.endswith("out") and not file.startswith("0")]

alpha_list = ""
threshold = 0.5
qualified_imfs_list = []

for f in filenames:    
    s, F = np.genfromtxt( in_dir + f, unpack=True)
    alpha = np.polyfit( s, F, 1 )[0]
    alpha_list += "at {0} alpha = {1}\n".format( f, alpha )

    if(alpha > threshold):
        qualified_imfs_list.append(f)
        
# outputing
f = open(alpha_path, 'w')
f.closed
f.write(alpha_list)
print 'finish writing alpha'

print qualified_imfs_list
for i, f in enumerate(qualified_imfs_list):
    if i==0:
        out_signal = np.loadtxt( in_dir + f.replace('.out', ''))
    else :
        out_signal += np.loadtxt( in_dir + f.replace('.out','') )
    
print 'write signal after dfa'
np.savetxt( out_dir, out_signal )

