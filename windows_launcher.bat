@echo off
REM I hate batch syntax personally, but sometimes it is useful.
REM To know Chrome path in Windows systems, the best practice is to relay on the following registry key:
REM HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe
REM There is a key called 'Path'. This is the Path of the executable 'chrome.exe'.
REM Executing 'REG QUERY key /v Path' command extracts this text in my Windows 10 installation:
REM     Path    REG_SZ    C:\Program Files (x86)\Google\Chrome\Application
REM We need the third value so we skip 2 values and we set output to variable CHROMEPATH.

FOR /F "skip=2 tokens=2,*" %%A IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" /v Path') DO SET CHROMEPATH=%%B

REM Now 'ECHO %CHROMEPATH%' would output chrome installation path. Nice! Let's chain command so
REM we can execute './chrome --silent-launch --load-and-launch=CURRENT_WORKING_DIRECTORY/app
"%CHROMEPATH%/chrome" --silent-launch --load-and-launch-app=%cd%/app