#!/bin/bash
# Script 3: Disk and Permission Auditor
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")
echo "Directory Audit Report"
echo "----------------------"


# imma use /home/prince/.config/testconf
SOFTWARE_CONFIG_DIR=/home/prince/.config/testconf
for DIR in "${DIRS[@]}"; do
 if [ -d "$DIR" ]; then
 PERMS=$(ls -ld $DIR | awk '{print $1, $3, $4}')
 SIZE=$(du -sh $DIR 2>/dev/null | cut -f1)
 echo "$DIR => Permissions: $PERMS | Size: $SIZE"
 else
 echo "$DIR does not exist on this system"
 fi
done
CONFIG_DIR=${SOFTWARE_CONFIG_DIR:-"/home/$USER/.config/testconf"}
if [ -d "$SOFTWARE_CONFIG_DIR" ]; then
 # perms for ALL USER GROUP 
 perms=$(stat -c "%A %U %G" "$SOFTWARE_CONFIG_DIR")
 echo "Config directory $SOFTWARE_CONFIG_DIR => Permissions: $perms"
else
 echo "Config directory $SOFTWARE_CONFIG_DIR does not exist"
fi
