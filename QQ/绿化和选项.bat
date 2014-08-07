@ECHO OFF&PUSHD %~DP0 &TITLE 绿化和选项
mode con cols=46 lines=27
color 2F
:Menu
Cls
@ echo.
@ echo.　　　　　　   菜 单 选 项
@ echo.     
@ echo.       绿化[必须] → 请输入1           
@ echo.     
@ echo.       创建桌面图标 → 请输入2
@ echo.      
@ echo.       删除桌面图标 → 请输入3         
@ echo.      
@ echo.       显示新手机图标[默认] → 请输入4  
@ echo.           
@ echo.       显示旧手机图标 → 请输入5      
@ echo.     
@ echo.       显示banner → 请输入6           
@ echo.      
@ echo.       不显示banner[默认] → 请输入7   
@ echo.      
@ echo.       设置完启动QQ → 请输入8         
@ echo.     
@ echo.       退出绿化 → 请输入9             
@ echo.   
@ echo.       卸载 → 请输入10                
@ echo.      
set /p xj= 输入数字按回车：
if /i "%xj%"=="1" Goto Install
if /i "%xj%"=="2" Goto Establish
if /i "%xj%"=="3" Goto Delete
if /i "%xj%"=="4" Goto New phone
if /i "%xj%"=="5" Goto Old phone
if /i "%xj%"=="6" Goto banner
if /i "%xj%"=="7" Goto nobanner
if /i "%xj%"=="8" Goto Sign out
if /i "%xj%"=="9" Goto exit
if /i "%xj%"=="10" Goto Uninstall
@ echo.
echo      选择无效，请重新输入
ping -n 2 127.1>nul 
goto menu
:Install
@ echo.
ECHO 　　　正在安装中..请稍等..
:: 安装前结束相关进程
taskkill /f /im TXP* >NUL 2>NUL
taskkill /f /im QQP* >NUL 2>NUL
taskkill /f /im QQC* >NUL 2>NUL
taskkill /f /im QQ*  >NUL 2>NUL
taskkill /f /im TXP* >NUL 2>NUL
taskkill /f /im tad* >NUL 2>NUL
:: 清理后台相关文件及注册残留
del/f/q "%tmp%\*.tvl">NUL 2>NUL
del/f/q "%tmp%\*.tsd">NUL 2>NUL
del/f/q "%tmp%\ts*.dat">NUL 2>NUL
del/f/q "%tmp%\QQSa*.exe">NUL 2>NUL
rd/s/q "%AppData%\Tencent\QQ"  2>NUL
rd/s/q "%AppData%\Tencent\Logs"2>NUL
rd/s/q "%AppData%\Tencent\Users"2>NUL
rd/s/q "%AppData%\Tencent\QTalk"2>NUL
rd/s/q "%APPDATA%\Tencent\QQDoctor"2>NUL
rd/s/q "%AppData%\Tencent\DeskUpdate"2>NUL
rd/s/q "%ProgramData%\Tencent\QQProtect"2>NUL
rd/s/q "%AppData%\Tencent\AndroidAssist"2>NUL
rd/s/q "%AppData%\Tencent\QQPhoneManager"2>NUL
rd/s/q "%AppData%\Tencent\QQPhoneAssistant"2>NUL
rd/s/q "%UserProfile%\Documents\Tencent"   2>NUL
rd/s/q "%UserProfile%\My Documents\Tencent"2>NUL
rd/s/q "%UserProFile%\AppData\LocalLow\QQMiniDL"2>NUL
rd/s/q "%AllUsersProfile%\Application Data\QQPet"2>NUL
rd/s/q "%UserProfile%\AppData\Local\Tencent\QQPet"2>NUL
rd/s/q "%USERPROFILE%\Local Settings\Tencent\QQPet"2>NUL
rd/s/q "%USERPROFILE%\Local Settings\QQKartLiveUpdate"2>NUL
rd/s/q "%UserProfile%\Documents\Tencent Files\QPlus"   2>NUL
rd/s/q "%UserProfile%\My Documents\Tencent Files\QPlus"2>NUL
rd/s/q "%AllUsersProfile%\Application Data\Tencent\QQProtect"2>NUL
reg delete HKLM\SYSTEM\CurrentControlSet\services\QQProtect /F>NUL 2>NUL
:: 注册下载助手登陆库控件（注：不传递到系统公用库并注册则打开它无法登陆)
if not exist "%Windir%\SysWOW64" "%CommonProgramFiles%\Tencent\TXSSO\Bin"2>NUL
if exist "%Windir%\SysWOW64" "%CommonProgramFiles(x86)%\Tencent\TXSSO\Bin"2>NUL
if not exist "%Windir%\SysWOW64" xcopy /i/y/e Bin\TXSSO\Bin "%CommonProgramFiles%\Tencent\TXSSO\Bin">NUL 2>NUL
if exist "%Windir%\SysWOW64" xcopy /i/y/e Bin\TXSSO\Bin "%CommonProgramFiles(x86)%\Tencent\TXSSO\Bin">NUL 2>NUL
if not exist "%Windir%\SysWOW64" regsvr32  /s  "%CommonProgramFiles%\Tencent\TXSSO\Bin\SSOLUIContro.dll"
if exist "%Windir%\SysWOW64" regsvr32  /s  "%CommonProgramFiles(x86)%\Tencent\TXSSO\Bin\SSOLUIContro.dll"
if not exist "%WinDir%\SysWOW64" reg add HKLM\Software\Tencent\TXSSO /v version /d "1.2.2.70" /F>NUL
if exist "%WinDir%\SysWOW64" reg add HKLM\Software\Wow6432Node\Tencent\TXSSO /v version /d "1.2.2.70" /F>NUL
:: 注册谷歌、火狐、Opera 快速登陆控件
regsvr32 /s Bin\TXSSO\npactivex.dll
:: 注册SSO核心库、IE及接口快速登陆控件
regsvr32 /s Bin\TXSSO\Bin\SSOCommon.dll
regsvr32 /s Bin\TXSSO\Bin\npSSOAxCtrlForPTLogin.dll
:: 注册中转站上传，群共享、微云上传控件
regsvr32 /s Plugin\Com.Tencent.NetDisk\Bin\QQDisk\Bin\TXFTNActiveX.dll
::注册QQ相关组件
if exist Bin\Timwp.dll regsvr32  /s Bin\Timwp.dll
if exist Bin\AppCom.dll regsvr32 /s Bin\AppCom.dll
if exist Bin\CPHelper.dll regsvr32 /s Bin\CPHelper.dll
if exist Bin\TXPFProxy.dll regsvr32 /s Bin\TXPFProxy.dll
if exist Bin\KernelUtil.dll regsvr32 /s Bin\KernelUtil.dll
if exist Bin\TXPlatform.exe Bin\TXPlatform.exe /RegServer
if exist Bin\QQExterna.exe Bin\QQExterna.exe /SetupRegister
:: 复制相关数据
xcopy /s/i/y Bin\TXSSO\QQApp "%AppData%\Tencent\QQ\QQApp">NUL 2>NUL
xcopy /s/i/y I18N\CSC "%AppData%\Tencent\QQ\Misc\CSC">NUL 2>NUL
xcopy /s/i/y I18N\ClientType "%AppData%\Tencent\QQ\Misc\ClientType">NUL 2>NUL
xcopy /s/i/y I18N\GroupAppIcon "%AppData%\Tencent\QQ\Misc\GroupAppIcon">NUL 2>NUL
:: 生成个人文件夹保存位置配置文件，让Win、Win8或更高版的系统能正常保存自定义路径！
if not exist "%Public%\Documents\Tencent\QQ" md "%Public%\Documents\Tencent\QQ"2>NUL
if not exist "%Public%\Documents\Tencent\QQ\UserDataInfo.ini" echo.>"%Public%\Documents\Tencent\QQ\UserDataInfo.ini"2>NUL
:: 占用后禁止生成
md  "%AppData%\Tencent\QQ\Misc\CSC\2052\7"2>NUL
md "%AppData%\Tencent\QQ\Misc\CSC\2052\9">NUL 2>NUL
md "%AppData%\Tencent\QQ\Misc\CSC\2052\13">NUL 2>NUL
echo.banner>"%AppData%\Tencent\QQ\Misc\CSC\2052\7\4" 2>NUL
echo.superQQ>"%AppData%\Tencent\QQ\Misc\com.tencent.wireless"  2>NUL
echo.NoTipLink> "%AppData%\Tencent\QQ\Misc\CSC\2052\9\18"2>NUL
echo.ClientType> "%AppData%\Tencent\QQ\Misc\CSC\2052\9\18"2>NUL
Attrib +r  "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4" >NUL 2>NUL
Attrib +r "%AppData%\Tencent\QQ\Misc\CSC\2052\13\7" >NUL 2>NUL
Attrib +r "%AppData%\Tencent\QQ\Misc\CSC\2052\9\18" >NUL 2>NUL
Attrib +r  "%AppData%\Tencent\QQ\Misc\com.tencent.wireless" >NUL 2>NUL
:: 设置安装版本号,企业网页会话需要
reg add HKLM\Software\Tencent\QQ2009 /v version /d "53.47.0.11902.0" /F>NUL
if exist "%WinDir%\SysWOW64" reg add HKLM\Software\Wow6432Node\TENCENT\QQ2009 /v version /d "53.47.0.11902.0" /F>NUL
:: 设置安装路劲,安装视频留言和影音播放组件需要
reg add HKLM\Software\Tencent\QQ2009 /v Install /d "%~dp0\" /F>NUL
if exist "%WinDir%\SysWOW64" reg add HKLM\Software\Tencent\QQ2009 /v Install /d "%~dp0\" /F>NUL
goto Install2
:Establish
:: 创建桌面图标
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\腾讯QQ.lnk""):b.TargetPath=""%~dp0Bin\QQ.exe"":b.WorkingDirectory=""%~dp0Bin"":b.Save:close")
goto fanhui
:Delete
:: 删除桌面图标
del /q "%userprofile%\桌面\腾讯QQ.lnk" >NUL 2>NUL
del /q "%userprofile%\Desktop\腾讯QQ.lnk" >NUL 2>NUL
goto fanhui
:New phone
:: 显示新手机图标
xcopy /i/y I18N\9\18 "Misc\CSC\2052\9">NUL 2>NUL
goto fanhui
:Old phone
:: 显示旧手机图标
xcopy /i/y I18N\18 "Misc\CSC\2052\9">NUL 2>NUL
goto fanhui
:banner
:: 显示banner
del s/q/f  "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4" >NUL 2>NUL
goto fanhui
:nobanner
:: 不显示banner
echo.banner>"%AppData%\Tencent\QQ\Misc\CSC\2052\7\4" 2>NUL
ping -n 2 10>nul
Attrib +r  "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4" >NUL 2>NUL
goto fanhui
:Sign out
@ echo.
echo 　　　设置完成..正在启动QQ..
start bin\QQ.exe
goto fanhui
:exit
&exit
:Uninstall
@ echo.
echo 　　　正在卸载中..请稍等..
:: 卸载前结束相关进程
taskkill /f /im QQ*  >NUL 2>NUL
taskkill /f /im TXP* >NUL 2>NUL
::清理相关数据
rd/s/q "%ProgramData%\QQPet"2>NUL
rd/s/q "%AppData%\Tencent\QQ"2>NUL
rd/s/q "%AppData%\Tencent\TXSSO"2>NUL
rd/s/q "%AppData%\Tencent\STemp"2>NUL
rd/s/q "%AppData%\Tencent\Users"2>NUL
rd/s/q "%AppData%\Tencent\QTalk"2>NUL
rd/s/q "%AppData%\QQAppAssistant"2>NUL
rd/s/q "%AppData%\Tencent\QQMiniDL"2>NUL
rd/s/q "%AppData%\Tencent\DeskUpdate"2>NUL
rd/s/q "%AppData%\Tencent\QzoneMusic"2>NUL
rd/s/q "%AppData%\Tencent\AndroidAssist"2>NUL
rd/s/q "%AppData%\Tencent\QQPhoneManager"2>NUL
rd/s/q "%ProgramData%\Tencent\QQProtect" 2>NUL
rd/s/q "%UserProFile%\AppData\LocalLow\QQMiniDL"2>NUL
rd/s/q "%UserProfile%\AppData\Local\Tencent\Misc"2>NUL
rd/s/q "%AllUsersProfile%\Application Data\QQPet"2>NUL
rd/s/q "%UserProfile%\AppData\Local\Tencent\QQPet"2>NUL
rd/s/q "%USERPROFILE%\Local Settings\Tencent\QQPet"2>NUL
rd/s/q "%USERPROFILE%\Local Settings\QQKartLiveUpdate"2>NUL
rd/s/q "%AllUsersProfile%\Application Data\Tencent\QQProtect"2>NUL
::卸载所有控件
regsvr32 /s /u Bin\TXSSO\Bin\SSOCommon.dll
regsvr32 /s /u Bin\TXSSO\Bin\npactivex.dll
regsvr32 /s /u Bin\TXSSO\TXFTN\TXFTNActiveX1.17.dll
regsvr32 /s /u Bin\TXSSO\Bin\npSSOAxCtrlForPTLogin.dll
if exist Bin\Timwp.dll regsvr32 /s /u Bin\Timwp.dll
if exist Bin\AppCom.dll regsvr32 /s /u Bin\AppCom.dll
if exist Bin\CPHelper.dll regsvr32 /s /u Bin\CPHelper.dll
if exist Bin\TXPFProxy.dll regsvr32 /s /u Bin\TXPFProxy.dll
if exist Bin\KernelUtil.dll regsvr32 /s /u Bin\KernelUtil.dll
if exist Bin\TXPlatform.exe Bin\TXPlatform.exe /UnregServer
regsvr32 /s /u Plugin\Com.Tencent.NetDisk\Bin\QQDisk\Bin\TXFTNActiveX.dll
if not exist "%Windir%\SysWOW64" regsvr32 /s /u "%CommonProgramFiles%\Tencent\TXSSO\Bin\SSOLUIControl.dll"
if exist "%Windir%\SysWOW64" regsvr32 /s /u "%CommonProgramFiles(x86)%\Tencent\TXSSO\Bin\SSOLUIControl.dll"
::删除注册表键值
reg delete HKLM\Software\Classes\QQPet /F>NUL 2>NUL
reg delete HKCU\Software\Tencent\Plugin /F  >NUL 2>NUL
reg delete HKCU\Software\Tencent\QQ2009 /F  >NUL 2>NUL
reg delete HKLM\Software\Tencent\QQ2009 /F  >NUL 2>NUL
reg delete HKCU\Software\Classes\Tencent /F >NUL 2>NUL
reg delete HKLM\Software\Classes\Tencent /F >NUL 2>NUL
reg delete HKCU\Software\Tencent\QQProtect /F>NUL 2>NUL
reg delete HKCU\Software\Classes\EMOTION.File /F    >NUL 2>NUL
reg delete HKCU\Software\Classes\EMOTION.Package /F >NUL 2>NUL
reg delete HKCU\Software\Tencent\AndroidAssistant /F>NUL 2>NUL
reg delete HKLM\SOFTWARE\Wow6432Node\Classes\QQPet /F>NUL 2>NUL
reg delete HKLM\Software\Wow6432Node\Tencent\QQ2009 /F>NUL 2>NUL
reg delete HKLM\Software\Wow6432Node\Classes\Tencent /F>NUL 2>NUL
reg delete HKLM\SYSTEM\CurrentControlSet\services\QQProtect /F>NUL 2>NUL
goto Uninstall2
:fanhui
@ ECHO.
ECHO 　　　设置完成..
ping -n 2 10>nul
goto menu
:Install2
@ ECHO.
ECHO 　　　安装完成..
ping -n 2 10>nul
goto menu
:Uninstall2
@ ECHO.
ECHO 　　　卸载完成..
ping -n 2 10>nul
goto menu
