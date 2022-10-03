#!/bin/bash

# Launch virt-manager and scream
# scream and bash script in the same directory

virt-manager
PIDX=$(ps k -start_time exo pid,comm,tty | grep ' '"virt-manager"' ') # $! doesn't work
PIDX=${PIDX%%virt-manager*}
echo $PIDX
./scream& # For Pulseaudio or Alsa with bridge networks
PIDZ=$!
echo $PIDZ

while [ $? -eq 0 ]; do
	sleep 5
	ps $PIDX 1>/dev/null
	if [ $? -ne 0 ]; then
		kill $PIDZ 2>/dev/null
		exit 0
	fi
done
