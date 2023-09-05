@echo off
setlocal enabledelayedexpansion

del ok1.mp4 ok2.mp4 ok3.mp4 ok4.mp4  ok2H.mp4 ok2V.mp4 output.mp4 output1.mp4

:: 从参数获取设置方向的相关信息
set "directionType=%2"
set "directionTypeValue=%3"

:: 获取要处理的视频列数，并计算总列数
set "num_columns=%~1"
set /a "num_columns_total=!num_columns!+1"

if "%directionTypeValue%"=="" (
    echo Usage: %0 num_columns -t [h^|v^|hv^|fhv]
    echo result mp4: output.mp4
    exit /b
)

:: 构建输入文件参数字符串
set "input_files="
for /l %%A in (0,1,%num_columns%) do (
    set "input_files=!input_files! -i ok.mp4 
)

:: 构建视频过滤器复合字符串
set "filter_complex="
for /l %%A in (0,1,%num_columns%) do (
    set "filter_complex=!filter_complex![%%A:v]"
)

:: 根据设置的方向类型构建视频堆叠过滤器
if "%directionType%" == "-t" (
    if "%directionTypeValue%"=="h" (
      set "filter_complex=!filter_complex!hstack=inputs=%num_columns_total%[v]"
      :: 运行 FFmpeg 命令，处理视频并生成中间文件 ok1.mp4
      ffmpeg %input_files% -filter_complex "!filter_complex!" -map "[v]" -map 0:a -y ok1.mp4
    ) else if "%directionTypeValue%"=="hv" ( 

      if exist ok1H.mp4 (
          echo ok1H.mp4文件存在          
      ) else (
          set "filter_complexH=!filter_complex!hstack=inputs=%num_columns_total%[v]"
          :: 运行 FFmpeg 命令，处理视频并生成中间文件 ok1.mp4
          ffmpeg %input_files% -filter_complex "!filter_complexH!" -map "[v]" -map 0:a -y ok1H.mp4
          echo ok1H.mp4文件不存在
      )

      if exist ok1V.mp4 (
          echo ok1V.mp4文件存在          
      ) else (
          set "filter_complexV=!filter_complex!vstack=inputs=%num_columns_total%[v]"
          :: 运行 FFmpeg 命令，处理视频并生成中间文件 ok1.mp4
          ffmpeg %input_files% -filter_complex "!filter_complexV!" -map "[v]" -map 0:a -y ok1V.mp4
          echo ok1V.mp4文件不存在
      )
      
    ) else if "%directionTypeValue%"=="fhv" ( 
    
      del ok1H.mp4 ok1V.mp4 

      if exist ok1H.mp4 (
          echo ok1H.mp4文件存在          
      ) else (
          set "filter_complexH=!filter_complex!hstack=inputs=%num_columns_total%[v]"
          :: 运行 FFmpeg 命令，处理视频并生成中间文件 ok1.mp4
          ffmpeg %input_files% -filter_complex "!filter_complexH!" -map "[v]" -map 0:a -y ok1H.mp4
          echo ok1H.mp4文件不存在
      )

      if exist ok1V.mp4 (
          echo ok1V.mp4文件存在          
      ) else (
          set "filter_complexV=!filter_complex!vstack=inputs=%num_columns_total%[v]"
          :: 运行 FFmpeg 命令，处理视频并生成中间文件 ok1.mp4
          ffmpeg %input_files% -filter_complex "!filter_complexV!" -map "[v]" -map 0:a -y ok1V.mp4
          echo ok1V.mp4文件不存在
      )
      
    ) else (
      set "filter_complex=!filter_complex!vstack=inputs=%num_columns_total%[v]"
      :: 运行 FFmpeg 命令，处理视频并生成中间文件 ok1.mp4
      ffmpeg %input_files% -filter_complex "!filter_complex!" -map "[v]" -map 0:a -y ok1.mp4
    )
)










set "video_file=ok.mp4"  :: 替换为实际的视频文件名

