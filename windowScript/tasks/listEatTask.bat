@echo off

:: 列出所有计划任务
:: schtasks /query /fo list

:: 列出名为 "RunHello" 的任务的相关信息
schtasks /query /tn "RunEatReminder1" /fo list
schtasks /query /tn "RunEatReminder2" /fo list
schtasks /query /tn "RunEatReminder3" /fo list
schtasks /query /tn "RunEatReminder4" /fo list