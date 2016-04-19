@ECHO OFF
color 0a
title  迁移库到指定文件夹  はなふぶき

echo.
set /p weizhi=请输入迁移目标分区盘符(如D):
echo.


rem 文件夹
md "%weizhi%:\User\Documents"
md "%weizhi%:\User\Desktop"
md "%weizhi%:\User\Favorites"
md "%weizhi%:\User\Music"
md "%weizhi%:\User\Pictures"
md "%weizhi%:\User\Videos"
md "%weizhi%:\User\Saved Games"
md "%weizhi%:\User\Contacts"
md "%weizhi%:\User\Searches"
md "%weizhi%:\User\Links"

rem %USERPROFILE%\Documents


rem 文件夹名称
echo [.ShellClassInfo] >>"%weizhi%:\User\desktop.ini"
echo LocalizedResourceName=库 >>"%weizhi%:\User\desktop.ini"
echo IconResource=C:\windows\system32\SHELL32.dll,46 >>"%weizhi%:\User\desktop.ini"
attrib "%weizhi%:\User\desktop.ini" +r +h +s
attrib "%weizhi%:\User" +r

echo [.ShellClassInfo] >>"%weizhi%:\User\Desktop\desktop.ini"
echo LocalizedResourceName=@%SystemRoot%\system32\shell32.dll,-21769 >>"%weizhi%:\User\Desktop\desktop.ini"
echo [LocalizedFileNames] >>"%weizhi%:\User\Desktop\desktop.ini"
echo Task Scheduler.lnk=@%SystemRoot%\system32\miguiresource.dll,-201 >>"%weizhi%:\User\Desktop\desktop.ini"
echo Remote Desktop Connection.lnk=@%SystemRoot%\system32\mstsc.exe,-4000 >>"%weizhi%:\User\Desktop\desktop.ini"
attrib "%weizhi%:\User\Desktop\desktop.ini" +r +h +s
attrib "%weizhi%:\User\Desktop" +r

echo [.ShellClassInfo] >>"%weizhi%:\User\Documents\desktop.ini"
echo LocalizedResourceName=@%SystemRoot%\system32\shell32.dll,-21770 >>"%weizhi%:\User\Documents\desktop.ini"
attrib "%weizhi%:\User\Documents\desktop.ini" +r +h +s
attrib "%weizhi%:\User\Documents" +r

echo [.ShellClassInfo] >>"%weizhi%:\User\Favorites\desktop.ini"
echo LocalizedResourceName=@%SystemRoot%\system32\shell32.dll,-21796 >>"%weizhi%:\User\Favorites\desktop.ini"
attrib "%weizhi%:\User\Favorites\desktop.ini" +r +h +s
attrib "%weizhi%:\User\Favorites" +r

echo [.ShellClassInfo] >>"%weizhi%:\User\Music\desktop.ini"
echo LocalizedResourceName=@%SystemRoot%\system32\shell32.dll,-21790 >>"%weizhi%:\User\Music\desktop.ini"
attrib "%weizhi%:\User\Music\desktop.ini" +r +h +s
attrib "%weizhi%:\User\Music" +r

echo [.ShellClassInfo] >>"%weizhi%:\User\Pictures\desktop.ini"
echo LocalizedResourceName=@%SystemRoot%\system32\shell32.dll,-21779 >>"%weizhi%:\User\Pictures\desktop.ini"
attrib "%weizhi%:\User\Pictures\desktop.ini" +r +h +s
attrib "%weizhi%:\User\Pictures" +r

echo [.ShellClassInfo] >>"%weizhi%:\User\Videos\desktop.ini"
echo LocalizedResourceName=@%SystemRoot%\system32\shell32.dll,-21791 >>"%weizhi%:\User\Videos\desktop.ini"
attrib "%weizhi%:\User\Videos\desktop.ini" +r +h +s
attrib "%weizhi%:\User\Videos" +r

echo [.ShellClassInfo] >>"%weizhi%:\User\Saved Games\desktop.ini"
echo LocalizedResourceName=@%SystemRoot%\system32\shell32.dll,-21814 >>"%weizhi%:\User\Saved Games\desktop.ini"
attrib "%weizhi%:\User\Saved Games\desktop.ini" +r +h +s
attrib "%weizhi%:\User\Saved Games" +r

echo [.ShellClassInfo] >>"%weizhi%:\User\Contacts\desktop.ini"
echo LocalizedResourceName=@%CommonProgramFiles%\system\wab32res.dll,-10100 >>"%weizhi%:\User\Contacts\desktop.ini"
attrib "%weizhi%:\User\Contacts\desktop.ini" +r +h +s
attrib "%weizhi%:\User\Contacts" +r

echo [.ShellClassInfo] >>"%weizhi%:\User\Searches\desktop.ini"
echo LocalizedResourceName=@%SystemRoot%\system32\shell32.dll,-9031 >>"%weizhi%:\User\Searches\desktop.ini"
echo [LocalizedFileNames] >>"%weizhi%:\User\Searches\desktop.ini"
echo Everywhere.search-ms=@searchfolder.dll,-32822 >>"%weizhi%:\User\Searches\desktop.ini"
echo Indexed Locations.search-ms=@searchfolder.dll,-32820 >>"%weizhi%:\User\Searches\desktop.ini"
attrib "%weizhi%:\User\Searches\desktop.ini" +r +h +s
attrib "%weizhi%:\User\Searches" +r

echo [.ShellClassInfo] >>"%weizhi%:\User\Links\desktop.ini"
echo LocalizedResourceName=@%SystemRoot%\system32\shell32.dll,-21810 >>"%weizhi%:\User\Links\desktop.ini"
echo [LocalizedFileNames] >>"%weizhi%:\User\Links\desktop.ini"
echo Desktop.lnk=@shell32.dll,-21769 >>"%weizhi%:\User\Links\desktop.ini"
echo Downloads.lnk=@shell32.dll,-21798 >>"%weizhi%:\User\Links\desktop.ini"
echo RecentPlaces.lnk=@shell32.dll,-37217 >>"%weizhi%:\User\Links\desktop.ini"
attrib "%weizhi%:\User\Links\desktop.ini" +r +h +s
attrib "%weizhi%:\User\Links" +r

cls
set /p a=【谨慎使用】文件夹已创建完成,请输入Y确认写入注册表：
if %a%==y goto zhucebiao
exit
:zhucebiao
rem 注册表
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Personal /t REG_EXPAND_SZ /d "%weizhi%:\User\Documents" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop /t REG_EXPAND_SZ /d "%weizhi%:\User\Desktop" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Favorites /t REG_EXPAND_SZ /d "%weizhi%:\User\Favorites" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v My Music /t REG_EXPAND_SZ /d "%weizhi%:\User\Music" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v My Pictures /t REG_EXPAND_SZ /d "%weizhi%:\User\Pictures" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v My Video /t REG_EXPAND_SZ /d "%weizhi%:\User\Videos" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {374DE290-123F-4565-9164-39C4925E467B} /t REG_EXPAND_SZ /d "E:\下载" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4} /t REG_EXPAND_SZ /d "%weizhi%:\User\Saved Games" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {56784854-C6CB-462B-8169-88E350ACB882} /t REG_EXPAND_SZ /d "%weizhi%:\User\Contacts" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {7D1D3A04-DEBB-4115-95CF-2F29DA2920DA} /t REG_EXPAND_SZ /d "%weizhi%:\User\Searches" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968} /t REG_EXPAND_SZ /d "%weizhi%:\User\Links" /f
cls
echo 写入已完成,按任意键退出\
pause
