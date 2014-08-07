@ECHO OFF&PUSHD %~DP0 &TITLE 绿化
:: 安装前结束相关进程避免清不干净
taskkill /f /im TXP* >NUL 2>NUL
taskkill /f /im QQP* >NUL 2>NUL
taskkill /f /im QQC* >NUL 2>NUL
taskkill /f /im QQ.exe >NUL 2>NUL
:: 开始清理掉后台一些相关残留文件
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
:: 注册谷歌、火狐、Opera 快速登陆控件
regsvr32 /s Bin\TXSSO\Npchrome\npactivex.dll
:: 注册SSO核心库、IE及接口快速登陆控件
regsvr32 /s Bin\TXSSO\Bin\SSOCommon.dll
regsvr32 /s Bin\TXSSO\Bin\npSSOAxCtrlForPTLogin.dll
:: 注册中转站上传，群共享、微云上传控件
regsvr32 /s Plugin\Com.Tencent.NetDisk\Bin\QQDisk\Bin\TXFTNActiveX.dll
:: 注册下载助手登陆库控件（注：不传递到系统公用库并注册则打开它无法登陆)
:: 放置齐齐视频下载库组件（注：不传递到系统公用库会导致无法加载资源安装)
:: if not exist "%Windir%\SysWOW64" md "%CommonProgramFiles%\Tencent\TXSSO\Bin"2>NUL
:: if exist "%Windir%\SysWOW64" md "%CommonProgramFiles(x86)%\Tencent\TXSSO\Bin"2>NUL
:: if not exist "%Windir%\SysWOW64" md "%CommonProgramFiles%\Tencent\QQDownload"2>NUL
:: if exist "%Windir%\SysWOW64" md "%CommonProgramFiles(x86)%\Tencent\QQDownload"2>NUL
:: if not exist "%Windir%\SysWOW64" xcopy /i/y/e Bin\TXSSO\Bin "%CommonProgramFiles%\Tencent\TXSSO\Bin">NUL 2>NUL
:: if exist "%Windir%\SysWOW64" xcopy /i/y/e Bin\TXSSO\Bin "%CommonProgramFiles(x86)%\Tencent\TXSSO\Bin">NUL 2>NUL
:: if not exist "%Windir%\SysWOW64" xcopy /i/y/e Bin\TXSSO\128 "%CommonProgramFiles%\Tencent\QQDownload\128">NUL 2>NUL
:: if exist "%Windir%\SysWOW64" xcopy /i/y/e Bin\TXSSO\128 "%CommonProgramFiles(x86)%\Tencent\QQDownload\128">NUL 2>NUL
:: if not exist "%Windir%\SysWOW64" regsvr32 /s "%CommonProgramFiles%\Tencent\TXSSO\Bin\SSOLUIControl.dll"
:: if exist "%Windir%\SysWOW64" regsvr32 /s "%CommonProgramFiles(x86)%\Tencent\TXSSO\Bin\SSOLUIControl.dll"
:: if not exist "%WinDir%\SysWOW64" reg add HKLM\Software\Tencent\TXSSO /v version /d "1.2.2.70" /F>NUL
:: if exist "%WinDir%\SysWOW64" reg add HKLM\Software\Wow6432Node\Tencent\TXSSO /v version /d "1.2.2.70" /F>NUL
:: 设置后台终端设备老图标和防止群图标复发占位文件
md "%AppData%\Tencent\QQ\Misc\CSC\2052\7">NUL 2>NUL
md "%AppData%\Tencent\QQ\Misc\CSC\2052\9">NUL 2>NUL
echo.NoLogoBanner>"%AppData%\Tencent\QQ\Misc\LogoFile"2>NUL
echo.NoLogoBanner> "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4"2>NUL
echo.NoGroupAppIco>"%AppData%\Tencent\QQ\Misc\CSC\2052\7\5"2>NUL
echo.ClientType> "%AppData%\Tencent\QQ\Misc\CSC\2052\9\18" 2>NUL
Attrib  +r "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4"  >NUL 2>NUL
attrib  +r "%AppData%\Tencent\QQ\Misc\CSC\2052\7\5"  >NUL 2>NUL
attrib  +r "%AppData%\Tencent\QQ\Misc\CSC\2052\9\18" >NUL 2>NUL
:: 传送QQ便签引导,不传送到后台位置则面板图标无法启动
:: xcopy /s/i/y Bin\TXSSO\QQApp "%AppData%\Tencent\QQ\QQApp">NUL 2>NUL
:: 设置安装路劲,安装视频留言和影音播放等组件下载需要
if not exist "%WinDir%\SysWOW64" reg add HKLM\Software\Tencent\QQ2009 /v Install /d "%~dp0\" /F>NUL
if exist "%WinDir%\SysWOW64" reg add HKLM\Software\Wow6432Node\Tencent\QQ2009 /v Install /d "%~dp0\" /F>NUL
:: 创建安装版本号,企业类型网页会话需要,CRM组件需保留
if not exist "%WinDir%\SysWOW64" reg add HKLM\Software\Tencent\QQ2009 /v version /d "53.47.0.11879.0" /F>NUL
if exist "%WinDir%\SysWOW64" reg add HKLM\Software\Wow6432Node\Tencent\QQ2009 /v version /d "53.47.0.11879.0" /F>NUL
:: 生成个人文件夹保存位置配置文件，让Win、Win8或更高版的系统能正常保存自定义路径！
if not exist "%Public%\Documents\Tencent\QQ" md "%Public%\Documents\Tencent\QQ"2>NUL
if not exist "%Public%\Documents\Tencent\QQ\UserDataInfo.ini" echo.>"%Public%\Documents\Tencent\QQ\UserDataInfo.ini"2>NUL
:Menu
echo a.创建桌面QQ 
echo 1.显示登录面板Banner[自选]   
echo 2.屏蔽登录面板Banner[默认] 
echo 3.显示新移动设备终端图标[自选]
echo 4.显示老移动设备终端图标[默认]
echo 5.关联表情包、Q音乐收听、网页临时会话[自选]
echo 6.禁用表情包、Q音乐收听、网页临时会话[默认] 
echo.&echo.
set /p a=输入数字回车：
if "%a%"=="a" Goto DesktopLnk
if "%a%"=="1" Goto AddBanner
if "%a%"=="2" Goto DelBanner
if "%a%"=="3" Goto NewClientType
if "%a%"=="4" Goto OldClientType
if "%a%"=="5" Goto AssocProtocol
if "%a%"=="6" Goto CancelProtocol
:AddBanner
del/f "%AppData%\Tencent\QQ\Misc\LogoFile">NUL 2>NUL
del/f "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4">NUL 2>NUL
SET E=完成!&GOTO MSGBOX
:DelBanner
md "%AppData%\Tencent\QQ\Misc\CSC\2052\7" >NUL 2>NUL
echo.NoLogoBanner>"%AppData%\Tencent\QQ\Misc\LogoFile"2>NUL
echo.NoLogoBanner> "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4"2>NUL
Attrib  +r "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4"  >NUL 2>NUL
SET E=完成!&GOTO MSGBOX
:NewClientType
rd/s/q "%AppData%\Tencent\QQ\Misc\ClientType"2>NUL
del/f "%AppData%\Tencent\QQ\Misc\CSC\2052\9\18">NUL 2>NUL
SET E=完成!&GOTO MSGBOX
:OldClientType
rd/s/q "%AppData%\Tencent\QQ\Misc\ClientType"2>NUL
md "%AppData%\Tencent\QQ\Misc\CSC\2052\9" >NUL 2>NUL
echo.OldClientType>"%AppData%\Tencent\QQ\Misc\CSC\2052\9\18"2>NUL
attrib +r "%AppData%\Tencent\QQ\Misc\CSC\2052\9\18">NUL 2>NUL
SET E=完成!&GOTO MSGBOX
:AssocProtocol
if exist Bin\Timwp.dll regsvr32  /s Bin\Timwp.dll
if exist Bin\AppCom.dll regsvr32 /s Bin\AppCom.dll
if exist Bin\TXPFProxy.dll regsvr32 /s Bin\TXPFProxy.dll
if exist Bin\KernelUtil.dll regsvr32 /s Bin\KernelUtil.dll
if exist Bin\QQExternal.exe Bin\QQExternal.exe /SetupRegister
if exist Bin\TXPlatform.bak ren Bin\TXPlatform.bak TXPlatform.exe >NUL 2>NUL
if exist Bin\TXPlatform.exe Bin\TXPlatform.exe /RegServer
SET E=完成!&GOTO MSGBOX
:CancelProtocol
reg delete HKCU\Software\Classes\Tencent /F>NUL 2>NUL
reg delete HKLM\Software\Classes\Tencent /F>NUL 2>NUL
if exist Bin\Timwp.dll regsvr32 /s /u Bin\Timwp.dll
if exist Bin\AppCom.dll regsvr32 /s /u Bin\AppCom.dll
if exist Bin\TXPFProxy.dll regsvr32 /s /u Bin\TXPFProxy.dll
if exist Bin\KernelUtil.dll regsvr32 /s /u Bin\KernelUtil.dll
if exist Bin\TXPlatform.exe Bin\TXPlatform.exe /UnregServer
reg delete HKLM\Software\Wow6432Node\Classes\Tencent /F>NUL 2>NUL
if exist Bin\TXPlatform.exe ren Bin\TXPlatform.exe TXPlatform.bak >NUL 2>NUL
SET E=完成!&GOTO MSGBOX
:DesktopLnk
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\QQ5.5.lnk""):b.TargetPath=""%~dp0Bin\QQ.exe"":b.WorkingDirectory=""%~dp0Bin"":b.Save:close")&SET E=完成!&GOTO MSGBOX
:MsgBox
if "%1"=="" mshta VBScript:MsgBox("%e%",vbSystemModal,"")(close)& Cls&Goto Menu