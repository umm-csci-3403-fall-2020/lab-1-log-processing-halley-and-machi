#!/bin/bash
#Takes a directory and spits out an html file with country info

cd "$1"
cat **/*.txt | awk '{print $5}' | sort > tojoin.txt
join tojoin.txt ../etc/country_IP_map.txt|sort -k2| uniq -c -f1 | awk '{printf "data.addRow([\x27"$3"\x27,"$1"]);\n" }' > scratch.txt
cd ..
cd html_components
../bin/wrap_contents.sh ../"$1"/scratch.txt country_dist ../"$1"/country_dist.html
cd ..
#rm "$1"/scratch.txt
