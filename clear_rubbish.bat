@echo off
echo ==========清除垃圾脚本运行中...==========
echo 清理垃圾文件，速度由电脑文件大小而定。在没看到结尾信息时 
echo 请勿关闭本窗口。 
echo 正在清除系统垃圾文件，请稍后...... 

echo 删除应用运行的产生的临时文件
rd /s /q %temp%\
echo 删除补丁备份目录
rd /s /q %windir%\$hf_mig$
echo 删除系统维护等操作产生的临时文件 
rd /s /q %windir%\temp\ & md %windir%\temp 

echo 删除应用程序临时文件 
del /f /s /q %windir%\prefetch\*.*

echo 把补丁卸载文件夹的名字保存成2950800.txt 
dir %windir%\$NtUninstall* /a:d /b >%windir%\2950800.txt 
echo 从2950800.txt中读取文件夹列表并且删除文件夹 
for /f %%i in (%windir%\2950800.txt) do rd /s /q %windir%\%%i 
echo 删除2950800.txt 
del /f /q /s %windir%\2950800.txt 


echo 删除补丁安装记录内容(下面的del /f /s /q %systemdrive%\*.log已经包含删除此类文件)
del /f /s /q %windir%\KB*.log

echo 删除系统盘目录下临时文件 
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %systemdrive%\*._mp
del /f /s /q %systemdrive%\*.syd
del /f /s /q %systemdrive%\*.$$$
del /f /s /q %systemdrive%\*.@@@
del /f /s /q %systemdrive%\*.~*
del /f /s /q %systemdrive%\*.gts
echo 删除系统盘目录下日志文件 
del /f /s /q %systemdrive%\*.log
echo 删除系统盘目录下 GID 文件(属于临时文件，具体作用不详) 
del /f /s /q %systemdrive%\*.gid
echo 删除系统目录下 scandisk (磁盘扫描)留下的无用文件 
del /f /s /q %systemdrive%\*.chk
echo 删除系统目录下备份文件 
del /f /s /q %systemdrive%\*.bak
del /f /s /q %systemdrive%\*.wbk
del /f /s /q %systemdrive%\*.xlk
del /f /s /q %systemdrive%\*.ckr_
echo 删除系统目录下 old 文件 
del /f /s /q %systemdrive%\*.old
echo 删除回收站的无用文件 
del /f /s /q %systemdrive%\recycled\*.* 

echo 删除系统目录下其他垃圾文件



echo 删除当前用户的 COOKIE(IE)
del /f /q %userprofile%\cookies\*.* 
echo 删除 internet 临时文件 
del /f /s /q "%userprofile%\local settings\temporary internet files\*.*" 
echo 删除当前用户日常操作临时文件 
del /f /s /q "%userprofile%\local settings\temp\*.*" 
echo 删除访问记录(开始菜单中的文档里面的东西)
del /f /s /q "%userprofile%\recent\*.*" 

echo 删除 QQ 运行产生的日志文件
rd /s /q %AppData%\Tencent\Logs\
echo 删除 QQ 运行产生的临时文件
rd /s /q %AppData%\Tencent\QQ\Temp\
echo 删除 QQ 安装文件包、QQ 升级补丁包
rd /s /q %AppData%\Tencent\QQ\AuTemp
echo 删除 QQ 一些聊天图片等文件
rd /s /q %userprofile%\Documents\Tencent Files

echo ==========清除垃圾完成==========