@echo off

:: ɾ����Ϊ "RunHello" �ļƻ�����
schtasks /delete /tn "RunEatReminder1" /f
schtasks /delete /tn "RunEatReminder2" /f
schtasks /delete /tn "RunEatReminder3" /f
schtasks /delete /tn "RunEatReminder4" /f

echo �ƻ����� "RunEatReminder1" �ѱ�ɾ����
echo �ƻ����� "RunEatReminder2" �ѱ�ɾ����
echo �ƻ����� "RunEatReminder3" �ѱ�ɾ����
echo �ƻ����� "RunEatReminder4" �ѱ�ɾ����
