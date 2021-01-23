@echo off
:OCTANE
TITLE OctaneCrashMonitor
tasklist.exe | findstr "OctaneServer.exe" > nul
cls
if errorlevel 1 (
echo "OCTANE CRASHED! SENDING SMS..."
powershell.exe -executionpolicy bypass -command %~dp0send-sms.ps1 $False
timeout /t 10
exit
) ELSE (
type octane-icon.txt
echo.
echo             OCTANE IS RUNNING!
timeout /t 10
GOTO OCTANE
)