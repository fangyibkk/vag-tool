#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# this script is a batch implementation of dfa binary
# on directory that contain subdirectory /imfs
# then write to subdirectory \texttt{/dfa\_pair}

parent_in_dir=$1/
echo "===> Your input parent directory is: $1"
parent_out_dir=$2/
echo "===> Your output parent directory is: $2"

for d in $in_dir; do
    # echo $f
    # echo "$f.out"
    echo "===> working on $d"
    for f in $d/*; do
        echo "process imf $f"
	out_name=$parent_out_dir$d/$f

        # WARNING: hard code
        # create dir if not exists
        # [ -d $out_dir ] || mkdir -p $out_dir

        echo "write to $out_name"
        # ./dfa < $f > $out_name
    done
done

# out_dir=$(echo $d | sed "s/imfs/dfa_pair/g")
# out_name=$(echo "$f" | sed "s/imfs/dfa_pair/g")
