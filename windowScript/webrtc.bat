@echo off



if "%1"=="" (
  echo Please specify the build target as the first argument.
  echo Example: build_webrtc.bat 64 release
  echo Example: build_webrtc.bat 86 debug
  exit /b 1
)

if "%2"=="" (
  ::echo Please specify the build type as the second argument (e.g., debug or release)  
  echo Example: build_webrtc.bat 64 release
  echo Example: build_webrtc.bat 86 debug
  exit /b 1
)

set build_target=%1
set build_type=%2
set is_debug=false

if "%2"=="r" (
  set build_type=release
) else if "%2"=="release" (
  set build_type=release
) else if "%2"=="d" (
  set build_type=debug
  set is_debug=true
) else if "%2"=="debug" (
  set build_type=debug
  set is_debug=true
) else (
  echo Invalid build type. Please specify 'release' or 'debug' as the second argument.
  echo Example: build_webrtc.bat 64 release
  echo Example: build_webrtc.bat 86 debug
  exit /b 1
)

:: 获取当前目录
set current_dir=%CD%
echo Current directory is: %current_dir%

cd U:\env\zhidao\src

set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set GYP_GENERATORS=ninja,msvs-ninja
set GYP_MSVS_OVERRIDE_PATH=U:\Program Files (x86)\Microsoft Visual Studio\2019\Professional
set PATH=U:\env\zhidao\src\buildtools\win;U:\env\zhidao\depot_tools;%PATH%;
set DEPOT_TOOLS_UPDATE=0
::git config --get http.proxy
::git config --global http.proxy %HTTP_PROXY%
::set https_proxy=http://127.0.0.1:1081
::set http_proxy=http://127.0.0.1:1081
set GYP_MSVS_VERSION=2019

echo Generating Ninja build files for x%build_target% %build_type%...
@echo on
gn gen --target=x%build_target% --args="is_clang=false is_debug=%is_debug% use_rtti=true rtc_include_tests=false rtc_libvpx_build_vp9=true enable_iterator_debugging=true symbol_level=0 proprietary_codecs=true use_openh264=true ffmpeg_branding=\"Chrome\"" --ide=vs2019 out/x%build_target%_%build_type%
@echo off
echo Building WebRTC for x%build_target% %build_type%...
@echo on
ninja -C out/x%build_target%_%build_type%


cd %current_dir%
echo Back to the original directory: %CD%