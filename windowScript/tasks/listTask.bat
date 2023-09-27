@echo off

:: 列出所有计划任务
:: schtasks /query /fo list

:: 列出名为 "RunHello" 的任务的相关信息
schtasks /query /tn "RunHello" /fo list