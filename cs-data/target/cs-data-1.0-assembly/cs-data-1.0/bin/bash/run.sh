#!/bin/bash

# create new table if does not exists

cwd
hive -f ../conf/cars.sql

# query the table, you can collect the output of it into some file
hive -e "select * from test.cars"