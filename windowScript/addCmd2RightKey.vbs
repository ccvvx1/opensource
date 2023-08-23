filetype="Directory\Background\shell"


set WSHShell = CreateObject("WScript.Shell")

WshShell.RegWrite "HKCR\" & filetype & "\" & "cmdcmd\","ÕæµÄcmd","REG_SZ"
WshShell.RegWrite "HKCR\" & filetype & "\" & "cmdcmd\Icon","cmd.exe","REG_SZ"
WshShell.RegWrite "HKCR\" & filetype & "\" & "cmdcmd\ShowBasedOnVelocityId","6527944","REG_DWORD"
WshShell.RegWrite "HKCR\" & filetype & "\" & "cmdcmd\command\","cmd /K","REG_SZ"
MsgBox "ok!"
