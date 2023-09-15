#!/bin/bash


icon_path="studio.png"
exec_path="studio.sh"
desktop_file="android-studio.desktop"

if [ $# -ne 3 ]; then
    echo "Usage: $0   <icon_path> <exec_path> <desktop_file>"
    echo "e.g. $0    $icon_path $exec_path $desktop_file"
    exit 1
fi

icon_path="$1"
exec_path="$2"
desktop_file="$3"

current_path="$PWD"
echo "Current path is: $current_path"

cat << EOF > "$desktop_file"
[Desktop Entry]
Version=1.0
Type=Application
Name=Android Studio
Icon=$current_path/$icon_path
Exec=$current_path/$exec_path
Comment=Integrated Development Environment
Categories=Development;IDE;
Terminal=false
StartupWMClass=android-studio
EOF

chmod +x "$desktop_file"

home_path="$HOME"
echo "Home path is: $home_path"


cp "$desktop_file" "$HOME/Desktop/"

echo "Android Studio desktop shortcut has been created at: $desktop_file"

