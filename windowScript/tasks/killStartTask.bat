@echo off

:: 设置要启动的程序路径
set "program_path=U:\module\all-y\yun\opensource\windowScript\killExe.bat"

:: 创建每天运行的计划任务
schtasks /create /tn "RunHelloKill" /tr "%program_path%" /sc daily /st 12:13
schtasks /create /tn "RunHelloKill1" /tr "%program_path%" /sc daily /st 12:14
schtasks /create /tn "RunHelloKill2" /tr "%program_path%" /sc daily /st 12:15
