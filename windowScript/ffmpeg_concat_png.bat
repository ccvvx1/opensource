@echo off

REM 检查输入参数数量
if "%~3"=="" (
    echo 用法: %~nx0 输入图片1 输入图片2 输出图片
    exit /b 1
)

set image1=%1
set image2=%2
set output=%3

echo 正在使用以下命令合并图片：
echo ffmpeg -i %image1% -i %image2% -filter_complex hstack=inputs=2 %output%

REM 执行ffmpeg命令
ffmpeg -i %image1% -i %image2% -filter_complex hstack=inputs=2 %output%

echo 合并完成。输出图片保存为: %output%
