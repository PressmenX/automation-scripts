@echo off
echo Menyalakan WSL...
wsl -l -v

echo Menyalakan Docker Desktop...
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"

echo Menunggu Docker Desktop siap...
timeout /t 5 /nobreak >nul

echo Selesai! WSL dan Docker Desktop sudah dinyalakan.
echo.
tasklist | findstr /i "vmmem docker"
echo.
timeout /t 3 /nobreak >nul
exit