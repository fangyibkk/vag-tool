#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# this script is a batch implementation of dfa binary
# on directory that contain subdirectory /imfs
# then write to subdirectory \texttt{/dfa\_pair}

in_dir=$1
out_dir=$2

for d in $in_dir; do
    # echo $f
    # echo "$f.out"
    echo "===== working on $d ====="
    out_dir=$(echo $d | sed "s/imfs/dfa_pair/g")
    for f in $d/*; do
        echo "process imf $f"
        out_name=$(echo "$f" | sed "s/imfs/dfa_pair/g")

        # WARNING: hard code
        # create dir if not exists
        [ -d $out_dir ] || mkdir -p $out_dir

        echo "write to $out_name"
        ./dfa < $f > $out_name
    done
done
