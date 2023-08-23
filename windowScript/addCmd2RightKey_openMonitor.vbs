filetype="Directory\Background\shell"


set WSHShell = CreateObject("WScript.Shell")

WshShell.RegWrite "HKCR\" & filetype & "\" & "runasScreenOn\","open screen","REG_SZ"
WshShell.RegWrite "HKCR\" & filetype & "\" & "runasScreenOn\Icon","cmd.exe","REG_SZ"
WshShell.RegWrite "HKCR\" & filetype & "\" & "runasScreenOn\ShowBasedOnVelocityId","6527944","REG_DWORD"
WshShell.RegWrite "HKCR\" & filetype & "\" & "runasScreenOn\command\","U:\application\usbmmidd_v2\usbmmidd_v2\deviceinstaller64.exe  enableidd 1","REG_SZ"
MsgBox "ok!"
