#!/bin/bash

# This script creates a compressed backup of all files in
# ~/Documents directory and stores the backup in the ~/mybackups directory.

# Save the content of this directory
documentdir=~/Documents

# Backup location
backupdir=~/mybackups

# Create backup directory
mkdir -p $backupdir

# returns e.g., day=16 for 2024-11-16
day=$(date '+%d')

# Create backup, save as documents-<day>.tar.gz
echo "Backup file: $backupdir/documents-$day.tar.gz"
tar czf $backupdir/documents-$day.tar.gz -C $documentdir .
