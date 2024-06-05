@echo off
set oldcd=%cd%
%SystemDrive%
if exist %SystemDrive%\Users\. goto vista
if exist "%SystemDrive%\Documents And Settings\." goto xp
echo Couldn't find start menu folder. This batch file runs on Vista or higher
goto end
:xp
set startMenuUser=\Start Menu
set startMenuAll=%ALLUSERSPROFILE%\Desktop
cd "\Documents And Settings"
goto begin
:vista
set startMenuUser=\APPDATA\Roaming\Microsoft\Windows\Start Menu
set startMenuAll=%ProgramData%\Microsoft\Windows\Start Menu\Programs
cd \Users
:begin
set smgroup=My Shortcuts
set /P smgroup=Enter Startmenu Group[%smgroup%]:
if "%smgroup%"=="" set smgroup=My Shortcuts
echo Creating folders...
if not exist "%StartMenuAll%\%SMGroup%\." md "%StartMenuAll%\%SMGroup%"
for /D %%u in (*) do if not exist "%StartMenuAll%\%SMGroup%\%%u" md "%StartMenuAll%\%SMGroup%\%%u"
echo Copying Shortcuts...
for /D %%u in (*) do robocopy "%%u%startMenuUser%" "%StartMenuAll%\%SMGroup%\%%u" /MIR
:end
pause
cd %oldcd%
