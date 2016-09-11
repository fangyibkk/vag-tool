#!/usr/bin/python
import numpy as np
import sys
from natsort import natsorted, ns

from os import listdir , makedirs
from os.path import isfile, isdir, join, exists

def isPass(alpha):
    criterion = 0.5
    # return alpha > criterion    
    return alpha < criterion

alpha_criterion = {
    # EDIT HERE
    # "dir_string": "discard_lt_0.5",
    "dir_string": "discard_gt_0.5",
    "isPass": isPass
}


# EDIT HERE
processing_type = "sr"
dir_prefix = "../../data/{0}/".format( processing_type )
imfs_dir = dir_prefix + "imfs/"
dfa_pair_dir = dir_prefix + "dfa_pair/"
alpha_dir = dir_prefix + "alpha/"
signal_after_dfa_dir = dir_prefix + "/signal/after_dfa/{0}/".format(alpha_criterion["dir_string"])


# MAKEDIR if not exists
for out_dir_to_check in [ dfa_pair_dir, alpha_dir, signal_after_dfa_dir ]:
    if not exists( out_dir_to_check ):
        print 'directory doesn\'t exist make {0}'.format( out_dir_to_check )
        makedirs( out_dir_to_check )


# dir will cause a name crash
direcs = [ direc for direc in listdir(dfa_pair_dir) if isdir(join(dfa_pair_dir,direc)) ]

for direc in direcs:
    
    in_dir = dfa_pair_dir + direc + '/'

    filenames = [ file for file in listdir(in_dir) if file.endswith("txt") and not file.startswith("0") ]
    filenames = natsorted( filenames, key=lambda y: y.lower() )
    filenames = natsorted( filenames, alg=ns.IGNORECASE )
    # mutated it

    print filenames

    alpha_list = ""
    threshold = 0.5
    qualified_imfs_list = []

    for f in filenames[:-1]:
        print in_dir + f
        s, F = np.genfromtxt( in_dir + f, unpack=True)
        alpha = np.polyfit( s, F, 1 )[0]
        alpha_list += "{0},{1}\n".format( f.replace('.txt',''), alpha )

        if( alpha_criterion["isPass"](alpha) ):
            qualified_imfs_list.append(f)


    # OUTPUTING

    print 'write to ' + alpha_dir + direc + '-alpha.txt'


    f = open( alpha_dir + direc + '-alpha.txt', 'w')
    f.closed
    f.write(alpha_list)

    pretty_list = [ l.replace('.txt','') for l in qualified_imfs_list ]
    pretty_list.sort( key=int ) # mutated
    print 'qualified imfs are: ' + ', '.join(pretty_list)

    for i, f in enumerate(qualified_imfs_list):
        if i==0:
            out_signal = np.loadtxt( imfs_dir + direc + '/' + f )
        else :
            out_signal += np.loadtxt( imfs_dir + direc + '/' + f )


    print 'write to ' + signal_after_dfa_dir + direc + '.dfa.txt'
    np.savetxt( signal_after_dfa_dir + direc + '.dfa.txt', out_signal )
