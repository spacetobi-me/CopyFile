Set shell = CreateObject("WScript.Shell")
shell.Run "powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File ""C:\Scripts\CopyFile.ps1"" """ & WScript.Arguments(0) & """", 0, False