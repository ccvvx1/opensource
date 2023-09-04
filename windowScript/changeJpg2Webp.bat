@echo off
setlocal enabledelayedexpansion

set "source_directory=%~1"
set "old_extension=jpg"
set "new_extension=webp"

if "source_directory" == "" (
    echo usage: %0 source_directory
    exit 
)

for %%F in ("%source_directory%\*%old_extension%") do (
    set "new_name=%%~nF%new_extension%"
    ffmpeg -i "%%F" -y "!new_name!"
    ren "!new_name!" "%%F" 
)

echo Batch renaming completed.
pause
