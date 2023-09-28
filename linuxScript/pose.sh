#!/bin/bash

# 检查参数数量
if [ $# -ne 0 ]; then
  echo "Usage: $0 <input_parameter>"
  exit 1
fi

# 激活虚拟环境
source /mnt/tmw/module/python/pose/venv/bin/activate1

# 设置 PYTHONPATH
export PYTHONPATH=/mnt/tmw/module/python/pose/mmpose:$PYTHONPATH

# 切换到 MakeItTalk 目录
cd /mnt/tmw/module/python/pose/mmpose

# 从文件中读取参数
# hello=$(cat ~/tmp/hello.txt)

# 运行 Python 脚本并传递命令行参数
# python ${hello}/makeittalk.py --jpg "$1".jpg
python app.py
