@echo off

if "%~1"=="" (
    echo Usage: %~nx0 PORT
    echo Example: %~nx0 8580
    exit /b 1
)

set proxy_port=%~1

:: ���û�����������ʱ��
set http_proxy=http://localhost:%proxy_port%
set https_proxy=http://localhost:%proxy_port%

:: �������û����������Ա����µ� CMD �Ự����Ч
setx http_proxy "%http_proxy%" /m
setx https_proxy "%https_proxy%" /m

echo HTTP_PROXY is set to %http_proxy%
echo HTTPS_PROXY is set to %https_proxy%
