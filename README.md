# ratticdb-import
Import from csv files to RattiDB MySQL Database

The script assumes that:
1. You have a running RatticDB instance
2. You have the MySQL root password saved in .my.cnf and will not ask for it. If you need you can add -p in the mysql 
commands to get a passwod prompt.
3. You have at leaset one group created in the application.

First compile the CSV file following the model.csv supplied. Please pay attention to the group ID that you are going
to make the ower of.
After you have a working CSV file run bash import.sh <filename>.csv

If you don't have any errors you should be able to see the users in the RatticDB interface.
