@echo on
setlocal enabledelayedexpansion

del local.properties

REM ���� sdk.dir �� ndk.dir ��·��
set sdk_dir=U:\\transfer\\application\\sdk
set ndk_dir=U:\\transfer\\application\\sdk\\ndk\\20.0.5594570

REM ���� local.properties �ļ�
(
    echo sdk.dir=!sdk_dir!
    echo ndk.dir=!ndk_dir!
) > local.properties

REM ��ʾ��Ϣ��ָʾ�ļ��Ѵ���
echo local.properties �ļ��Ѵ��������á�

endlocal



set _JAVA_OPTIONS=-Xmx512m
echo "%1"
if "%1" == "11" (
  set JAVA_HOME="U:\Program Files (x86)\Java\jdk-11.0.21"
) else (
  set JAVA_HOME="U:\Program Files (x86)\Java\jdk1.8.0_341"
)
set ANDROID_NDK=U:\transfer\application\sdk\ndk\20.0.5594570

gradlew.bat assembleDebug