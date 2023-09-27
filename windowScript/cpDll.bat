@echo off
setlocal

rem 检查输入参数数量
if "%~2"=="" (
    echo Usage: %~nx0 input_directory output_directory
    exit /b
)

rem 设置输入目录和输出目录
set "input_directory=%~1"
set "output_directory=%~2"

rem 确保输出目录存在，如果不存在则创建
if not exist "%output_directory%" mkdir "%output_directory%"

rem 移动所有的 DLL 文件到输出目录
for %%i in ("%input_directory%\*.dll") do (
    copy /y  "%%i" "%output_directory%\"
)

echo DLL files moved from %input_directory% to %output_directory%.

endlocal
