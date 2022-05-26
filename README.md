# boinctools
A small suite of bash scripts to control the workings of my personal BOINC setup (on a Linux Mint 20.2 machine)
- `boinc-toggle.sh` & `boinc-gpu-toggle.sh`: toggling resp. all BOINC computing and GPU-only BOINC computing. Ideal to link to a keyboard shortcut.
- `Tthrottle.sh`: throttles GPU computing by interspersing computing with a pause of predefined length. Quick fix to limit your GPU core temperature, or to regain some GPU cycles for non-BOINC use.

**Dependencies**
- Relies on the BOINC command-line tool `boinccmd`
- Assumes a NVIDIA GPU and `nvidia-settings` to be installed
