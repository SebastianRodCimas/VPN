start-process "cmd.exe" "C:\Users\Rodrigue CIMAS\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\wifi.bat"
set VPN=Work VPN
set USERNAME=USERNAME%
set PASSWORD=PASSWORD%

:loop
    cls
    echo Verification de la disponibilite de la connexion...
    ipconfig|find /i "%VPN%"
    if %errorlevel%==1 goto:reconnect
    timeout /t 30 /nobreak
    goto :loop

:reconnect
    echo Deconnexion...
    rasdial "%VPN%" /disconnect
    timeout /t 10 /nobreak
    echo Connexion...
    rasdial "%VPN%" "%USERNAME%" "%PASSWORD%"
    timeout /t 10 /nobreak
    goto :loop