@echo off
setlocal

set "folderA=%~1"
set "folderName=%~n1"
set "folderB=%~2"

if "%folderA%"=="" (
    echo Usage: %0 source_folder destination_folder
    exit /b
)

if "%folderB%"=="" (
    echo Usage: %0 source_folder destination_folder
    exit /b
)

xcopy /s /e /i "%folderA%" "%folderB%""/%folderName%"
echo "%folderName%"

endlocal
