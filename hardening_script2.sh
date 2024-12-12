#!/bin/bash

# Variable for the report output file, choose a NEW output file name
REPORT_FILE="hardening_output2.txt"

# Output the sshd configuration file
echo "Gathering details from sshd configuration file"

# Placeholder for command to get the sshd configuration file
echo "sshd configuration file:$(cat ~/.ssh/config)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Update packages and services
Echo “Updating packages and services”

# Placeholder for command to update packages
sudo apt update

# Placeholder for command to upgrade packages
sudo apt upgrade -y

echo "Packages have been updated and upgraded" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Placeholder for command to list all installed packages
echo "Installed Packages:$(apt list --installed)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

echo “Printing out logging configuration data”

# Placeholder for command to display logging data
echo "journald.conf file data: $(cat /etc/systemd/journal)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Placeholder for command to display logrotate data
echo "logrotate.conf file data:$(cat /etc/logrotate.conf)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

echo "Script execution completed. Check $REPORT_FILE for details."
