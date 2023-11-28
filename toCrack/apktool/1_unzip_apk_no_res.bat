@echo off
rd /s /q output
echo usage: java -jar apktool_2.9.0.jar d 1.apk -o output
set PATH=%JAVA_HOME%\bin;%PATH%
java -jar apktool_2.9.0.jar d obj.apk -f -r -o output