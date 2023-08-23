chcp 65001

@echo off
set /p var=请输入备注---
echo 您输入的备注内容为%var%


git pull
git add *.ipynb
git add *.bat
git add windowScript/*
git add linuxScript/*
@echo off
echo %var%
git commit -m "%var%"
git push origin master:master
