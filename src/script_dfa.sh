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

for d in $parent_in_dir/*; do
    echo "===> working on subdirectory $d"
    for f in $d/*; do
        echo "process file in the subdirectory: $f"
	out_dir=$parent_out_dir$(echo $d | sed "s;$parent_in_dir;;")
	out_name=$parent_out_dir$(echo $f | sed "s;$parent_in_dir;;")
	# create dir if not exists
	[ -d $out_dir ] || mkdir -p $out_dir

	echo "write to $out_name"
        dfa < $f > $out_name
    done
done
