@echo off

:: 检查参数是否提供
if "%~1"=="" (
  echo 请提供源码目录作为第一个参数。
  echo Example:U:\env\zhidao\src
  exit /b 1
)

if "%~2"=="" (
  echo 请提供目标目录作为第二个参数。
  exit /b 1
)

:: 设置源码目录和目标目录
set src_dir=%~1
set dest_dir=%~2

:: 使用xcopy命令复制.h文件
xcopy /s /i /y "%src_dir%\*.h" "%dest_dir%"

echo 头文件已提取到 %dest_dir% 目录。
