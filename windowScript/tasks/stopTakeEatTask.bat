@echo off

:: ɾ����Ϊ "RunHello" �ļƻ�����
schtasks /delete /tn "RunTakeEatReminder1" /f
schtasks /delete /tn "RunTakeEatReminder2" /f
schtasks /delete /tn "RunTakeEatReminder3" /f
schtasks /delete /tn "RunTakeEatReminder4" /f

echo �ƻ����� "RunTakeEatReminder1" �ѱ�ɾ����
echo �ƻ����� "RunTakeEatReminder2" �ѱ�ɾ����
echo �ƻ����� "RunTakeEatReminder3" �ѱ�ɾ����
echo �ƻ����� "RunTakeEatReminder4" �ѱ�ɾ����
