@ECHO OFF&PUSHD %~DP0 &TITLE �̻���ѡ��
mode con cols=46 lines=27
color 2F
:Menu
Cls
@ echo.
@ echo.������������   �� �� ѡ ��
@ echo.     
@ echo.       �̻�[����] �� ������1           
@ echo.     
@ echo.       ��������ͼ�� �� ������2
@ echo.      
@ echo.       ɾ������ͼ�� �� ������3         
@ echo.      
@ echo.       ��ʾ���ֻ�ͼ��[Ĭ��] �� ������4  
@ echo.           
@ echo.       ��ʾ���ֻ�ͼ�� �� ������5      
@ echo.     
@ echo.       ��ʾbanner �� ������6           
@ echo.      
@ echo.       ����ʾbanner[Ĭ��] �� ������7   
@ echo.      
@ echo.       ����������QQ �� ������8         
@ echo.     
@ echo.       �˳��̻� �� ������9             
@ echo.   
@ echo.       ж�� �� ������10                
@ echo.      
set /p xj= �������ְ��س���
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
echo      ѡ����Ч������������
ping -n 2 127.1>nul 
goto menu
:Install
@ echo.
ECHO ���������ڰ�װ��..���Ե�..
:: ��װǰ������ؽ���
taskkill /f /im TXP* >NUL 2>NUL
taskkill /f /im QQP* >NUL 2>NUL
taskkill /f /im QQC* >NUL 2>NUL
taskkill /f /im QQ*  >NUL 2>NUL
taskkill /f /im TXP* >NUL 2>NUL
taskkill /f /im tad* >NUL 2>NUL
:: �����̨����ļ���ע�����
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
:: ע���������ֵ�½��ؼ���ע�������ݵ�ϵͳ���ÿⲢע��������޷���½)
if not exist "%Windir%\SysWOW64" "%CommonProgramFiles%\Tencent\TXSSO\Bin"2>NUL
if exist "%Windir%\SysWOW64" "%CommonProgramFiles(x86)%\Tencent\TXSSO\Bin"2>NUL
if not exist "%Windir%\SysWOW64" xcopy /i/y/e Bin\TXSSO\Bin "%CommonProgramFiles%\Tencent\TXSSO\Bin">NUL 2>NUL
if exist "%Windir%\SysWOW64" xcopy /i/y/e Bin\TXSSO\Bin "%CommonProgramFiles(x86)%\Tencent\TXSSO\Bin">NUL 2>NUL
if not exist "%Windir%\SysWOW64" regsvr32  /s  "%CommonProgramFiles%\Tencent\TXSSO\Bin\SSOLUIContro.dll"
if exist "%Windir%\SysWOW64" regsvr32  /s  "%CommonProgramFiles(x86)%\Tencent\TXSSO\Bin\SSOLUIContro.dll"
if not exist "%WinDir%\SysWOW64" reg add HKLM\Software\Tencent\TXSSO /v version /d "1.2.2.70" /F>NUL
if exist "%WinDir%\SysWOW64" reg add HKLM\Software\Wow6432Node\Tencent\TXSSO /v version /d "1.2.2.70" /F>NUL
:: ע��ȸ衢�����Opera ���ٵ�½�ؼ�
regsvr32 /s Bin\TXSSO\npactivex.dll
:: ע��SSO���Ŀ⡢IE���ӿڿ��ٵ�½�ؼ�
regsvr32 /s Bin\TXSSO\Bin\SSOCommon.dll
regsvr32 /s Bin\TXSSO\Bin\npSSOAxCtrlForPTLogin.dll
:: ע����תվ�ϴ���Ⱥ����΢���ϴ��ؼ�
regsvr32 /s Plugin\Com.Tencent.NetDisk\Bin\QQDisk\Bin\TXFTNActiveX.dll
::ע��QQ������
if exist Bin\Timwp.dll regsvr32  /s Bin\Timwp.dll
if exist Bin\AppCom.dll regsvr32 /s Bin\AppCom.dll
if exist Bin\CPHelper.dll regsvr32 /s Bin\CPHelper.dll
if exist Bin\TXPFProxy.dll regsvr32 /s Bin\TXPFProxy.dll
if exist Bin\KernelUtil.dll regsvr32 /s Bin\KernelUtil.dll
if exist Bin\TXPlatform.exe Bin\TXPlatform.exe /RegServer
if exist Bin\QQExterna.exe Bin\QQExterna.exe /SetupRegister
:: �����������
xcopy /s/i/y Bin\TXSSO\QQApp "%AppData%\Tencent\QQ\QQApp">NUL 2>NUL
xcopy /s/i/y I18N\CSC "%AppData%\Tencent\QQ\Misc\CSC">NUL 2>NUL
xcopy /s/i/y I18N\ClientType "%AppData%\Tencent\QQ\Misc\ClientType">NUL 2>NUL
xcopy /s/i/y I18N\GroupAppIcon "%AppData%\Tencent\QQ\Misc\GroupAppIcon">NUL 2>NUL
:: ���ɸ����ļ��б���λ�������ļ�����Win��Win8����߰��ϵͳ�����������Զ���·����
if not exist "%Public%\Documents\Tencent\QQ" md "%Public%\Documents\Tencent\QQ"2>NUL
if not exist "%Public%\Documents\Tencent\QQ\UserDataInfo.ini" echo.>"%Public%\Documents\Tencent\QQ\UserDataInfo.ini"2>NUL
:: ռ�ú��ֹ����
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
:: ���ð�װ�汾��,��ҵ��ҳ�Ự��Ҫ
reg add HKLM\Software\Tencent\QQ2009 /v version /d "53.47.0.11902.0" /F>NUL
if exist "%WinDir%\SysWOW64" reg add HKLM\Software\Wow6432Node\TENCENT\QQ2009 /v version /d "53.47.0.11902.0" /F>NUL
:: ���ð�װ·��,��װ��Ƶ���Ժ�Ӱ�����������Ҫ
reg add HKLM\Software\Tencent\QQ2009 /v Install /d "%~dp0\" /F>NUL
if exist "%WinDir%\SysWOW64" reg add HKLM\Software\Tencent\QQ2009 /v Install /d "%~dp0\" /F>NUL
goto Install2
:Establish
:: ��������ͼ��
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\��ѶQQ.lnk""):b.TargetPath=""%~dp0Bin\QQ.exe"":b.WorkingDirectory=""%~dp0Bin"":b.Save:close")
goto fanhui
:Delete
:: ɾ������ͼ��
del /q "%userprofile%\����\��ѶQQ.lnk" >NUL 2>NUL
del /q "%userprofile%\Desktop\��ѶQQ.lnk" >NUL 2>NUL
goto fanhui
:New phone
:: ��ʾ���ֻ�ͼ��
xcopy /i/y I18N\9\18 "Misc\CSC\2052\9">NUL 2>NUL
goto fanhui
:Old phone
:: ��ʾ���ֻ�ͼ��
xcopy /i/y I18N\18 "Misc\CSC\2052\9">NUL 2>NUL
goto fanhui
:banner
:: ��ʾbanner
del s/q/f  "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4" >NUL 2>NUL
goto fanhui
:nobanner
:: ����ʾbanner
echo.banner>"%AppData%\Tencent\QQ\Misc\CSC\2052\7\4" 2>NUL
ping -n 2 10>nul
Attrib +r  "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4" >NUL 2>NUL
goto fanhui
:Sign out
@ echo.
echo �������������..��������QQ..
start bin\QQ.exe
goto fanhui
:exit
&exit
:Uninstall
@ echo.
echo ����������ж����..���Ե�..
:: ж��ǰ������ؽ���
taskkill /f /im QQ*  >NUL 2>NUL
taskkill /f /im TXP* >NUL 2>NUL
::�����������
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
::ж�����пؼ�
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
::ɾ��ע����ֵ
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
ECHO �������������..
ping -n 2 10>nul
goto menu
:Install2
@ ECHO.
ECHO ��������װ���..
ping -n 2 10>nul
goto menu
:Uninstall2
@ ECHO.
ECHO ������ж�����..
ping -n 2 10>nul
goto menu
