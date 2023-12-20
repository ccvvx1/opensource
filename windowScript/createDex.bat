@echo off
rem setlocal enabledelayedexpansion

REM Check if the correct number of arguments is provided
if "%~2"=="" (
    echo Usage: %0 paramA paramB
    echo Please provide values for paramA and paramB.
    exit /b 1
)

set paramA=%1
set paramTmp=%1
set paramB=%2

REM Compile the Java source file
javac -source 8 -target 8 %paramB%.java

REM Check if compilation was successful
if errorlevel 1 (
    echo Compilation failed. Exiting script.
    exit /b 1
)

echo Compilation successful for %paramB%.java.

setlocal enabledelayedexpansion

set "input=%1"
set "search=\\"

:: 计算字符串中包含的\符号数量
set "count=0"
for /L %%i in (0,1,20) do (
    set "char=!input:~%%i,2!"
    if "!char!"=="%search%" (
        set /a "count+=1"
    )
)

echo The number of \ symbols in the string is: %count%
echo %count% > "u:\tmp\tmp.txt"
rem echo %content% > "u:\tmp\tmp.txt"

endlocal
REM Go up in the directory structure based on the count

set "filePath=U:\tmp\tmp.txt"

rem 读取文件内容到变量
set "fileContent="
set /p count=<"%filePath%"

:goUp
if %count% gtr 0 (
    cd ..
    set /a count-=1
    echo "count: "%count%
    goto :goUp
)


REM Run dx.bat with the specified parameters
echo U:\transfer\application\sdk\build-tools\29.0.2\dx.bat --dex --output=testDex.dex %paramTmp%\%paramB%.class
U:\transfer\application\sdk\build-tools\29.0.2\dx.bat --dex --output=testDex.dex %paramTmp%\%paramB%.class

REM Check if dx.bat execution was successful
if errorlevel 1 (
    echo Error running dx.bat. Exiting script.
    exit /b 1
)

echo dex conversion successful for %paramA%.%paramB%.class.
exit /b 0

endlocal