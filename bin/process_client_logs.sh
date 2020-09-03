#!/bin/bash
#Takes a directory and outputs a text file with failed login data

cd "$1"

cat ls | awk 'match /invalid/ {print $1,$2,$3,$10,$12}' 
