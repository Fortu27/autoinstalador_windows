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

# Adobe Reader
Instalar-App "Adobe Acrobat Reader" "Adobe.Acrobat.Reader.64-bit"

# VLC Media Player
Instalar-App "VLC Media Player" "VideoLAN.VLC"

# Nitro PDF Pro
Instalar-App "Nitro PDF Pro" "NitroSoftware.NitroPro"


# FortiClient VPN (de Fortinet)
Instalar-App "FortiClient VPN" "Fortinet.FortiClientVPN"

# AnyDesk (por descarga directa, ya que winget no lo encuentra)
$anydeskUrl = "https://download.anydesk.com/AnyDesk.exe"
$anydeskPath = "$env:TEMP\AnyDesk.exe"

Write-Host "⬇️ Descargando AnyDesk desde su web..."
Invoke-WebRequest -Uri $anydeskUrl -OutFile $anydeskPath

Write-Host "💻 Ejecutando instalador de AnyDesk..."
Start-Process $anydeskPath -Wait

Write-Host "`n✅ Todo instalado. Reiniciá si algo no funciona bien." -ForegroundColor Green

