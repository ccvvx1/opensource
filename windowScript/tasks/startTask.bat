@echo off

:: ����Ҫ�����ĳ���·��
set "program_path=U:\application\1ToDesk1\1ToDesk1.exe"

:: ����ÿ�����еļƻ�����
schtasks /create /tn "RunHello" /tr "%program_path%" /sc daily /st 21:00
