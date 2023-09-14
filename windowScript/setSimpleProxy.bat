@echo off

if "%~1"=="" (
    echo Usage: %~nx0 PORT
    echo Example: %~nx0 8580
    exit /b 1
)

set proxy_port=%~1

:: 设置环境变量（临时）
set http_proxy=http://localhost:%proxy_port%
set https_proxy=http://localhost:%proxy_port%

:: 设置永久环境变量，以便在新的 CMD 会话中生效
setx http_proxy "%http_proxy%" /m
setx https_proxy "%https_proxy%" /m

echo HTTP_PROXY is set to %http_proxy%
echo HTTPS_PROXY is set to %https_proxy%
