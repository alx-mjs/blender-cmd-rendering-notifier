start %~dp0check-if-octane-running.bat^
 & "C:\Program Files\BlenderOctane\blender.exe" -b "C:\Somewhere\YourFile.blend" -a^
 & powershell.exe -executionpolicy bypass -command %~dp0send-sms.ps1^
 & taskkill /FI "WindowTitle eq OctaneCrashMonitor*" /T /F