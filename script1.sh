#!/bin/bash
# Script 1: System Identity Report
# Author: Prince Raj | Course: Open Source Software
# --- Variables ---
STUDENT_NAME="Prince Raj" # Fill in your name
SOFTWARE_CHOICE="Linux Kernel " # Fill in your chosen software
# --- System info ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)

# --- Distro info ---
. /etc/os-release
DISTRO=$PRETTY_NAME
TODAY=$(date +"%Y-%m-%d")
LICENSE_MSG="${SOFTWARE_CHOICE}is released under the GNU General Public License v2."
# --- Display ---
echo "================================"
echo " Open Source Audit — $STUDENT_NAME"
echo "================================"
echo "Kernel : $KERNEL"
echo "User : $USER_NAME"
echo "Uptime : $UPTIME"
echo "Distro : $DISTRO"
echo "Date : $TODAY"
echo "License : $LICENSE_MSG"
