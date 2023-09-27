#!/bin/bash

# ����������
if [ $# -ne 1 ]; then
  echo "Usage: $0 <input_parameter>"
  echo "Example: $0 anne"
  exit 1
fi

# �������⻷��
source /mnt/tmw/module/python/makeittalk/venv/bin/activate1

# ���� PYTHONPATH
export PYTHONPATH=/mnt/tmw/module/python/makeittalk/MakeItTalk:$PYTHONPATH

# �л��� MakeItTalk Ŀ¼
cd /mnt/tmw/module/python/makeittalk/MakeItTalk

# ���ļ��ж�ȡ����
hello=$(cat ~/tmp/hello.txt)

# ���� Python �ű������������в���
python ${hello}/makeittalk.py --jpg "$1".jpg
