#!/bin/sh

display_usage() { 
	echo "Please provide the csv file name" 
	echo -e "\nUsage:\n$0 file.csv \n" 
}

if [ "$#" -ne 1 ]; then
   display_usage
fi

#copy csv file for the correct table name
cp $i cred_cred.csv

#import to DB
mysqlimport -v --local --ignore-lines=1 --fields-terminated-by=, --columns='title,username,password,description' --local -u root -p rattic cred_cred.csv

#set required parameters

#Cleanup
rm cred_cred.csv
