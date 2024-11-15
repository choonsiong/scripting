#!/bin/bash

# This script creates a list of the 20 most IP addresses from the given
# access log.

cut -d ' ' -f 1 $1 | sort | uniq -c | sort -n -r | head -n 20