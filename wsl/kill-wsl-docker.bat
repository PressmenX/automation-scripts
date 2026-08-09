@echo off
tasklist | findstr /i "vmmem" >nul
if %errorlevel% neq 0 (
    echo WSL sudah dalam kondisi mati/stopped. Tidak ada yang perlu dilakukan.
    timeout /t 3 /nobreak >nul
    exit
)

echo WSL terdeteksi masih aktif, memulai proses shutdown...
echo Menutup VS Code...
taskkill /f /im code.exe >nul 2>&1

echo Menutup Docker Desktop...
taskkill /f /im "Docker Desktop.exe" /t >nul 2>&1
taskkill /f /im "com.docker.backend.exe" /t >nul 2>&1
taskkill /f /im "com.docker.build.exe" /t >nul 2>&1
taskkill /f /im "docker-sandbox.exe" /t >nul 2>&1

echo Menunggu proses benar-benar berhenti...
timeout /t 3 /nobreak >nul

echo Mematikan WSL...
wsl --shutdown
wsl -l -v

echo Selesai! RAM sudah dibersihkan.
echo.
tasklist | findstr /i "vmmem docker code"
echo.
timeout /t 3 /nobreak >nul
exit