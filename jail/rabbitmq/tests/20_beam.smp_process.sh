#!/bin/sh
export PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"

pid=$( cbsd jexec jname=rabbitmq pgrep beam.smp 2>/dev/null | grep . | awk '{printf $1}' )

if [ -n "${pid}" ]; then
	echo "beam.smp process exist: ${pid}" 2>&1
else
	echo "beam.smp process not exist" 2>&1
	exit 1
fi

exit 0
