#! /bin/bash

cd /usr/bin
status=$(boinccmd --get_cc_status | grep -A 1 'CPU' | grep 'suspended')
if [[ $status == *"not"* ]]
then
boinccmd --set_run_mode never
else
boinccmd --set_run_mode auto
fi
