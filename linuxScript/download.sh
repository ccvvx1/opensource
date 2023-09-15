#!/bin/bash

# 检查参数数量
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <download_url>"
    exit 1
fi

# 获取下载链接参数
download_url="$1"

# 使用 aria2c 下载文件
aria2c "$download_url"

