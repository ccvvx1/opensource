@echo off

:: �������Ƿ��ṩ
if "%~1"=="" (
  echo ���ṩԴ��Ŀ¼��Ϊ��һ��������
  echo Example:U:\env\zhidao\src
  exit /b 1
)

if "%~2"=="" (
  echo ���ṩĿ��Ŀ¼��Ϊ�ڶ���������
  exit /b 1
)

:: ����Դ��Ŀ¼��Ŀ��Ŀ¼
set src_dir=%~1
set dest_dir=%~2

:: ʹ��xcopy�����.h�ļ�
xcopy /s /i /y "%src_dir%\*.h" "%dest_dir%"

echo ͷ�ļ�����ȡ�� %dest_dir% Ŀ¼��
