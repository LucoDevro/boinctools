#! /bin/bash

cd /usr/bin
interval=1
if [[ $# -gt 0 ]]
then
	pause=$1
else
	pause=1
fi

while true
do
	clear
	pid=$(boinccmd --get_tasks | grep 'GPU' -A3 | grep 'PID' | grep -Eo "[1-9][0-9]*")
	boincstatus=$(boinccmd --get_cc_status | grep -A1 'CPU' | grep 'suspended')
	status=$(boinccmd --get_cc_status | grep -A1 'GPU' | grep 'suspended')
	temp=$(nvidia-settings -q gpucoretemp | grep -Eo -m1 "[0-9]{2}")
	echo -e "BOINC status:\t$boincstatus\nGPU status:\t$status\nGPU temperature:\t$temp"
	echo -e "BOINC GPU PID:\t$pid\n"
	if [[ -z "$pid" ]]
	then
		echo -ne 'No BOINC GPU process detected...\nPress any key to stop the throttler:\t'
		sleep $(($pause*$interval))
	else
		if [[ $status == *"not"* ]] && [[ $boincstatus == *"not"* ]]
		then
			echo -ne 'Stopping GPU workload...\nPress any key to stop throttling:\t'
			kill -STOP $pid
			sleep $(($pause*$interval))
			echo -e '\nResuming GPU workload...'
			kill -CONT $pid
		else
			echo -ne 'GPU for BOINC is paused by another process...\nPress any key to stop the throttler:\t'
			sleep $(($pause*$interval))
		fi
	fi
	read -n 1 -t $interval
	if [ $? = 0 ]
	then
		echo -ne 'Throttling will stop now and BOINC will get full power.\nPress any key to confirm this action...\t'
		read -n 1 -t 10
		if [ $? = 0 ]
		then
			clear
			exit
		fi
		echo 'No confirmation. Restart throttling...'
	fi
done
