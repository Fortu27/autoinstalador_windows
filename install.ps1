Write-Host "🚀 Instalador automatico iniciado..." -ForegroundColor Cyan

function Instalar-App($nombre, $id) {
    Write-Host "🔧 Instalando $nombre..."
    try {
        winget install --id=$id -e --silent
    } catch {
        Write-Host "❌ Error instalando $nombre con winget. Verificar si el paquete existe." -ForegroundColor Red
    }
}

# WinRAR
Instalar-App "WinRAR" "RARLab.WinRAR"

# Google Chrome
Instalar-App "Google Chrome" "Google.Chrome"

# Adobe Acrobat Reader
Instalar-App "Adobe Acrobat Reader" "Adobe.Acrobat.Reader.64-bit"

# VLC Media Player
Instalar-App "VLC Media Player" "VideoLAN.VLC"

# FortiClient VPN
Instalar-App "FortiClient VPN" "Fortinet.FortiClientVPN"

# Microsoft Teams
Instalar-App "Microsoft Teams" "Microsoft.Teams"

# AnyDesk (descarga directa)
$anydeskUrl = "https://download.anydesk.com/AnyDesk.exe"
$anydeskPath = "$env:TEMP\AnyDesk.exe"
Write-Host "⬇️ Descargando AnyDesk desde su web..."
Invoke-WebRequest -Uri $anydeskUrl -OutFile $anydeskPath
Write-Host "💻 Ejecutando instalador de AnyDesk..."
Start-Process $anydeskPath -Wait


Write-Host "`n✅ Todo instalado. Reinicia si algo no funciona bien." -ForegroundColor Green
