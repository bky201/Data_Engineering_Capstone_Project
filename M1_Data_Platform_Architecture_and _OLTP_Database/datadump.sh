#!/bin/sh
# The above line tells the interpreter this code needs to be run as a shell script

#The line below will be printed to the screen. In the case of cron job, it will be printed to the logs.
echo "Pulling Database: This may take a few minutes"

# Create a backup
if mysqldump --host=172.21.102.91 --port=3306 --user=root --password='BbnMcyxCj8P587UOVjS8IJxF' sales sales_data > sales_data.sql; then
 echo 'sales_data.sql created'
else
 echo 'Error sales_data.sql was not created'
 exit
fi