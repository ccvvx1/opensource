@echo off
if "%~1" == "" (
    echo Usage: %0 source_folder
    exit /b
)

set "source_folder=%~1"
set "output_folder=output_link"

if not exist "%output_folder%" mkdir "%output_folder%"

for %%F in ("%source_folder%\*.dll") do (
    echo mklink /H "%output_folder%\%%~nxF" "%%~F" 
    call mklink /H "%output_folder%\%%~nxF" "%%~F"
)

echo DLL files linked from "%source_folder%" to "%output_folder%"


