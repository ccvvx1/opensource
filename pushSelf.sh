#!/bin/bash

# ����UTF-8����
export LANG=en_US.UTF-8

# ��ʾ�û����뱸ע
read -p "�����뱸ע---" var

# ��ʾ�û�����ı�ע
echo "������ı�ע����Ϊ $var"

# ִ��Git����
git pull
git add *.ipynb
git add *.sh
git add *.bat
git add windowScript/*
git add linuxScript/*
git add ueScript/*
git add mysysScript/*

# ��ʾ�û�����ı�ע
echo "$var"

# �ύ�����͸���
git commit -m "$var"
git push origin master:master
