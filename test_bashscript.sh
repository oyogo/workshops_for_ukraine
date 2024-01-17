#!/bin/bash
LOG_LOCATION=/path/to/shinyserver/logs/
exec > $LOG_LOCATION/bashscriptlogs.log 2>&1 

a=10
b=20

sum=$(($a + $b))

echo "Sum is: $sum"
