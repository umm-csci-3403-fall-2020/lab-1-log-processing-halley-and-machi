#!/bin/bash
#Takes name of directory and creates file with tallied user failed log-ons

cd "$1"
cat *.txt | awk '{print $4}' | sort | uniq -c | awk '{printf "data.addRow([\x27"$2"\x27,"$1"]);"\n }' > scratch.txt
cd ..
cd html_components
../wrap_contents.sh ../"$1"/scratch.txt username_dist username_dist.html
mv username_dist.html ../"$1"
rm ../"$1"/scratch.txt

