@echo off

:: �г����мƻ�����
:: schtasks /query /fo list

:: �г���Ϊ "RunHelloKill" ������������Ϣ
schtasks /query /tn "RunHelloKill" /fo list
schtasks /query /tn "RunHelloKill1" /fo list
schtasks /query /tn "RunHelloKill2" /fo list