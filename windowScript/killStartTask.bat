@echo off

:: ����Ҫ�����ĳ���·��
set "program_path=U:\module\all-y\yun\opensource\windowScript\killExe.bat"

:: ����ÿ�����еļƻ�����
schtasks /create /tn "RunHelloKill" /tr "%program_path%" /sc daily /st 12:13
schtasks /create /tn "RunHelloKill1" /tr "%program_path%" /sc daily /st 12:14
schtasks /create /tn "RunHelloKill2" /tr "%program_path%" /sc daily /st 12:15
