#!/bin/bash
# remember to use BASH and not SH. SH doesn't support the time math to get the elapsed seconds.
# $0 is the script
# $1 should be the prefix for the database (a.k.a MySQL schema)
# $2 should be the prod1admin password

time_start=$(date -Iseconds)
echo "Time Start: $time_start"

t1=$SECONDS

now=$(date -I)
echo "Current Date: $now"

mysqldump -u prod1admin -p$2 -h usaa-eb-prod-1.cur7yokbkpst.us-east-1.rds.amazonaws.com --triggers --routines --events $1_integration > $1_dump_$now.sql

time_end=$(date -Iseconds)

t2=$SECONDS

elapsed=$((t2-t1))

echo "MySQL Dump: Complete: $time_end Elapsed: $elapsed"
