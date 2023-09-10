#!/bin/bash

# 检查是否提供了参数
if [ $# -eq 0 ]; then
	echo "请提供要添加到文件的参数。 [-t new]"
	exit 1
fi

# 检查是否提供了-type参数
if [ "$2" = "-t" ]; then
	if [ "$3" = "new" ]; then
		# 删除文件
		rm -f ~/tmp/tmp.txt
		echo "已删除文件 '$file_path'。"
		# 指定要附加到的文件路径
		file_path=~/tmp/tmp.txt

		# 附加参数到文件中
		echo "$1" >> "$file_path"
		echo "已将参数 '$1' 附加到文件 '$file_path' 中。"
	else
		echo "未识别的-type参数值 '$2'。 [-t new]"
	fi
else
	# 指定要附加到的文件路径
	file_path=~/tmp/tmp.txt

	# 附加参数到文件中
	echo "$1" >> "$file_path"
	echo "已将参数 '$1' 附加到文件 '$file_path' 中。"
fi

