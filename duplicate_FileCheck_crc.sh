#! /bin/bash


clear
declare checksum=()
#Check files on desktop
path=Desktop/* 
cd
echo "------------------------------"
echo "Redundancy file check">checksum.csv
echo "Author:Ankit Patel">>checksum.csv
echo "Path and filename  Checksum">>checksum.csv
for files in $path
do
	if [[ -f $files ]]
	then
	c=$(cksum "$files"|sed s/[^0-9]*//g|tr ' ' _)
	checksum+=($c)
	echo "$(ls $files) $(ls -s $files) $c">>checksum.csv
	else
		echo "$files is a directory"
	fi
done
echo "-------------------------------------------"
echo "Number of checksums ${#checksum[@]}"
file="checksum.csv"
echo "-----------------------------------------------"
echo "Duplicate file with following checksum found"
cut -d ' ' -f 4 $file|uniq -d 
echo "-----------------------------------------------"
echo -e "\nFinish"
	
