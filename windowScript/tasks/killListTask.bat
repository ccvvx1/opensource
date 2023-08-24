@echo off

:: 列出所有计划任务
:: schtasks /query /fo list

:: 列出名为 "RunHelloKill" 的任务的相关信息
schtasks /query /tn "RunHelloKill" /fo list
schtasks /query /tn "RunHelloKill1" /fo list
schtasks /query /tn "RunHelloKill2" /fo list