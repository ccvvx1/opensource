@echo off
chcp 65001
setlocal enabledelayedexpansion

REM ����Ƿ��ṩ�˸��ļ���·������
if "%~1"=="" (
  echo ���ṩ���ļ���·����Ϊ������
  exit /b 1
)

REM �������в����л�ȡ���ļ���·��
set "root_folder=%~1"

REM �������ļ����µ��������ļ���
for /r "%root_folder%" %%d in (.git) do (
  REM ��ȡ��ģ�����ڵ��ļ���
  
  set "submodule_dir=%%~dpd"

  REM ��ȡ��ģ��� URL ��·��
  for /f "tokens=*" %%u in ('git -C "!submodule_dir!" config --get remote.origin.url') do (
    set "submodule_url=%%u"
  )

  set "submodule_path=!submodule_dir!"

  REM ��ȡ��ģ��ĵ�ǰ��֧
  for /f "tokens=*" %%b in ('git -C "!submodule_dir!" rev-parse --abbrev-ref HEAD') do (
    set "submodule_branch=%%b"
  )

  REM ��ȡ��ģ��ĵ�ǰ commit SHA ֵ
  for /f "tokens=*" %%c in ('git -C "!submodule_dir!" rev-parse HEAD') do (
    set "submodule_commit=%%c"
  )

  REM ��ӡ��ģ����Ϣ������ URL��·������֧�� SHA ֵ
  echo Submodule Path: !submodule_path!
  echo Submodule URL: !submodule_url!
  echo Submodule Branch: !submodule_branch!
  echo Submodule Commit SHA: !submodule_commit!
  echo ----------------------------------
)
endlocal