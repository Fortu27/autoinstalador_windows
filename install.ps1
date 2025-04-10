# Ejecuta este script con permisos de administrador

# Forzamos política de ejecución para el proceso
Set-ExecutionPolicy Bypass -Scope Process -Force

function Instalar-App {
    param (
        [string]$nombre,
        [string]$comando
    )

    try {
        Write-Host "⬇ Instalando $nombre..." -ForegroundColor Cyan
        Invoke-Expression $comando
        Write-Host "✅ $nombre instalado correctamente." -ForegroundColor Green
    }
    catch {
        Write-Host "❌ Error al instalar ${nombre}: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Chrome
Instalar-App "Google Chrome" 'winget install --id=Google.Chrome -e --accept-package-agreements --accept-source-agreements'

# WinRAR
Instalar-App "WinRAR" 'winget install --id=RARLab.WinRAR -e --accept-package-agreements --accept-source-agreements'

# VLC
Instalar-App "VLC Media Player" 'winget install --id=VideoLAN.VLC -e --accept-package-agreements --accept-source-agreements'

# Adobe Reader
Instalar-App "Adobe Reader" 'winget install --id=Adobe.Acrobat.Reader.64-bit -e --accept-package-agreements --accept-source-agreements'

# AnyDesk
Instalar-App "AnyDesk" 'winget install --id=AnyDeskSoftwareGmbH.AnyDesk -e --accept-package-agreements --accept-source-agreements'

# FortiClient VPN
Instalar-App "FortiClient VPN" 'winget install --id=Fortinet.FortiClientVPN -e --accept-package-agreements --accept-source-agreements'

# Nitro Pro desde GitHub
$nitroUrl = "https://github.com/Fortu27/autoinstalador_windows/releases/download/v1.0.0/Nitro.Pro.10.5.7.32.-.x64.exe"
$nitroPath = "$env:TEMP\NitroProInstaller.exe"

try {
    Write-Host "⬇ Descargando Nitro Pro..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri $nitroUrl -OutFile $nitroPath
    Write-Host "📦 Ejecutando instalador de Nitro Pro..." -ForegroundColor Yellow
    Start-Process $nitroPath -ArgumentList "/S" -Wait
    Write-Host "✅ Nitro Pro instalado correctamente." -ForegroundColor Green
}
catch {
    Write-Host "❌ Error al instalar Nitro Pro: $($_.Exception.Message)" -ForegroundColor Red
}
