# Script para instalar programas esenciales

# --- Función para instalar con winget ---
function Instalar-Con-Winget {
    param (
        [string]$nombre,
        [string]$id
    )

    Write-Host "`n📦 Instalando $nombre..." -ForegroundColor Cyan
    try {
        winget install --id=$id -e --silent --accept-source-agreements --accept-package-agreements
        Write-Host "✅ $nombre instalado correctamente." -ForegroundColor Green
    }
    catch {
        Write-Host "❌ Error al instalar $nombre: $_" -ForegroundColor Red
    }
}

# --- Aplicaciones a instalar por winget ---
$appList = @(
    @{nombre="Google Chrome"; id="Google.Chrome"},
    @{nombre="Adobe Acrobat Reader"; id="Adobe.Acrobat.Reader.64-bit"},
    @{nombre="VLC Media Player"; id="VideoLAN.VLC"},
    @{nombre="WinRAR"; id="RARLab.WinRAR"},
    @{nombre="FortiClient VPN"; id="Fortinet.FortiClientVPN"}
)

foreach ($app in $appList) {
    Instalar-Con-Winget -nombre $app.nombre -id $app.id
}

# --- Instalar AnyDesk manualmente ---
$anydeskUrl = "https://download.anydesk.com/AnyDesk.exe"
$anydeskPath = "$env:TEMP\AnyDesk.exe"

Write-Host "`n📥 Descargando AnyDesk..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri $anydeskUrl -OutFile $anydeskPath
    Start-Process $anydeskPath -ArgumentList "/silent" -Wait
    Write-Host "✅ AnyDesk instalado correctamente." -ForegroundColor Green
}
catch {
    Write-Host "❌ Error al instalar AnyDesk: $_" -ForegroundColor Red
}

# --- Instalar Nitro Pro desde GitHub ---
$nitroUrl = "https://github.com/Fortu27/autoinstalador_windows/releases/download/v1.0.0/Nitro.Pro.10.5.7.32.-.x64.exe"
$nitroPath = "$env:TEMP\nitro_installer.exe"

Write-Host "`n📥 Descargando Nitro Pro desde GitHub..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri $nitroUrl -OutFile $nitroPath
    Start-Process $nitroPath -ArgumentList "/quiet" -Wait
    Write-Host "✅ Nitro Pro instalado correctamente." -ForegroundColor Green
}
catch {
    Write-Host "❌ Error al instalar Nitro Pro: $_" -ForegroundColor Red
}

Write-Host "`n🎉 Instalación completada." -ForegroundColor Magenta
