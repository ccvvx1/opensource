@echo off

:: 删除名为 "RunHello" 的计划任务
schtasks /delete /tn "RunHelloKill" /f
schtasks /delete /tn "RunHelloKill1" /f
schtasks /delete /tn "RunHelloKill2" /f

echo 计划任务 "RunHelloKill" 已被删除。
echo 计划任务 "RunHelloKill1" 已被删除。
echo 计划任务 "RunHelloKill2" 已被删除。
