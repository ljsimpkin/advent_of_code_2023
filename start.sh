#!/bin/bash

# Find the highest numbered directory
max_dir=$(ls | grep -Eo '^[0-9]+$' | sort -nr | head -n 1)

# If no numbered directories exist, start at 1
if [[ -z "$max_dir" ]]; then
    max_dir=0
fi

# Increment the max directory number
next_dir=$((max_dir + 1))

# Create the new directory
mkdir $next_dir