:: 使用 FFmpeg 获取影片信息
for /f "tokens=* delims=:=x[ " %%A in ('ffmpeg -i %video_file% 2^>^&1 ^| findstr /C:"Stream #0:0"') do (
    set "video_info=%%A"

    :: 使用一个额外的循环来遍历每个 token
    for %%B in (!video_info!) do (
      ::echo Token: %%B
      echo %%B | find "x" > nul
      if not errorlevel 1 (
            :: 根据 "x" 字符进行分割并提取宽度和高度
            for /f "tokens=1,2 delims=x" %%X in ("%%B") do (
                set "width=%%X"
                set "height=%%Y"
            )

       )
     )
)
echo Width: !width!
echo Height: !height!
set scaleHeightValue=!height!
set scaleWidthValue=!width!











set "video_file=ok1.mp4"  :: 替换为实际的视频文件名
if "%directionTypeValue%"=="hv" ( 
    set "video_file=ok1V.mp4"  :: 替换为实际的视频文件名
)

:: 使用 FFmpeg 获取影片信息
for /f "tokens=* delims=:=x[ " %%A in ('ffmpeg -i !video_file! 2^>^&1 ^| findstr /C:"Stream #0:0"') do (
    set "video_info=%%A"

    :: 使用一个额外的循环来遍历每个 token
    for %%B in (!video_info!) do (
      ::echo Token: %%B
      echo %%B | find "x" > nul
      if not errorlevel 1 (
            :: 根据 "x" 字符进行分割并提取宽度和高度
            for /f "tokens=1,2 delims=x" %%X in ("%%B") do (
                set "width=%%X"
                set "height=%%Y"
            )

       )
     )
)
echo Width: !width!
echo Height: !height!

if "%directionTypeValue%"=="hv" ( 
    set "video_file=ok1H.mp4"  :: 替换为实际的视频文件名
    
    :: 使用 FFmpeg 获取影片信息
    for /f "tokens=* delims=:=x[ " %%A in ('ffmpeg -i !video_file! 2^>^&1 ^| findstr /C:"Stream #0:0"') do (
        set "video_info=%%A"

        :: 使用一个额外的循环来遍历每个 token
        for %%B in (!video_info!) do (
          ::echo Token: %%B
          echo %%B | find "x" > nul
          if not errorlevel 1 (
                :: 根据 "x" 字符进行分割并提取宽度和高度
                for /f "tokens=1,2 delims=x" %%X in ("%%B") do (
                    set "widthH=%%X"
                    set "heightH=%%Y"
                )

           )
         )
    )
    echo Width_H: !widthH!
    echo Height_H: !heightH!
)



if "%directionTypeValue%"=="h" (
    set /a "number=!height!*!scaleWidthValue!*10/!width!"
    set "divisor=20"

    set /a "remainder=!number! %% !divisor!"
    if !remainder! equ 0 (
        echo !number! height can be divided by !divisor!.
        set scaleHeightValue=-1
    ) else (
        echo !number! cannot be divided by !divisor!.
        set scaleHeightValue=!height!*!scaleWidthValue!/!Width!
    )
) else if "%directionTypeValue%"=="hv" ( 
    set /a "number=!Width!*!scaleHeightValue!*10/!height!"
    set  "numberFun=!Width!*!scaleHeightValue!*10/!height!"
    set "divisor=20"

    set /a "remainder=!number! %% !divisor!"
    if !remainder! equ 0 (
        echo !number! width can be divided by !divisor!.
        set /a scaleWidthValueV=!Width!*!scaleHeightValue!/!height! 
        echo scaleWidthValueV is set to  !scaleWidthValueV!.
    ) else (
        echo !number! width cannot be divided by !divisor!.function: !numberFun!
        set /a scaleWidthValueV=!Width!*!scaleHeightValue!/!height!+1
        echo scaleWidthValueV is set to  !scaleWidthValueV!.
    )
    set /a scaleWidthPlusValue=!scaleWidthValue!+!scaleWidthValueV!
    echo scaleWidthPlusValue is set to  !scaleWidthPlusValue!.
    
    set /a "number=!heightH!*!scaleWidthPlusValue!*10/!widthH!"
    set "divisor=20"

    set /a "remainder=!number! %% !divisor!"
    if !remainder! equ 0 (
        echo !number! height can be divided by !divisor!.
        set scaleHeightPlusValue=-1
        echo scaleHeightPlusValue is set to  !scaleHeightPlusValue!.
    ) else (
        echo !number! height cannot be divided by !divisor!.
        set /a scaleHeightPlusValue=!heightH!*!scaleWidthPlusValue!/!WidthH!+1
        echo scaleHeightPlusValue: !scaleHeightPlusValue!
        echo scaleHeightPlusValue is set to  !scaleHeightPlusValue!.
    )
) else (
    set /a "number=!Width!*%scaleHeightValue%*10/!height!"
    set "divisor=20"

    set /a "remainder=!number! %% !divisor!"
    if !remainder! equ 0 (
        echo !number! width can be divided by !divisor!.
        set scaleWidthValue=-1
    ) else (
        echo !number! cannot be divided by !divisor!.
        set scaleWidthValue=!Width!*!scaleHeightValue!/!height!
    )
)


