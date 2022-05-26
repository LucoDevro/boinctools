#! /bin/bash

cd /usr/bin
status=$(boinccmd --get_cc_status | grep -A 1 'GPU' | grep 'suspended')
if [[ $status == *"not"* ]]
then
boinccmd --set_gpu_mode never
else
boinccmd --set_gpu_mode auto
fi
