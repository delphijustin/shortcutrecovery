@echo off
set copying=
if not "%1"=="" goto copyshortcuts
echo delphijustin Industries ShortcutRecovery v1.0
echo https://delphijustin.biz
echo.
set oldcd=%cd%
%SystemDrive%
if exist %SystemDrive%\Users\. goto vista
if exist "%SystemDrive%\Documents And Settings\." goto xp
echo Couldn't find start menu folder. This batch file runs on Windows 2000 or higher
goto end
:copyshortcuts
echo Copying %1 Shortcuts...
md "%startMenuAll%\%smgroup%\%1"
for /R "%1\%StartMenuUser%" %%f in (*.lnk) do copy /Y "%%f" "%startMenuAll%\%smgroup%\%1" > nul
for /R "%1\%StartMenuUser%" %%f in (*.pif) do copy /Y "%%f" "%startMenuAll%\%smgroup%\%1" > nul
for /R "%1\%StartMenuUser%" %%f in (*.url) do copy /Y "%%f" "%startMenuAll%\%smgroup%\%1" > nul
goto done
:xp
set startMenuUser=\Start Menu
set startMenuAll=%ALLUSERSPROFILE%\Start Menu\Programs
cd "\Documents And Settings"
goto begin
:vista
set startMenuUser=\APPDATA\Roaming\Microsoft\Windows\Start Menu
set startMenuAll=%ProgramData%\Microsoft\Windows\Start Menu\Programs
cd \Users
:begin
echo Enter a start menu folder to store recovered shortcuts in
set smgroup=My Shortcuts
set /P smgroup=Start Menu Group[%smgroup%]:
md "%startMenuAll%\%smgroup%"
for /D %%u in (*) do call %0 %%u
:end
pause
cd %oldcd%
:done
