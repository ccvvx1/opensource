@echo off

:: 设置要启动的程序路径
set "program_path=U:\application\1ToDesk1\1ToDesk1.exe"

:: 创建每天运行的计划任务
schtasks /create /tn "RunHello" /tr "%program_path%" /sc daily /st 21:00
