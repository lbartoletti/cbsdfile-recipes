#!/bin/sh
export PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"
NC_CMD=$( which nc )

if [ -z "${NC_CMD}" ]; then
	echo "no such nc"
	exit 1
fi

ip4_addr=$( cbsd jget jname=redis mode=quiet ip4_addr )

echo "Probing: ${ip4_addr}:6379" 2>&1
${NC_CMD} -z ${ip4_addr} 6379 2>&1
ret=$?

exit ${ret}
