#! /usr/bin/bash 

#Author:Ankit Patel
#Requires sshpass
#Requires host file in the working directory

touch host
host=host
echo "File created sucessfully"
if [ -f host ] 
then 
	echo "Enter the number of  ip addresses"
	read noip
	echo "Enter in the following format"
	echo "$.$.$.$"
	for (( i=0; i<$noip; i++))
	do 
		echo "Enter $i ip" 
		read ip
		echo $ip >> host
		
	done 
	#read username
	echo "Enter client's username..."
	read username
	echo "Enter package to install..."
	read packagename	
	for ip in $(< $host)
	do
		echo "Enter password for $ip host"
		read -s password
		echo "Establishing connection at $ip"
		echo "Initiating installation procedure for $packagename on $ip..."
		sshpass -p $password ssh -t -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -l $username $ip sudo pacman -S $packagename
	done 
else
	echo "File not found"
fi	
	
