@echo off
setlocal

rem 获取当前目录
set "current_dir=%CD%"

rem 打印当前目录
echo 当前目录：%current_dir%
set JAVA_HOME=%current_dir%\jre

endlocal

