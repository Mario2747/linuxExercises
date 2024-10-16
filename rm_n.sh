#!/bin/bash

# check the number of input parameters (should equal to 2, i.e. <dir> and <n>)
if [ $# -ne 2 ]; then
  echo "Usage: $0 <dir> <n>" 1>&2
  exit 1
fi

# check if the <dir> inputted exists
if [ ! -d "$dir" ]; then
  echo "Error: Directory $dir does not exist." 1>&2
  exit 1
fi

dir=$1 # Assign the first argument to the variable dir
n=$2 # Assign the second argument to the variable n

# find and delete
find "$dir" -type f -size +"${n}"c -exec rm {} \;
echo "All files in $dir larger than $n bytes have been removed."

