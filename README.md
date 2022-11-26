# boinctools
A small suite of bash scripts to control operation of my BOINC setup (PC with one NVIDIA GPU running Linux Mint 20.2)
- `boinc-toggle.sh` & `boinc-gpu-toggle.sh`: toggling resp. all BOINC computing and GPU-only BOINC computing. Ideal to link to a keyboard shortcut.
- `Tthrottle.sh`: throttles GPU computing by interspersing computing with a pause of predefined length. Quick fix to limit your GPU core temperature, or to regain some GPU cycles for non-BOINC use.

### Dependencies
- Relies on the BOINC command-line tool `boinccmd`
- Assumes ***one*** installed NVIDIA GPU
- `nvidia-settings`

### Usage
Fire up a terminal, cd to the location where you downloaded the scripts and run
```
bash Tthrottle.sh $interval
```
with `$interval` the length of a pause between work cycles in seconds. If left blank, the default value of 1 second is applied.

In case you don't have permission to use the `kill` command, try running it with `sudo`.
