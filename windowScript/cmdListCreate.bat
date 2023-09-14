@echo off

:: 定义错误计数器
set errorCount=0



:: 使用 executeCommand 函数执行每一行命令
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

:: 打印错误计数器
echo Total errors: %errorCount%


:: 定义执行命令的函数，这个函数会尝试执行命令并处理错误
:executeCommand
    call %~1
    echo =======================
    if errorlevel 1 (
        echo Error occurred while executing: %1
        set /a errorCount+=1
    )
    goto :eof