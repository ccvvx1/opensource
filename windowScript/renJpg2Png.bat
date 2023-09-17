@echo off
setlocal enabledelayedexpansion

rem 检查是否提供了文件夹路径参数
if "%~1"=="" (
    echo pls provide the path
    exit /b
)

set "source_folder=%~1"

cd /d "%source_folder%" || exit /b

set /a count=0

for %%f in (*.jpg *.png) do (
    set /a count+=1
    set "filename=0000!count!"
    set "filename=br_!filename:~-5!_0.jpg"
    ren "%%f" "!filename!"
)

echo Renaming completed.
pause
