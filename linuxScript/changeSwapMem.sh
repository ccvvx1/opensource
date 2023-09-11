#!/bin/bash

if [ "$#" -ne 1 ]; then
	    echo "Usage: $0 <swap_size_in_gigabytes>"
	        exit 1
fi

SWAP_SIZE="$1"

# 检查当前是否已有 swapfile，并禁用它
if [ -e /swapfile ]; then
	    sudo swapoff /swapfile
fi

# 创建一个新的 swapfile，并设置大小
sudo dd if=/dev/zero of=/swapfile bs=1G count="$SWAP_SIZE"

# 格式化 swapfile
sudo mkswap /swapfile

# 启用 swapfile
sudo swapon /swapfile

# 显示当前的 Swap 使用情况
swapon --show
free -h




