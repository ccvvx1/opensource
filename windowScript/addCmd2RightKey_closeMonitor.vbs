filetype="Directory\Background\shell"


set WSHShell = CreateObject("WScript.Shell")

WshShell.RegWrite "HKCR\" & filetype & "\" & "runasScreenOff\","close screen","REG_SZ"
WshShell.RegWrite "HKCR\" & filetype & "\" & "runasScreenOff\Icon","cmd.exe","REG_SZ"
WshShell.RegWrite "HKCR\" & filetype & "\" & "runasScreenOff\ShowBasedOnVelocityId","6527944","REG_DWORD"
WshShell.RegWrite "HKCR\" & filetype & "\" & "runasScreenOff\command\","U:\application\usbmmidd_v2\usbmmidd_v2\deviceinstaller64.exe  enableidd 0","REG_SZ"
MsgBox "ok!"
