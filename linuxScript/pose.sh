#!/bin/bash


if [ $# -ne 0 ]; then
  echo "Usage: $0 <input_parameter>"
  exit 1
fi


source /mnt/tmw/module/python/pose/venv/bin/activate1


export PYTHONPATH=/mnt/tmw/module/python/pose/mmpose:$PYTHONPATH


cd /mnt/tmw/module/python/pose/mmpose


# hello=$(cat ~/tmp/hello.txt)


# python ${hello}/makeittalk.py --jpg "$1".jpg
python app.py
