@echo off
setlocal enabledelayedexpansion

set proxy_type=%~1
set proxy_value=%~2
set cmdStr=%~3
 
if "!cmdStr!"=="" (
  echo usage: %~0 [-p^|-pl] 8580 "dir"
  exit /b
 )
 
if "!proxy_type!"=="-pl" (
  set http_proxy=http://localhost:!set proxy_value=!
  set https_proxy=http://localhost:!set proxy_value=!
) else if "!proxy_type!"=="-p" (
  set http_proxy=http://127.0.0.1:!set proxy_value=!
  set https_proxy=http://127.0.0.1:!set proxy_value=!
)

call !cmdStr!

endlocal