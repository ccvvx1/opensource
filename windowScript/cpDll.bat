@echo off
setlocal

rem ��������������
if "%~2"=="" (
    echo Usage: %~nx0 input_directory output_directory
    exit /b
)

rem ��������Ŀ¼�����Ŀ¼
set "input_directory=%~1"
set "output_directory=%~2"

rem ȷ�����Ŀ¼���ڣ�����������򴴽�
if not exist "%output_directory%" mkdir "%output_directory%"

rem �ƶ����е� DLL �ļ������Ŀ¼
for %%i in ("%input_directory%\*.dll") do (
    copy /y  "%%i" "%output_directory%\"
)

echo DLL files moved from %input_directory% to %output_directory%.

endlocal
