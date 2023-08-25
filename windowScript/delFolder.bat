@echo off
setlocal

set "prefix=%1"

if "%prefix%"=="" (
    echo Usage: %0 folder_prefix
    exit /b
)

for /d %%d in (%prefix%*) do (
    rd /s /q "%%d"
)

endlocal

