@echo off

setlocal enabledelayedexpansion

if "%1"=="set" (
    if "%2"=="" (
        echo %0 [set^|reset] port
        exit /b 1
    ) else (
        set proxy=%2
        echo Setting proxy to 127.0.0.1:!proxy!...
        ::创建注册表项
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "127.0.0.1:!proxy!" /f
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "*.tmw-m410;*.6vw.cc;*.haokongbu.top;*.haokongbu123.com;*.mandudu.com;mrdeepfakes.com;mrdeepfakes.com;<local>" /f


        ::启用代理
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
        ::netsh winhttp set proxy proxy-server="http=!proxy!;https=!proxy!" bypass-list="*.local"
        echo Proxy settings updated.
    )
) else if "%1"=="reset" (
    echo Resetting proxy settings...
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f

    echo Proxy settings reset.
) else (
    echo %0 [set^|reset] port
    exit /b 1
)

if "%1"=="set" (
    echo Displaying current proxy settings...
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer
    echo.
)

endlocal


