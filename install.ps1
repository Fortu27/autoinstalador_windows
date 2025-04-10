# Ejecutá este script como Administrador

# Permitir ejecución solo en esta sesión
Set-ExecutionPolicy Bypass -Scope Process -Force

function Instalar-App {
    param (
        [string]$nombre,
        [string]$comando
    )

    Write-Host "⬇ Instalando $nombre..." -ForegroundColor Cyan
    try {
        Invoke-Expression $comando
        Write-Host ("✅ " + $nombre + " instalado correctamente.") -ForegroundColor Green
    }
    catch {
        $msg = $_.Exception.Message
        Write-Host ("❌ Error al instalar " + $nombre + ": " + $msg) -ForegroundColor Red
    }
}

# 1) Google Chrome
Instalar-App "Google Chrome" 'winget install --id=Google.Chrome -e --accept-package-agreements --accept-source-agreements'

# 2) WinRAR
Instalar-App "WinRAR" 'winget install --id=RARLab.WinRAR -e --accept-package-agreements --accept-source-agreements'

# 3) VLC Media Player
Instalar-App "VLC Media Player" 'winget install --id=VideoLAN.VLC -e --accept-package-agreements --accept-source-agreements'

# 4) Adobe Reader
Instalar-App "Adobe Reader" 'winget install --id=Adobe.Acrobat.Reader.64-bit -e --accept-package-agreements --accept-source-agreements'

# 5) AnyDesk (descarga directa)
Write-Host "⬇ Descargando AnyDesk..." -ForegroundColor Cyan
try {
    $anydeskUrl = "https://download.anydesk.com/AnyDesk.exe"
    $anydeskPath = "$env:TEMP\AnyDesk.exe"
    Invoke-WebRequest -Uri $anydeskUrl -OutFile $anydeskPath
    Start-Process $anydeskPath -ArgumentList "/silent" -Wait
    Write-Host "✅ AnyDesk instalado correctamente." -ForegroundColor Green
}
catch {
    $msg = $_.Exception.Message
    Write-Host ("❌ Error al instalar AnyDesk: " + $msg) -ForegroundColor Red
}

# 6) FortiClient VPN
Instalar-App "FortiClient VPN" 'winget install --id=Fortinet.FortiClientVPN -e --accept-package-agreements --accept-source-agreements'

# 7) Microsoft Teams
Instalar-App "Microsoft Teams" 'winget install --id=Microsoft.Teams -e --accept-package-agreements --accept-source-agreements'

# 8) Nitro Pro desde GitHub
Write-Host "`n⬇ Descargando Nitro Pro..." -ForegroundColor Cyan
try {
    $nitroUrl = "https://github.com/Fortu27/autoinstalador_windows/releases/download/v1.0.0/Nitro.Pro.10.5.7.32.-.x64.exe"
    $nitroPath = "$env:TEMP\NitroProInstaller.exe"
    Invoke-WebRequest -Uri $nitroUrl -OutFile $nitroPath
    Write-Host "📦 Ejecutando instalador de Nitro Pro..." -ForegroundColor Yellow
    Start-Process $nitroPath -ArgumentList "/quiet" -Wait
    Write-Host "✅ Nitro Pro instalado correctamente." -ForegroundColor Green
}
catch {
    $msg = $_.Exception.Message
    Write-Host ("❌ Error al instalar Nitro Pro: " + $msg) -ForegroundColor Red
}

Write-Host "`n🎉 ¡Todas las instalaciones han finalizado!" -ForegroundColor Magenta
