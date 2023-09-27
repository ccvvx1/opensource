@echo off
setlocal enabledelayedexpansion

del ok1.mp4 ok2.mp4 ok3.mp4 ok4.mp4  ok2H.mp4 ok2V.mp4 output.mp4 output1.mp4

:: �Ӳ�����ȡ���÷���������Ϣ
set "directionType=%2"
set "directionTypeValue=%3"

:: ��ȡҪ�������Ƶ������������������
set "num_columns=%~1"
set /a "num_columns_total=!num_columns!+1"

if "%directionTypeValue%"=="" (
    echo Usage: %0 num_columns -t [h^|v^|hv^|fhv]
    echo result mp4: output.mp4
    exit /b
)

:: ���������ļ������ַ���
set "input_files="
for /l %%A in (0,1,%num_columns%) do (
    set "input_files=!input_files! -i ok.mp4 
)

:: ������Ƶ�����������ַ���
set "filter_complex="
for /l %%A in (0,1,%num_columns%) do (
    set "filter_complex=!filter_complex![%%A:v]"
)

:: �������õķ������͹�����Ƶ�ѵ�������
if "%directionType%" == "-t" (
    if "%directionTypeValue%"=="h" (
      set "filter_complex=!filter_complex!hstack=inputs=%num_columns_total%[v]"
      :: ���� FFmpeg ���������Ƶ�������м��ļ� ok1.mp4
      ffmpeg %input_files% -filter_complex "!filter_complex!" -map "[v]" -map 0:a -y ok1.mp4
    ) else if "%directionTypeValue%"=="hv" ( 

      if exist ok1H.mp4 (
          echo ok1H.mp4�ļ�����          
      ) else (
          set "filter_complexH=!filter_complex!hstack=inputs=%num_columns_total%[v]"
          :: ���� FFmpeg ���������Ƶ�������м��ļ� ok1.mp4
          ffmpeg %input_files% -filter_complex "!filter_complexH!" -map "[v]" -map 0:a -y ok1H.mp4
          echo ok1H.mp4�ļ�������
      )

      if exist ok1V.mp4 (
          echo ok1V.mp4�ļ�����          
      ) else (
          set "filter_complexV=!filter_complex!vstack=inputs=%num_columns_total%[v]"
          :: ���� FFmpeg ���������Ƶ�������м��ļ� ok1.mp4
          ffmpeg %input_files% -filter_complex "!filter_complexV!" -map "[v]" -map 0:a -y ok1V.mp4
          echo ok1V.mp4�ļ�������
      )
      
    ) else if "%directionTypeValue%"=="fhv" ( 
    
      del ok1H.mp4 ok1V.mp4 

      if exist ok1H.mp4 (
          echo ok1H.mp4�ļ�����          
      ) else (
          set "filter_complexH=!filter_complex!hstack=inputs=%num_columns_total%[v]"
          :: ���� FFmpeg ���������Ƶ�������м��ļ� ok1.mp4
          ffmpeg %input_files% -filter_complex "!filter_complexH!" -map "[v]" -map 0:a -y ok1H.mp4
          echo ok1H.mp4�ļ�������
      )

      if exist ok1V.mp4 (
          echo ok1V.mp4�ļ�����          
      ) else (
          set "filter_complexV=!filter_complex!vstack=inputs=%num_columns_total%[v]"
          :: ���� FFmpeg ���������Ƶ�������м��ļ� ok1.mp4
          ffmpeg %input_files% -filter_complex "!filter_complexV!" -map "[v]" -map 0:a -y ok1V.mp4
          echo ok1V.mp4�ļ�������
      )
      
    ) else (
      set "filter_complex=!filter_complex!vstack=inputs=%num_columns_total%[v]"
      :: ���� FFmpeg ���������Ƶ�������м��ļ� ok1.mp4
      ffmpeg %input_files% -filter_complex "!filter_complex!" -map "[v]" -map 0:a -y ok1.mp4
    )
)










set "video_file=ok.mp4"  :: �滻Ϊʵ�ʵ���Ƶ�ļ���

