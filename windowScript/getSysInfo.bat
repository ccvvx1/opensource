@echo off
if "%~1" == "env" (
    start sysdm.cpl
) else if "%~1" == "net" (
    start inetcpl.cpl
) else if "%~1" == "netinfo" (
    wmic nic get name
) else if "%~1" == "ni" (
    wmic nic get name
) else if "%~1" == "showcardinfo" (
    wmic path win32_videocontroller get caption
) else if "%~1" == "sci" (
    wmic path win32_videocontroller get caption
) else if "%~1" == "hyper" (
    powercfg -h off
) else (
    echo "Usage: %~nx0 [env | net | showcardinfo/sci | netinfo/ni | hyper]"
)
