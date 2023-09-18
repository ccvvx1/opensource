@echo off
:: Check the number of passed parameters
if "%~5"=="" (
    echo Usage: BuildSolution.bat [Solution File] [Build Target] [Configuration] [Platform]
    echo e.g. %0 YourSolution.sln [Build^|b^|Rebuild^|r] [Debug^|d^|Release^|r] [64|86]
    echo e.g. %0 YourSolution.sln b d 64

    exit /b 1
)

:: Set the passed parameters
set SolutionFile=%1
set BuildTarget=%2
set Configuration=%3
set Platform=%4

:: Navigate to the path of MSBuild tool
cd "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\Tools\"

:: Execute the msbuild command with the passed parameters
msbuild %SolutionFile% /t:%BuildTarget% /p:Configuration=%Configuration% /p:Platform=x%Platform%
