#!/bin/bash

# 
source_file="/path/to/hello.txt"

#
link_name="hello.txt"

if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_file> <link_name>"
    echo "e.g. $0 $source_file $link_name"
    exit 1
fi

source_file="$1"
link_name="$2"


current_path="$PWD"
echo "Current path is: $current_path"

#
sudo ln -sf "$current_path/$source_file" "/usr/local/bin/$link_name"

echo "Shortcut created: $link_name"
