#!/bin/bash

# ����������
if [ $# -ne 1 ]; then
    echo "Usage: $0 [0|1]"
    exit 1
fi

# ����Ϊ0ʱִ�в���
if [ $1 -eq 0 ]; then
    echo "recover"
    cd /mnt/tmw/module/python/bring/photo_restoration/
    . /mnt/tmw/module/python/bring/venv/bin/activate1
    python run.py --input_folder ./test_images/old --output_folder ./output/ --GPU 0

fi

# ����Ϊ1ʱִ�в���
if [ $1 -eq 1 ]; then
    echo "amend"
    rm -rf ./output/*
    python run.py --input_folder ./test_images/old_w_scratch/ --output_folder ./output/ --GPU 0 --with_scratch
fi
