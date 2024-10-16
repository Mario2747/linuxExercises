#!/bin/bash

cat Property_Tax_Roll.csv | \
grep "MADISON SCHOOLS" | \
cut -d ',' -f 7 | \
{ sum=0; count=0; while read value; do sum=$(echo "$sum + $value" | bc); count=$((count + 1)); done; \
if [ "$count" -gt 0 ]; then \
    avg=$(echo "scale=2; $sum / $count" | bc); \
    echo "Total Assessed Value Sum for MADISON SCHOOLS: $sum"; \
    echo "Total Assessed Value Average for MADISON SCHOOLS: $avg"; \
else \
    echo "No records found"; \
fi; }
