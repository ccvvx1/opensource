@echo off
setlocal enabledelayedexpansion

echo supported cmds:
echo    ml           --make link
echo    df           --del folder
echo    cf           --copy folder
echo    pc           --cmd throght proxy
echo    cdll         --copy dll
echo    getSysInfo   --get System Info
echo    my           --mySys Env set up
echo    webp         --changeJpg2Webp
echo    ff           --create video
echo    pr           --setProxy
echo    ap           --adb push
echo    prs          --set simple Proxy
echo    webrtc       --build webrtc 
echo    cwh          --copy webrtc header
echo    jp           --jpg 2 png
echo    wb           --window build
echo    webrtc       --webrtc build
echo    lw           --list webrtc
echo    ab           --android build
echo    jj           --set up env JAVA_HOME to jdk21
echo    cdex         --create dex
echo    ========================
echo    mn           --miniconda.lnk
echo    ue           --ultra edit.lnk
echo    clion.lnk    --clion app
echo    go.lnk       --goland app
echo    ue.lnk       --ultraedit app
echo    py.lnk       --pycharm app
echo    mn.lnk       --miniconda
echo    ========================

::REM ����ѡ��
::set "options=Option: ml Option: df Option: cf Option: pc Option: cdll Option: getSysInfo Option: my Option: webp Option: ff Option: pr Option: clion.lnk Option: go.lnk  Option: go.lnk"

::REM ��ʾѡ��ȴ��û�����
::echo    Select an option:
::setlocal enabledelayedexpansion
::set "counter=1"
::for %%i in (%options%) do (
::    if not "%%i"=="Option:" (
::      echo    !counter!. %%i
::      set /a "counter+=1"
::    ) else (
::      echo Option:
::    )
::)
::endlocal
::set /p "choice=Enter the number of your choice: "

::REM �����û�ѡ��
::set "selected="
::setlocal enabledelayedexpansion
::set "counter=0"
::for %%i in (%options%) do (
::    if "!counter!"=="%choice%" (
::        set "selected=%%i"
::        goto :found
::    )
::    if "%%i"=="Option:" (
::        set /a "counter+=1"
::    )
::)
::endlocal
::echo Invalid choice.
::goto :end

:::found
::echo You selected: %selected%
::echo %selected% | clip


:::end
endlocal