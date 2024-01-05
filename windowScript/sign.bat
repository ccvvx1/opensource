@echo off

if "%1"=="" (
    echo Please provide source file path.
    goto :eof
)

set src=%1

if not exist "%src%" (
    echo Source file not found: %src%
    goto :eof
)

set des=%2

if not defined des (
    set des=sign_%~n1
)

java -jar U:\module\python\opensource\bac\SystemSign\signapk.jar U:\module\python\opensource\bac\SystemSign\platform.x509.pem U:\module\python\opensource\bac\SystemSign\platform.pk8 %src% ..\%des%

echo Signed file: %des%, System sign done...
