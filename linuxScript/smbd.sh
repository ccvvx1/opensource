#!/bin/bash

sudo apt install samba
mkdir /home/tmw/shared
sudo chmod 777 /etc/samba/smb.conf
sudo echo "[shared]" >> /etc/samba/smb.conf
sudo echo "path = /home/tmw/shared" >> /etc/samba/smb.conf
sudo echo "read only = no" >> /etc/samba/smb.conf
sudo echo "guest ok = yes" >> /etc/samba/smb.conf
sudo service smbd restart
sudo apt install net-tools
sudo chmod 777 /home/tmw
ifconfig

