#!/bin/bash

# 设置UTF-8编码
export LANG=en_US.UTF-8

# 提示用户输入备注
read -p "请输入备注---" var

# 显示用户输入的备注
echo "您输入的备注内容为 $var"

# 执行Git操作
git pull
git add *.ipynb
git add *.sh
git add *.bat
git add windowScript/*
git add linuxScript/*
git add ueScript/*
git add mysysScript/*

# 提示用户输入的备注
echo "$var"

# 提交并推送更改
git commit -m "$var"
git push origin master:master
