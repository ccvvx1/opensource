@echo off

:: 删除名为 "RunHello" 的计划任务
schtasks /delete /tn "RunEatReminder1" /f
schtasks /delete /tn "RunEatReminder2" /f
schtasks /delete /tn "RunEatReminder3" /f
schtasks /delete /tn "RunEatReminder4" /f

echo 计划任务 "RunEatReminder1" 已被删除。
echo 计划任务 "RunEatReminder2" 已被删除。
echo 计划任务 "RunEatReminder3" 已被删除。
echo 计划任务 "RunEatReminder4" 已被删除。
