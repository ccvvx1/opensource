@echo off

:: 删除名为 "RunHello" 的计划任务
schtasks /delete /tn "RunTakeEatReminder1" /f
schtasks /delete /tn "RunTakeEatReminder2" /f
schtasks /delete /tn "RunTakeEatReminder3" /f
schtasks /delete /tn "RunTakeEatReminder4" /f

echo 计划任务 "RunTakeEatReminder1" 已被删除。
echo 计划任务 "RunTakeEatReminder2" 已被删除。
echo 计划任务 "RunTakeEatReminder3" 已被删除。
echo 计划任务 "RunTakeEatReminder4" 已被删除。
