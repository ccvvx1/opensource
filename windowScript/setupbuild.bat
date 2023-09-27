xcopy C:\Users\Administrator\AppData\Local\Google U:\Users\Administrator\AppData\Local\Google /E/H/C/I
rd /s /q C:\Users\Administrator\AppData\Local\Google
mklink /J C:\Users\Administrator\AppData\Local\Google U:\Users\Administrator\AppData\Local\Google

xcopy C:\Program Files\Google U:\Program Files\Google /E/H/C/I
rd /s /q C:\Program Files\Google
mklink /J C:\Program Files\Google U:\Program Files\Google

::=================================================================
xcopy C:\Users\Administrator\.cargo u:\Users\Administrator\.cargo /E/H/C/I
rd /s /q C:\Users\Administrator\.cargo
mklink /J C:\Users\Administrator\.cargo u:\Users\Administrator\.cargo

xcopy C:\Users\Administrator\.rustup u:\Users\Administrator\.rustup /E/H/C/I
rd /s /q C:\Users\Administrator\.rustup
mklink /J C:\Users\Administrator\.rustup u:\Users\Administrator\.rustup

xcopy C:\Users\Administrator\.gradle u:\Users\Administrator\.gradle /E/H/C/I
rd /s /q C:\Users\Administrator\.gradle
mklink /J C:\Users\Administrator\.gradle u:\Users\Administrator\.gradle

xcopy C:\Users\Administrator\.android u:\Users\Administrator\.android /E/H/C/I
rd /s /q C:\Users\Administrator\.android
mklink /J C:\Users\Administrator\.android u:\Users\Administrator\.android


::=================================================================
xcopy C:\Users\Administrator\AppData\Local\JetBrains U:\Users\Administrator\AppData\Local\JetBrains /E/H/C/I
rd /s /q C:\Users\Administrator\AppData\Local\JetBrains
mklink /J C:\Users\Administrator\AppData\Local\JetBrains U:\Users\Administrator\AppData\Local\JetBrains


::=================================================================
xcopy "C:\Program Files (x86)\Windows Kits" "U:\Program Files (x86)\Windows Kits" /E/H/C/I
rd /s /q "C:\Program Files (x86)\Windows Kits"
mklink /J  "C:\Program Files (x86)\Windows Kits"  "U:\Program Files (x86)\Windows Kits"

xcopy "C:\Program Files (x86)\Microsoft SDKs" "U:\Program Files (x86)\Microsoft SDKs" /E/H/C/I
rd /s /q "C:\Program Files (x86)\Microsoft SDKs"
mklink /J   "C:\Program Files (x86)\Microsoft SDKs"   "U:\Program Files (x86)\Microsoft SDKs"