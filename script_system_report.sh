#!/bin/bash

# --- Student info ---
STUDENT_NAME="Tamanna arora"
SOFTWARE_CHOICE="Git"

# --- Pull system info using command substitution ---
KERNEL=$(uname -r)                         # kernel version
USER_NAME=$(whoami)                        # currently logged in user
HOME_DIR=$HOME                             # home directory of user
UPTIME=$(uptime -p)                        # how long system has been running
CURR_DATE=$(date '+%A, %d %B %Y %H:%M:%S') # full date and time

# get distro name - works on most rpm and deb based systems
# /etc/os-release has this info on almost every modern linux
if [ -f /etc/os-release ]; then
    DISTRO=$(grep ^PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"
fi

# --- Print everything out ---
echo "========================================================"
echo "        Open Source Audit — $STUDENT_NAME"
echo "        Software Chosen : $SOFTWARE_CHOICE"
echo "========================================================"
echo ""
echo "  Distro   : $DISTRO"
echo "  Kernel   : $KERNEL"
echo "  User     : $USER_NAME"
echo "  Home Dir : $HOME_DIR"
echo "  Uptime   : $UPTIME"
echo "  DateTime : $CURR_DATE"
echo ""
echo "--------------------------------------------------------"
# Linux kernel and most GNU tools are under GPL v2
# The GPL ensures users can run, study, share and modify software freely
echo "  License Note:"
echo "  The Linux kernel is released under the GNU General Public"
echo "  License version 2 (GPLv2). This means the source code must"
echo "  always remain open and freely available to everyone."
echo "--------------------------------------------------------"
echo ""
