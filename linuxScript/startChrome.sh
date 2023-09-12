#!/bin/bash

# 检查参数数量是否正确
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <proxy-port>"
    exit 1
fi

# 获取代理端口参数
proxy_port="$1"

# 启动 Google Chrome 并配置代理
google-chrome --proxy-server="http://localhost:$proxy_port"
