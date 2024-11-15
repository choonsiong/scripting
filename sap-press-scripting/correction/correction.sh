#!/bin/bash

# usage: ./correction.sh *.txt

# The script reads the entries from the correction_words.txt file line by line
# in the first loop and forms a sed command for each entry. In the second loop,
# the script applies sed to all files passed to the script. This script creates
# a backup of the original file. The correction_words file simply contains
# search and replace words separated by spaces, with the wrong spelling in the
# first column and the correct spelling in the second one.

sedcmd=""

while read -r findtxt replacetxt; do
	sedcmd+="s/$findtxt/$replacetxt/g;"
done < correction_words.txt

for filename in $*; do
	echo "Correct file $filename"
	sed -i .bak "$sedcmd" $filename
done