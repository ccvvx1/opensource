#!/bin/bash

# Check the number of arguments
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 [1|0] <Server IP Address> <Share Name>"
  echo e.g. $0 1 192.168.0.105 U\$
  echo e.g. $0 0
  exit 1
fi

# Get values from the parameters
server_ip="$2"
share_name="$3"
b_umount="$1"

if [ "$b_umount" == "1" ]; then
  # Mount the Samba share
  sudo mount -t cifs "//${server_ip}/${share_name}" ~/module/samba/output -o username=administrator,password=122335

  # Check if the mount was successful
  if [ $? -eq 0 ]; then
    echo "Samba share successfully mounted to ~/module/samba/output"
  else
    echo "Error mounting the Samba share"
  fi
elif [ "$b_umount" == "0" ]; then
  # Unmount the Samba share
  sudo umount ~/module/samba/output

  # Check if the unmount was successful
  if [ $? -eq 0 ]; then
    echo "Samba share has been unmounted"
  else
    echo "Error unmounting the Samba share"
  fi
else
  echo "Invalid parameter value: Please use 0 or 1"
  exit 1
fi
