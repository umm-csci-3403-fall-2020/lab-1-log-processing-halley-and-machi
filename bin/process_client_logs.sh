#!/bin/bash
#Takes a directory and outputs a text file with failed login data

cd "$1"
touch failed_login_data.txt
ls|zcat *.tgz| awk '{
	if(($6 == "Failed") && ($7 == "password") && !($9 == "invalid")) 
		print $1,$2,$3,$9,$11;

	else
		if(($6 == "Failed") && ($7 == "password") && ($9 == "invalid"))
			print $1,$2,$3,$11,$13;
		}'|sed 's/\:[0-9][0-9]//g' > failed_login_data.txt  
