#!/bin/bash

# 源文件夹路径
source_folder="/home/tmw/shared/png"

# 目标文件夹路径
target_folder="/home/tmw/shared/pngcp"

# 循环复制图片
for i in {1..4000}; do
    # 获取当前图片的编号，使用 % 5 循环使用 image1.jpg 到 image5.jpg
    img_number=$(( (i - 1) % 5 + 0 ))

    # 格式化图片编号为三位数，例如 1 变成 001
    img_number_formatted=$(printf "%03d" "$img_number")

    # 构造源文件名和目标文件名
    source_file="$source_folder/image_0000$img_number.png"
    
    img_number_formatted=$(printf "%05d" "$i")
    target_file="$target_folder/image_$img_number_formatted.png"

    # 复制文件
    cp "$source_file" "$target_file"
done

