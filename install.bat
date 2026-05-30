@echo off
:: Ordner erstellen, falls sie nicht existieren
mkdir "C:\Scripts" >nul 2>&1
mkdir "C:\Icons" >nul 2>&1

:: Dateien an die richtige Stelle kopieren (IExpress entpackt sie zuerst in ein temporäres Verzeichnis)
copy /y "CopyFile.ps1" "C:\Scripts\"
copy /y "CopyFile.vbs" "C:\Scripts\"
copy /y "CopyIcon.ico" "C:\Icons\"

:: Registry-Einträge schreiben
reg add "HKEY_CLASSES_ROOT\.copy" /ve /d "CopyFile" /f >nul
reg add "HKEY_CLASSES_ROOT\CopyFile\DefaultIcon" /ve /d "\"C:\Icons\CopyIcon.ico\"" /f >nul
reg add "HKEY_CLASSES_ROOT\CopyFile\shell\open\command" /ve /d "wscript.exe \"C:\Scripts\CopyFile.vbs\" \"%1\"" /f >nul

:: Explorer neu starten, damit das Icon sofort geladen wird
taskkill /f /im explorer.exe >nul
start explorer.exe

echo Installation erfolgreich!