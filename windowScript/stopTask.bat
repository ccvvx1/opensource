@echo off

:: 删除名为 "RunHello" 的计划任务
schtasks /delete /tn "RunHello" /f

echo 计划任务 "RunHello" 已被删除。
