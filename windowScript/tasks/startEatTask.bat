@echo off

:: ����Ҫ�����Ľű�·��
set "script_path=U:\module\all-y\yun\opensource\windowScript\tasks\EatReminder.vbs"

:: ����ÿ�����еļƻ�����
schtasks /create /tn "RunEatReminder1" /tr "%script_path%" /sc daily /st 09:23
schtasks /create /tn "RunEatReminder2" /tr "%script_path%" /sc daily /st 09:57
schtasks /create /tn "RunEatReminder3" /tr "%script_path%" /sc daily /st 09:58
schtasks /create /tn "RunEatReminder4" /tr "%script_path%" /sc daily /st 09:59
