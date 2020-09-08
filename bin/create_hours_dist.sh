#!/usr/bin/env bash

cd "$1"
cat **/*.txt | awk '{print $3}' | sort | uniq -c | awk '{printf "data.addRow([\x27"$2"\x27,"$1"]);\n" }' > scratch.txt
cd ..
cd html_components
../bin/wrap_contents.sh ../"$1"/scratch.txt hours_dist ../"$1"/hours_dist.html
cd ..
rm "$1"/scratch.txt

