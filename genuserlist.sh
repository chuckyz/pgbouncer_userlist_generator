#!/bin/bash

# This removes /etc/pgbouncer/userlist.txt and replaces it with a valid configured file.
psql -Atq -U postgres -d postgres -c "SELECT concat('\"', usename, '\" \"', passwd, '\"') FROM pg_shadow" > /etc/pgbouncer/userlist.txt
