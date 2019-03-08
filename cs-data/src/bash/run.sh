#!/bin/bash

# create new table if does not exists
echo "current PWD is"
echo `pwd`
my_dir=`dirname $0`

cat ../$my_dir/conf/cars.sql

hive -f ../$my_dir/conf/cars.sql

# query the table, you can collect the output of it into some file
hive -e "select * from test.cars" >> /var/lib/jenkins/test.txt