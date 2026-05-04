#!/bin/bash
# Author: AHughes20
# Date: 2026-05-04

if [ "$EUID" -ne 0 ]; then
    echo "run as root (sudo/su)"
    exit 1    # exit code 1 is used for user error(commonly missing input)
fi

if [ -z "$1" ]; then
    echo "Usage: $0 <directory>" 
    exit 1
fi
if [ -d "$1" ]; then
    dir=$(basename "$1")
    mkdir -p /var/backups
    tar -czvf "/var/backups/${dir}_$(date +%F).tar.gz" "$1"
else
    echo "Error: '$1' is not valid directory."   
    exit 2     # exit code 2 is used for invalid input
fi    
