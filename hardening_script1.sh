#!/bin/bash

#variable for the report output file, chose file output name
REPORT_FILE="Hardening_Report.txt"

#output the hostname
echo "Gathering hostname..."
#placeholder command for hostname
echo "Hostname: $(hostname)" >> $REPORT_FILE
prinf"\n" >> $REPORT_FILE

#output the OS version
echo "Gathering OS version..."
#placeholder for command to get the OS version
echo "OS Version: $(uname -a)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Output memory information
echo "Gathering memory information..."
# Placeholder for command to get memory info
echo "Memory Information: $(free -m)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Output uptime information
echo "Gathering uptime information..."
# Placeholder for command to get uptime info
echo "Uptime Information: $(uptime)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Backup the OS
echo "Backing up the OS..."
# Placeholder for command to back up the OS

sudo tar -cvpzf /baker_street_backup.tar.gz --exclude=/baker_street_backup.tar.gz --exclude=/proc --exclude=/tmp --exclude=/mnt --exclude=/sys --exclude=/dev --exclude=/run /

echo "OS backup completed." >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Output the sudoers file to the report
echo "Gathering sudoers file..."
# Placeholder for command to output sudoers file
echo "Sudoers file:$(cat /etc/sudoers)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Script to check for files with world permissions and update them
echo "Checking for files with world permissions..."

#removes read, write, and execute for others(world)
sudo chmod -R o-rwx /home

# Placeholder for command to find and update files with world permissions
echo "World permissions have been removed from any files found." >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Find specific files and update their permissions
echo "Updating permissions for specific scripts..."

# Engineering scripts - Only members of the engineering group
echo "Updating permissions for Engineering scripts."

# Placeholder for command to update permissions
find -iname "*engineering" -exec mod 770 {} +

echo "Permissions updated for Engineering scripts." >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Research scripts - Only members of the research group
echo "Updating permissions for Research scripts..."

# Placeholder for command to update permissions
find -iname '*research' -exec chmod 770 {} +

echo "Permissions updated for Research scripts" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Finance scripts - Only members of the finance group
echo "Updating permissions for Finance scripts"

# Placeholder for command to update permissions
find -iname '*finance' -exec chmod 770 {} +

echo "Permissions updated for Finance scripts." >> $REPORT_FILE
printf "\n" >> $REPORT_FILE


echo "Script execution completed. Check $REPORT_FILE for details."
