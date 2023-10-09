@echo off
setlocal enabledelayedexpansion

echo 当前目录是：%cd%
set "pwd=%cd%"
mn.lnk



goto :eof

:cd2pwd
cd %1


echo Back to the original directory: %1

u:

echo %1 | findstr /C:"C:" >nul
if %errorlevel%==0 (
    echo "C:" found in current_dir
    c:
) else (
    echo "C:" not found in current_dir
)
goto:eof