:: ʹ�� FFmpeg ��ȡӰƬ��Ϣ
for /f "tokens=* delims=:=x[ " %%A in ('ffmpeg -i %video_file% 2^>^&1 ^| findstr /C:"Stream #0:0"') do (
    set "video_info=%%A"

    :: ʹ��һ�������ѭ��������ÿ�� token
    for %%B in (!video_info!) do (
      ::echo Token: %%B
      echo %%B | find "x" > nul
      if not errorlevel 1 (
            :: ���� "x" �ַ����зָ��ȡ��Ⱥ͸߶�
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











set "video_file=ok1.mp4"  :: �滻Ϊʵ�ʵ���Ƶ�ļ���
if "%directionTypeValue%"=="hv" ( 
    set "video_file=ok1V.mp4"  :: �滻Ϊʵ�ʵ���Ƶ�ļ���
)

:: ʹ�� FFmpeg ��ȡӰƬ��Ϣ
for /f "tokens=* delims=:=x[ " %%A in ('ffmpeg -i !video_file! 2^>^&1 ^| findstr /C:"Stream #0:0"') do (
    set "video_info=%%A"

    :: ʹ��һ�������ѭ��������ÿ�� token
    for %%B in (!video_info!) do (
      ::echo Token: %%B
      echo %%B | find "x" > nul
      if not errorlevel 1 (
            :: ���� "x" �ַ����зָ��ȡ��Ⱥ͸߶�
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
    set "video_file=ok1H.mp4"  :: �滻Ϊʵ�ʵ���Ƶ�ļ���
    
    :: ʹ�� FFmpeg ��ȡӰƬ��Ϣ
    for /f "tokens=* delims=:=x[ " %%A in ('ffmpeg -i !video_file! 2^>^&1 ^| findstr /C:"Stream #0:0"') do (
        set "video_info=%%A"

        :: ʹ��һ�������ѭ��������ÿ�� token
        for %%B in (!video_info!) do (
          ::echo Token: %%B
          echo %%B | find "x" > nul
          if not errorlevel 1 (
                :: ���� "x" �ַ����зָ��ȡ��Ⱥ͸߶�
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
    :: �������õ��������ͣ����м��ļ� ok1.mp4 �������Ŵ��������м��ļ� ok2.mp4
    echo ffmpeg -i ok1H.mp4 -vf scale=!scaleWidthPlusValue!:!scaleHeightPlusValue! -y ok2H.mp4
    ffmpeg -i ok1H.mp4 -vf scale=!scaleWidthPlusValue!:!scaleHeightPlusValue! -y ok2H.mp4
    :: �������õ��������ͣ����м��ļ� ok1.mp4 �������Ŵ��������м��ļ� ok2.mp4
    ffmpeg -i ok1V.mp4 -vf scale=!scaleWidthValueV!:!scaleHeightValue! -y ok2V.mp4    
) else (
    :: �������õ��������ͣ����м��ļ� ok1.mp4 �������Ŵ��������м��ļ� ok2.mp4
    ffmpeg -i ok1.mp4 -vf scale=%scaleWidthValue%:%scaleHeightValue% -y ok2.mp4
)

if "%directionTypeValue%"=="h" (
    :: ���� FFmpeg �����ԭʼ��Ƶ ok.mp4 �����ź����Ƶ ok2.mp4 ��ֱ�ѵ�����������������ļ� output.mp4
    ffmpeg  -i ok.mp4  -i ok2.mp4  -filter_complex "[0:v][1:v]vstack=inputs=2[v]" -map "[v]" -map 0:a -y output.mp4
) else if "%directionTypeValue%"=="hv" ( 
    :: ���� FFmpeg �����ԭʼ��Ƶ ok.mp4 �����ź����Ƶ ok2.mp4 ��ֱ�ѵ�����������������ļ� output.mp4
    ffmpeg  -i ok.mp4  -i ok2V.mp4  -filter_complex "[0:v][1:v]hstack=inputs=2[v]" -map "[v]" -map 0:a -y output1.mp4
    ::ffmpeg  -i output1.mp4  -i ok2V.mp4  -filter_complex "[0:v][1:v]hstack=inputs=2[v]" -map "[v]" -map 0:a -y output2.mp4
    :: ���� FFmpeg �����ԭʼ��Ƶ ok.mp4 �����ź����Ƶ ok2.mp4 ��ֱ�ѵ�����������������ļ� output.mp4
    ffmpeg  -i output1.mp4  -i ok2H.mp4  -filter_complex "[0:v][1:v]vstack=inputs=2[v]" -map "[v]" -map 0:a -y output.mp4
) else (
    :: ���� FFmpeg �����ԭʼ��Ƶ ok.mp4 �����ź����Ƶ ok2.mp4 ��ֱ�ѵ�����������������ļ� output.mp4
    ffmpeg  -i ok.mp4  -i ok2.mp4  -filter_complex "[0:v][1:v]hstack=inputs=2[v]" -map "[v]" -map 0:a -y output.mp4
)
:: ������ɵ� FFmpeg ����
echo ffmpeg %input_files% -filter_complex "!filter_complex!" -map "[v]" -map 0:a -y ok1.mp4
echo ffmpeg -i ok1.mp4 -vf scale=%scaleWidthValue%:%scaleHeightValue% -y ok2.mp4
echo ffmpeg  -i ok.mp4  -i ok2.mp4  -filter_complex "[0:v][1:v]hstack=inputs=2[v]" -map "[v]" -map 0:a -y output.mp4

endlocal
