#!/bin/bash

# launch virt-manager and scream launch, IVSHMEM mode
# scream and bash script in the same directory

virt-manager
PIDX=$(ps k -start_time exo pid,comm,tty | grep ' '"virt-manager"' ') # $! doesn't work
PIDX=${PIDX%%virt-manager*}
echo $PIDX
PIDZ=0

while [ $? -eq 0 ]; do
	sleep 5
	if [ -f /dev/shm/scream-ivshmem ] && [ $PIDZ -eq 0 ]; then
		./scream -m /dev/shm/scream-ivshmem& # for IVSHMEM the device must exist 
		PIDZ=$!
		echo $PIDZ
	else
		ps $PIDX 1>/dev/null
		if [ $? -ne 0 ]; then
			if  [ $PIDZ -ne 0 ]; then
				kill $PIDZ 2>/dev/null
			fi
			exit 0
		fi
	fi
done
