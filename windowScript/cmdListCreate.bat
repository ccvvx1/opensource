@echo off

:: ������������
set errorCount=0

del u:\application\clc.bat
del u:\application\ap.bat
del u:\application\df.bat
del u:\application\cf.bat
del u:\application\pc.bat
del u:\application\cdll.bat
del u:\application\getSysInfo.bat
del u:\application\my.bat
del u:\application\webp.bat
del u:\application\ff.bat
del u:\application\pr.bat
del u:\application\ap.bat
del u:\application\pr.bat
del u:\application\prs.bat
del u:\application\webrtc.bat
del u:\application\cl.bat
del u:\application\cwh.bat
del u:\application\jp.bat
del u:\application\wb.bat
del u:\application\lw.bat
del u:\application\mn.bat

:: ʹ�� executeCommand ����ִ��ÿһ������
call :executeCommand "ml clc.bat cmdListCreate.bat -s b"
call :executeCommand "ml cl.bat cmdList.bat -s b"
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
call :executeCommand "ml prs.bat setSimpleProxy.bat -s b"
call :executeCommand "ml webrtc.bat webrtc.bat -s b"
call :executeCommand "ml cwh.bat cpWebrtcHeader.bat -s b"
call :executeCommand "ml jp.bat renJpg2Png.bat -s b"
call :executeCommand "ml wb.bat startWinBuild.bat -s b"
call :executeCommand "ml lw.bat listWebrtc.bat -s b"
call :executeCommand "ml mn.bat miniconda.bat -s b"

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