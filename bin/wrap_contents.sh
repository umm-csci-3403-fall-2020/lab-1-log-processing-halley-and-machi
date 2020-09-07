#!/bin/bash
#Script for wraping text in a header and footer
#Takes 3 arguments (file.txt specifier destinationFile.html)

header="$2"_header.html
footer="$2"_footer.html
touch "$3"

cat "$header" "$1" "$footer" > "$3"
