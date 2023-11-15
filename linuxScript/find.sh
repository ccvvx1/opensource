#!/bin/bash

# 检查是否提供了关键字作为参数
if [ -z "$1" ]; then
    echo "请提供要搜索的关键字作为参数"
    exit 1
fi

# 使用提供的关键字进行查找
find . -type f -name "*$1*" -printf "%f\n" | grep --color=auto "$1"