echo scaleWidthPlusValue: !scaleWidthPlusValue!
echo scaleHeightPlusValue: !scaleHeightPlusValue!


if "%directionTypeValue%"=="hv" ( 
    :: 根据设置的缩放类型，对中间文件 ok1.mp4 进行缩放处理并生成中间文件 ok2.mp4
    echo ffmpeg -i ok1H.mp4 -vf scale=!scaleWidthPlusValue!:!scaleHeightPlusValue! -y ok2H.mp4
    ffmpeg -i ok1H.mp4 -vf scale=!scaleWidthPlusValue!:!scaleHeightPlusValue! -y ok2H.mp4
    :: 根据设置的缩放类型，对中间文件 ok1.mp4 进行缩放处理并生成中间文件 ok2.mp4
    ffmpeg -i ok1V.mp4 -vf scale=!scaleWidthValueV!:!scaleHeightValue! -y ok2V.mp4    
) else (
    :: 根据设置的缩放类型，对中间文件 ok1.mp4 进行缩放处理并生成中间文件 ok2.mp4
    ffmpeg -i ok1.mp4 -vf scale=%scaleWidthValue%:%scaleHeightValue% -y ok2.mp4
)

if "%directionTypeValue%"=="h" (
    :: 运行 FFmpeg 命令，将原始视频 ok.mp4 和缩放后的视频 ok2.mp4 垂直堆叠，并生成最终输出文件 output.mp4
    ffmpeg  -i ok.mp4  -i ok2.mp4  -filter_complex "[0:v][1:v]vstack=inputs=2[v]" -map "[v]" -map 0:a -y output.mp4
) else if "%directionTypeValue%"=="hv" ( 
    :: 运行 FFmpeg 命令，将原始视频 ok.mp4 和缩放后的视频 ok2.mp4 垂直堆叠，并生成最终输出文件 output.mp4
    ffmpeg  -i ok.mp4  -i ok2V.mp4  -filter_complex "[0:v][1:v]hstack=inputs=2[v]" -map "[v]" -map 0:a -y output1.mp4
    ::ffmpeg  -i output1.mp4  -i ok2V.mp4  -filter_complex "[0:v][1:v]hstack=inputs=2[v]" -map "[v]" -map 0:a -y output2.mp4
    :: 运行 FFmpeg 命令，将原始视频 ok.mp4 和缩放后的视频 ok2.mp4 垂直堆叠，并生成最终输出文件 output.mp4
    ffmpeg  -i output1.mp4  -i ok2H.mp4  -filter_complex "[0:v][1:v]vstack=inputs=2[v]" -map "[v]" -map 0:a -y output.mp4
) else (
    :: 运行 FFmpeg 命令，将原始视频 ok.mp4 和缩放后的视频 ok2.mp4 垂直堆叠，并生成最终输出文件 output.mp4
    ffmpeg  -i ok.mp4  -i ok2.mp4  -filter_complex "[0:v][1:v]hstack=inputs=2[v]" -map "[v]" -map 0:a -y output.mp4
)
:: 输出生成的 FFmpeg 命令
echo ffmpeg %input_files% -filter_complex "!filter_complex!" -map "[v]" -map 0:a -y ok1.mp4
echo ffmpeg -i ok1.mp4 -vf scale=%scaleWidthValue%:%scaleHeightValue% -y ok2.mp4
echo ffmpeg  -i ok.mp4  -i ok2.mp4  -filter_complex "[0:v][1:v]hstack=inputs=2[v]" -map "[v]" -map 0:a -y output.mp4

endlocal
