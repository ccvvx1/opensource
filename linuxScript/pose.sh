#!/bin/bash

# ����������
if [ $# -ne 0 ]; then
  echo "Usage: $0 <input_parameter>"
  exit 1
fi

# �������⻷��
source /mnt/tmw/module/python/pose/venv/bin/activate1

# ���� PYTHONPATH
export PYTHONPATH=/mnt/tmw/module/python/pose/mmpose:$PYTHONPATH

# �л��� MakeItTalk Ŀ¼
cd /mnt/tmw/module/python/pose/mmpose

# ���ļ��ж�ȡ����
# hello=$(cat ~/tmp/hello.txt)

# ���� Python �ű������������в���
# python ${hello}/makeittalk.py --jpg "$1".jpg
python app.py
