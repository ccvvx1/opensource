#!/bin/bash

# search.sh

# 检查参数是否为空
if [ -z "$1" ]; then
  echo "请输入要搜索的关键词 pls input key word: "
  exit 1
fi

# 使用 egrep 在当前目录递归搜索指定关键词的文本文件
egrep --color=always -irn "$1" .

