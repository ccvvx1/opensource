#!/bin/bash

# 检查参数数量
if [ $# -ne 1 ]; then
  echo "Usage: $0 <input_parameter>"
  echo "Example: $0 anne"
  exit 1
fi

# 激活虚拟环境
source /mnt/tmw/module/python/makeittalk/venv/bin/activate1

# 设置 PYTHONPATH
export PYTHONPATH=/mnt/tmw/module/python/makeittalk/MakeItTalk:$PYTHONPATH

# 切换到 MakeItTalk 目录
cd /mnt/tmw/module/python/makeittalk/MakeItTalk

# 从文件中读取参数
hello=$(cat ~/tmp/hello.txt)

# 运行 Python 脚本并传递命令行参数
python ${hello}/makeittalk.py --jpg "$1".jpg
