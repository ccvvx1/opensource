@echo off
setlocal enabledelayedexpansion

rem ����Ƿ��ṩ���ļ���·������
if "%~1"=="" (
    echo pls provide the path
    exit /b
)

set "source_folder=%~1"

cd /d "%source_folder%" || exit /b

set /a count=0

for %%f in (*.jpg) do (
    set /a count+=1
    ren "%%f" "!count!.png"
)

echo Renaming completed.
pause
