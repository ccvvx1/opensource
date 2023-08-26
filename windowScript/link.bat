@echo off
setlocal

set "folderA=%1"
set "folderB=%2"
set "symbolicLinkType=%3"
set "symbolicLinkTypeValue=%4"

if "%folderA%"=="" (
    echo "Usage: %0 source destination_folder [-s b|f]"
    exit /b
)

if "%folderB%"=="" (
    echo "Usage: %0 source destination_folder [-s b|f]"
    exit /b
)

if "%symbolicLinkType%"=="-s" (
    if "%symbolicLinkTypeValue%"=="b" (
        mklink /H "U:\application\%folderA%" "%folderB%"
    ) else if "%symbolicLinkTypeValue%"=="f" (
        mklink /J "U:\application\%folderA%" "%folderB%"
    ) else (
        echo "%symbolicLinkTypeValue%"
        echo Invalid symbolic link type.
    )
) else (
    echo "Usage: %0 source destination_folder [-s b|f]"
)

endlocal
