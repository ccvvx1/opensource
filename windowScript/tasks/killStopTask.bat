@echo off

:: ɾ����Ϊ "RunHello" �ļƻ�����
schtasks /delete /tn "RunHelloKill" /f
schtasks /delete /tn "RunHelloKill1" /f
schtasks /delete /tn "RunHelloKill2" /f

echo �ƻ����� "RunHelloKill" �ѱ�ɾ����
echo �ƻ����� "RunHelloKill1" �ѱ�ɾ����
echo �ƻ����� "RunHelloKill2" �ѱ�ɾ����
