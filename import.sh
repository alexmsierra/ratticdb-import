#!/bin/sh

display_usage() { 
	echo "Please provide the csv file name" 
	echo -e "\nUsage:\n$0 file.csv \n"
	exit 1
}

if [ "$#" -ne 1 ]; then
   display_usage
fi

#copy csv file for the correct table name
cp $1 cred_cred.csv

#import to DB
mysqlimport -v --local --ignore-lines=1 --fields-terminated-by=, --columns='title,username,password,description,group_id' --local -u root rattic cred_cred.csv

#set required parameters
mysql -v -u root rattic -e \
"UPDATE cred_cred set created=NOW() where created='0000-00-00 00:00:00';
UPDATE cred_cred set modified=NOW() where modified='0000-00-00 00:00:00';
UPDATE cred_cred set iconname='Key.png' where iconname='';
COMMIT;"

#Housekeeping
rm cred_cred.csv
