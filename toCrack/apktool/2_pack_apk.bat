@echo off
echo usage: java -jar apktool_2.9.0.jar b output -o obj_unsigned.apk
set PATH=%JAVA_HOME%\bin;%PATH%
java -jar apktool_2.9.0.jar b output -o obj_unsigned.apk