@echo off
echo Modifying Windows XP WPA Registry...

REM Clear the OOBETimer registry value data
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WPAEvents" /v OOBETimer /t REG_BINARY /d "" /f

if %errorlevel% equ 0 (
    echo Registry modification successful.
) else (
    echo Registry modification failed. Make sure you're running as Administrator.
)

REM Get the directory where this batch file is located
set "SCRIPT_DIR=%~dp0"

REM Create the restart message file
echo please restart windows xp > "%SCRIPT_DIR%restart_message.txt"

echo Text file created: %SCRIPT_DIR%restart_message.txt
echo.
echo Script completed. Please restart Windows XP as indicated.
pause