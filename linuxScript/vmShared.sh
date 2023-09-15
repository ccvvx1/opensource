#!/bin/bash

# Update package lists
# sudo apt update

# Install open-vm-tools
sudo apt install open-vm-tools

sudo cp ./vmres/mnt-hgfs.mount /etc/systemd/system/mnt-hgfs.mount

sudo cp ./vmres/open-vm-tools.conf /etc/modules-load.d/open-vm-tools.conf

sudo systemctl enable mnt-hgfs.mount

sudo modprobe -v fuse

sudo systemctl start mnt-hgfs.mount
