@ECHO OFF&PUSHD %~DP0 &TITLE �̻�
:: ��װǰ������ؽ��̱����岻�ɾ�
taskkill /f /im TXP* >NUL 2>NUL
taskkill /f /im QQP* >NUL 2>NUL
taskkill /f /im QQC* >NUL 2>NUL
taskkill /f /im QQ.exe >NUL 2>NUL
:: ��ʼ�������̨һЩ��ز����ļ�
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
:: ע��ȸ衢�����Opera ���ٵ�½�ؼ�
regsvr32 /s Bin\TXSSO\Npchrome\npactivex.dll
:: ע��SSO���Ŀ⡢IE���ӿڿ��ٵ�½�ؼ�
regsvr32 /s Bin\TXSSO\Bin\SSOCommon.dll
regsvr32 /s Bin\TXSSO\Bin\npSSOAxCtrlForPTLogin.dll
:: ע����תվ�ϴ���Ⱥ����΢���ϴ��ؼ�
regsvr32 /s Plugin\Com.Tencent.NetDisk\Bin\QQDisk\Bin\TXFTNActiveX.dll
:: ע���������ֵ�½��ؼ���ע�������ݵ�ϵͳ���ÿⲢע��������޷���½)
:: ����������Ƶ���ؿ������ע�������ݵ�ϵͳ���ÿ�ᵼ���޷�������Դ��װ)
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
:: ���ú�̨�ն��豸��ͼ��ͷ�ֹȺͼ�긴��ռλ�ļ�
md "%AppData%\Tencent\QQ\Misc\CSC\2052\7">NUL 2>NUL
md "%AppData%\Tencent\QQ\Misc\CSC\2052\9">NUL 2>NUL
echo.NoLogoBanner>"%AppData%\Tencent\QQ\Misc\LogoFile"2>NUL
echo.NoLogoBanner> "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4"2>NUL
echo.NoGroupAppIco>"%AppData%\Tencent\QQ\Misc\CSC\2052\7\5"2>NUL
echo.ClientType> "%AppData%\Tencent\QQ\Misc\CSC\2052\9\18" 2>NUL
Attrib  +r "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4"  >NUL 2>NUL
attrib  +r "%AppData%\Tencent\QQ\Misc\CSC\2052\7\5"  >NUL 2>NUL
attrib  +r "%AppData%\Tencent\QQ\Misc\CSC\2052\9\18" >NUL 2>NUL
:: ����QQ��ǩ����,�����͵���̨λ�������ͼ���޷�����
:: xcopy /s/i/y Bin\TXSSO\QQApp "%AppData%\Tencent\QQ\QQApp">NUL 2>NUL
:: ���ð�װ·��,��װ��Ƶ���Ժ�Ӱ�����ŵ����������Ҫ
if not exist "%WinDir%\SysWOW64" reg add HKLM\Software\Tencent\QQ2009 /v Install /d "%~dp0\" /F>NUL
if exist "%WinDir%\SysWOW64" reg add HKLM\Software\Wow6432Node\Tencent\QQ2009 /v Install /d "%~dp0\" /F>NUL
:: ������װ�汾��,��ҵ������ҳ�Ự��Ҫ,CRM����豣��
if not exist "%WinDir%\SysWOW64" reg add HKLM\Software\Tencent\QQ2009 /v version /d "53.47.0.11879.0" /F>NUL
if exist "%WinDir%\SysWOW64" reg add HKLM\Software\Wow6432Node\Tencent\QQ2009 /v version /d "53.47.0.11879.0" /F>NUL
:: ���ɸ����ļ��б���λ�������ļ�����Win��Win8����߰��ϵͳ�����������Զ���·����
if not exist "%Public%\Documents\Tencent\QQ" md "%Public%\Documents\Tencent\QQ"2>NUL
if not exist "%Public%\Documents\Tencent\QQ\UserDataInfo.ini" echo.>"%Public%\Documents\Tencent\QQ\UserDataInfo.ini"2>NUL
:Menu
echo a.��������QQ 
echo 1.��ʾ��¼���Banner[��ѡ]   
echo 2.���ε�¼���Banner[Ĭ��] 
echo 3.��ʾ���ƶ��豸�ն�ͼ��[��ѡ]
echo 4.��ʾ���ƶ��豸�ն�ͼ��[Ĭ��]
echo 5.�����������Q������������ҳ��ʱ�Ự[��ѡ]
echo 6.���ñ������Q������������ҳ��ʱ�Ự[Ĭ��] 
echo.&echo.
set /p a=�������ֻس���
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
SET E=���!&GOTO MSGBOX
:DelBanner
md "%AppData%\Tencent\QQ\Misc\CSC\2052\7" >NUL 2>NUL
echo.NoLogoBanner>"%AppData%\Tencent\QQ\Misc\LogoFile"2>NUL
echo.NoLogoBanner> "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4"2>NUL
Attrib  +r "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4"  >NUL 2>NUL
SET E=���!&GOTO MSGBOX
:NewClientType
rd/s/q "%AppData%\Tencent\QQ\Misc\ClientType"2>NUL
del/f "%AppData%\Tencent\QQ\Misc\CSC\2052\9\18">NUL 2>NUL
SET E=���!&GOTO MSGBOX
:OldClientType
rd/s/q "%AppData%\Tencent\QQ\Misc\ClientType"2>NUL
md "%AppData%\Tencent\QQ\Misc\CSC\2052\9" >NUL 2>NUL
echo.OldClientType>"%AppData%\Tencent\QQ\Misc\CSC\2052\9\18"2>NUL
attrib +r "%AppData%\Tencent\QQ\Misc\CSC\2052\9\18">NUL 2>NUL
SET E=���!&GOTO MSGBOX
:AssocProtocol
if exist Bin\Timwp.dll regsvr32  /s Bin\Timwp.dll
if exist Bin\AppCom.dll regsvr32 /s Bin\AppCom.dll
if exist Bin\TXPFProxy.dll regsvr32 /s Bin\TXPFProxy.dll
if exist Bin\KernelUtil.dll regsvr32 /s Bin\KernelUtil.dll
if exist Bin\QQExternal.exe Bin\QQExternal.exe /SetupRegister
if exist Bin\TXPlatform.bak ren Bin\TXPlatform.bak TXPlatform.exe >NUL 2>NUL
if exist Bin\TXPlatform.exe Bin\TXPlatform.exe /RegServer
SET E=���!&GOTO MSGBOX
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
SET E=���!&GOTO MSGBOX
:DesktopLnk
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\QQ5.5.lnk""):b.TargetPath=""%~dp0Bin\QQ.exe"":b.WorkingDirectory=""%~dp0Bin"":b.Save:close")&SET E=���!&GOTO MSGBOX
:MsgBox
if "%1"=="" mshta VBScript:MsgBox("%e%",vbSystemModal,"")(close)& Cls&Goto Menu