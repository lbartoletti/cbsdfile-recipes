#!/bin/sh
export PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"

res=$( cbsd jexec jname=gitlab <<EOF
/usr/local/bin/psql -U postgres -tAc "SELECT 1 FROM pg_database WHERE datname='gitlabhq_production'"
EOF
)

if [ "${res}" = "1" ]; then
	echo "Database gitlabhq_production exists"
	exit 0
else
	echo "Database gitlabhq_production not exist"
	exit 1
fi
