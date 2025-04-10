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

Write-Host "🚀 Instalador automático iniciado..." -ForegroundColor Cyan

function Instalar-App($nombre, $id) {
    Write-Host "🔧 Instalando $nombre..."
    try {
        winget install --id=$id -e --silent
    } catch {
        Write-Host "❌ Error instalando $nombre con winget." -ForegroundColor Red
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

# AnyDesk (descarga directa)
$anydeskUrl = "https://download.anydesk.com/AnyDesk.exe"
$anydeskPath = "$env:TEMP\AnyDesk.exe"
Write-Host "⬇️ Descargando AnyDesk..."
Invoke-WebRequest -Uri $anydeskUrl -OutFile $anydeskPath
Write-Host "💻 Instalando AnyDesk..."
Start-Process $anydeskPath -Wait

# Microsoft Teams
Instalar-App "Microsoft Teams" "Microsoft.Teams"

# Nitro PDF Pro desde recurso compartido de red
$nitroPath = "\\10.0.1.19\Acceso_Publico\Software - Programas\Nitro Pro\Nitro Pro 10.5.7.32 - x64.exe"

if (Test-Path $nitroPath) {
    Write-Host "💻 Ejecutando Nitro Pro desde recurso de red..."
    Start-Process $nitroPath -ArgumentList "/S" -Wait
} else {
    Write-Host "❌ No se encontró Nitro Pro en la ruta de red: $nitroPath" -ForegroundColor Red
}

Write-Host "`n✅ Todo instalado. Reiniciá si algo no funciona bien." -ForegroundColor Green



Write-Host "`n✅ Todo instalado. Reinicia si algo no funciona bien." -ForegroundColor Green
