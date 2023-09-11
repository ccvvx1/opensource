#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <port>"
    exit 1
fi

port="$1"
http_proxy="http://localhost:$port"
https_proxy="http://localhost:$port"

export http_proxy
export https_proxy

echo "http_proxy set to $http_proxy"
echo "https_proxy set to $https_proxy"

