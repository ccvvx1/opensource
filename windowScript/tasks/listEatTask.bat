@echo off

:: �г����мƻ�����
:: schtasks /query /fo list

:: �г���Ϊ "RunHello" ������������Ϣ
schtasks /query /tn "RunEatReminder1" /fo list
schtasks /query /tn "RunEatReminder2" /fo list
schtasks /query /tn "RunEatReminder3" /fo list
schtasks /query /tn "RunEatReminder4" /fo list