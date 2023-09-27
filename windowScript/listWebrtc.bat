@echo off
chcp 65001
setlocal enabledelayedexpansion

REM 检查是否提供了根文件夹路径参数
if "%~1"=="" (
  echo 请提供根文件夹路径作为参数。
  exit /b 1
)

REM 从命令行参数中获取根文件夹路径
set "root_folder=%~1"

REM 遍历根文件夹下的所有子文件夹
for /r "%root_folder%" %%d in (.git) do (
  REM 获取子模块所在的文件夹
  
  set "submodule_dir=%%~dpd"

  REM 获取子模块的 URL 和路径
  for /f "tokens=*" %%u in ('git -C "!submodule_dir!" config --get remote.origin.url') do (
    set "submodule_url=%%u"
  )

  set "submodule_path=!submodule_dir!"

  REM 获取子模块的当前分支
  for /f "tokens=*" %%b in ('git -C "!submodule_dir!" rev-parse --abbrev-ref HEAD') do (
    set "submodule_branch=%%b"
  )

  REM 获取子模块的当前 commit SHA 值
  for /f "tokens=*" %%c in ('git -C "!submodule_dir!" rev-parse HEAD') do (
    set "submodule_commit=%%c"
  )

  REM 打印子模块信息，包括 URL、路径、分支和 SHA 值
  echo Submodule Path: !submodule_path!
  echo Submodule URL: !submodule_url!
  echo Submodule Branch: !submodule_branch!
  echo Submodule Commit SHA: !submodule_commit!
  echo ----------------------------------
)
endlocal