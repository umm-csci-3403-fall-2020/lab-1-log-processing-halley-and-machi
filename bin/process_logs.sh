#!/bin/bash
#Top Level - pulls everything together

dir=$(mktemp -d tmpXXX)

for var in "$@"
do
	name=$(basename "$var" .tgz)
        (
	cd "$dir" || exit
	mkdir "$name"
	cd .. 	
	tar -zxf "$var" -C "$dir"/"$name" 
	./bin/process_client_logs.sh "$dir"/"$name"
	)
done

./bin/create_username_dist.sh "$dir"
./bin/create_hours_dist.sh "$dir"
./bin/create_country_dist.sh "$dir"
./bin/assemble_report.sh "$dir"

moveTo=$(pwd)
mv "$dir"/failed_login_summary.html "$moveTo"

