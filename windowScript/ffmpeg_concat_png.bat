@echo off

REM ��������������
if "%~3"=="" (
    echo �÷�: %~nx0 ����ͼƬ1 ����ͼƬ2 ���ͼƬ
    exit /b 1
)

set image1=%1
set image2=%2
set output=%3

echo ����ʹ����������ϲ�ͼƬ��
echo ffmpeg -i %image1%.png -i %image2%.png -filter_complex hstack=inputs=2 output\%output%.png

REM ִ��ffmpeg����
ffmpeg -i %image1%.png -i %image2%.png -filter_complex hstack=inputs=2 output\%output%.png

echo �ϲ���ɡ����ͼƬ����Ϊ: %output%
