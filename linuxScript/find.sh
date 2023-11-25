#!/bin/bash

# 检查是否提供了关键字作为参数
if [ -z "$1" ]; then
    echo "请提供要搜索的关键字作为参数，【可选】第二参数用于隐藏文件路径"
    echo "示例： $0 hello | $0 hello 1"
    exit 1
fi


# 检查是否提供了第二个参数
if [ "$2" ]; then
    # 使用提供的关键字进行查找
    find . -type f -iname "*$1*" -printf "%f\n" | grep --color=auto "$1"
else 
	# 使用提供的关键字进行查找并显示文件路径
	find . -type f -iname "*$1*" -print | grep --color=auto "$1"
fi

