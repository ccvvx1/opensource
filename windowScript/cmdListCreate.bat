@echo off

:: ������������
set errorCount=0



:: ʹ�� executeCommand ����ִ��ÿһ������
call :executeCommand "ml clc.bat cmdListCreate.bat -s b"
call :executeCommand "ml ap.bat adbPush.bat -s b"
call :executeCommand "ml df.bat delFolder.bat -s b"
call :executeCommand "ml cf.bat copyFolder.bat -s b"
call :executeCommand "ml pc.bat setupAllProxy.bat -s b"
call :executeCommand "ml cdll.bat cpDll.bat -s b"
call :executeCommand "ml getSysInfo.bat getSysInfo.bat -s b"
call :executeCommand "ml my.bat mySysEnv.bat -s b"
call :executeCommand "ml webp.bat changeJpg2Webp.bat -s b"
call :executeCommand "ml ff.bat createVideo.bat -s b"
call :executeCommand "ml pr.bat setProxy.bat -s b"
call :executeCommand "ml ap.bat adbPush.bat -s b"
call :executeCommand "ml pr.bat setProxy.bat -s b"
call :executeCommand "ml prs.bat setSimpleProxy.bat -s b"

:: ��ӡ���������
echo Total errors: %errorCount%


:: ����ִ������ĺ�������������᳢��ִ������������
:executeCommand
    call %~1
    echo =======================
    if errorlevel 1 (
        echo Error occurred while executing: %1
        set /a errorCount+=1
    )
    goto :eof