Write-Host "🚀 Instalador automático iniciado..." -ForegroundColor Cyan

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

# AnyDesk (descarga directa)
$anydeskUrl = "https://download.anydesk.com/AnyDesk.exe"
$anydeskPath = "$env:TEMP\AnyDesk.exe"
Write-Host "⬇️ Descargando AnyDesk desde su web..."
Invoke-WebRequest -Uri $anydeskUrl -OutFile $anydeskPath
Write-Host "💻 Ejecutando instalador de AnyDesk..."
Start-Process $anydeskPath -Wait

# Nitro PDF Pro (descarga directa)
$nitroUrl = "https://install.nitropdf.com/professional_14.36.1.0/en/nitro_pro14.exe"
$nitroPath = "$env:TEMP\nitro_pro14.exe"
Write-Host "⬇️ Descargando Nitro PDF Pro desde su web..."
Invoke-WebRequest -Uri $nitroUrl -OutFile $nitroPath
Write-Host "💻 Ejecutando instalador de Nitro PDF Pro..."
Start-Process $nitroPath -ArgumentList "/S" -Wait

Write-Host "`n✅ Todo instalado. Reiniciá si algo no funciona bien." -ForegroundColor Green
