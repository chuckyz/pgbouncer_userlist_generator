#!/bin/bash

# This removes /etc/pgbouncer/userlist.txt and replaces it with a valid configured file.
rm /etc/pgbouncer/userlist.txt 
psql -Upostgres -c"select usename,passwd from pg_shadow order by 1" | sed 's/|//' | grep -v "+\|rows\|passwd" | awk 'NF > 0' | awk '{print "\""$1"\"","\""$2"\""}' >> /etc/pgbouncer/userlist.txt
chown pgbouncer: /etc/pgbouncer/userlist.txt
