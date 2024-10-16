#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "usage: $0 <column> [file.csv]" 
    exit 0
fi

column=$1
file=${2:-/dev/stdin}

    tail -n +2 "$file" | cut -d ',' -f "$column"|{	 sum=0						  count=0
	while read n; do
	    sum=$(echo "$sum + $n" | bc)
	    count=$((count + 1))
	done
	if [ "$count" -gt 0 ]; then
	    mean=$(echo "scale=2; $sum / $count" | bc)
	    echo "mean of column $column: $mean"
	else
	    echo "no data in column $column" 1>&2
	    exit 0
	fi
    }
