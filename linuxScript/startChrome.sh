#!/bin/bash

# �����������Ƿ���ȷ
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <proxy-port>"
    exit 1
fi

# ��ȡ����˿ڲ���
proxy_port="$1"

# ���� Google Chrome �����ô���
google-chrome --proxy-server="http://localhost:$proxy_port"
