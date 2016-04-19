@echo off
color 0a
mode con lines=11 cols=40

title  隐藏硬盘  はなふぶき
echo.
echo.
echo      隐藏硬盘(慎用) 
echo                 1.隐藏
echo                 2.禁用
echo                 q.退出
echo.
echo.
set /p choice=          输入动作：
if {%choice%}=={} goto END
if /i %choice%==q goto END
if /i %choice%==1 set ML=NoDrives
if /i %choice%==2 set ML=NoViewOnDrive
set /p PF=          输入要隐藏盘符：
cls
::SUN
set SUN=%PF%
::命令
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v %%ML%% /d %%SUN%% /t REG_DWORD /f 
cmd /c taskkill /f /im explorer.exe&&explorer.exe
exit
:END
exit
