@echo off

setlocal enabledelayedexpansion

if "%1"=="set" (
    if "%2"=="" (
        echo %0 [set^|reset] host:port
    ) else (
        set proxy=%2
        echo Setting proxy to !proxy!...
        netsh winhttp set proxy proxy-server="http=!proxy!;https=!proxy!" bypass-list="*.local"
        echo Proxy settings updated.
    )
) else if "%1"=="reset" (
    echo Resetting proxy settings...
    netsh winhttp reset proxy
    echo Proxy settings reset.
) else (
    echo %0 [set^|reset] host:port
)

if "%1"=="set" (
    echo Displaying current proxy settings...
    netsh winhttp show proxy
)

endlocal


