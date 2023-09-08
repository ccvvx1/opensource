@echo off

:: 设置要启动的脚本路径
set "script_path=U:\module\all-y\yun\opensource\windowScript\tasks\TakeEatReminder.vbs"

:: 创建每天运行的计划任务
schtasks /create /tn "RunTakeEatReminder1" /tr "%script_path%" /sc daily /st 17:01
schtasks /create /tn "RunTakeEatReminder2" /tr "%script_path%" /sc daily /st 17:05
schtasks /create /tn "RunTakeEatReminder3" /tr "%script_path%" /sc daily /st 17:10
schtasks /create /tn "RunTakeEatReminder4" /tr "%script_path%" /sc daily /st 17:15
