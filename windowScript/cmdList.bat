@echo off
setlocal enabledelayedexpansion

echo supported cmds:
echo    ml           --make link
echo    df           --del folder
echo    cf           --copy folder
echo    pc           --cmd throght proxy
echo    cdll         --copy dll
echo    getSysInfo   --get System Info
echo    ========================
echo    clion.lnk    --clion app
echo    go.lnk       --goland app
echo    ========================

REM 设置选项
set "options=Option: ml Option: df Option: cf Option: pc Option: cdll Option: getSysInfo Option: clion.lnk Option: go.lnk  Option: go.lnk"

REM 显示选项并等待用户输入
echo    Select an option:
setlocal enabledelayedexpansion
set "counter=1"
for %%i in (%options%) do (
    if not "%%i"=="Option:" (
      echo    !counter!. %%i
      set /a "counter+=1"
    ) else (
      echo Option:
    )
)
endlocal
set /p "choice=Enter the number of your choice: "

REM 处理用户选择
set "selected="
setlocal enabledelayedexpansion
set "counter=0"
for %%i in (%options%) do (
    if "!counter!"=="%choice%" (
        set "selected=%%i"
        goto :found
    )
    if "%%i"=="Option:" (
        set /a "counter+=1"
    )
)
endlocal
echo Invalid choice.
goto :end

:found
echo You selected: %selected%
echo %selected% | clip


:end
endlocal