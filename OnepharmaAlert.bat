@echo off
:start
cls
echo Checking for notifications from Onepharma...
echo --------------------
tasklist /v /fo:csv /nh | findstr /r /c:",[^,]*Notificatie[^,]*$" > nul 
if errorlevel 1 (
    echo NO notifications found.
    echo Waiting for next try...
    timeout /t 5 /nobreak
    goto start
) else (
    echo Notification^<s^> found.
    echo Activating Blink^<1^>
    goto blink
)
:blink
tasklist /v /fo:csv /nh | findstr /r /c:",[^,]*Notificatie[^,]*$" > nul 
if errorlevel 1 (
    goto start
) else (
    blink1-tool --rgb 0,255,0 --blink 2
    goto blink
)

pause