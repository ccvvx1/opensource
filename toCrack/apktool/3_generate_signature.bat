@echo off
del abc.keystore
echo usage: keytool -genkey -alias abc.keystore -keyalg RSA -validity 20000 -keystore abc.keystore
set PATH=%JAVA_HOME%\bin;%PATH%
keytool -genkey -alias abc.keystore -keyalg RSA -validity 20000 -keystore abc.keystore