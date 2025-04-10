# Permitir scripts sin restricciones solo para esta sesión
Set-ExecutionPolicy Bypass -Scope Process -Force

# Lista de apps a instalar con winget
$apps = @(
    @{ id = "RARLab.WinRAR"; nombre = "WinRAR" },
    @{ id = "Google.Chrome"; nombre = "Google Chrome" },
    @{ id = "Adobe.Acrobat.Reader.64-bit"; nombre = "Adobe Reader" },
    @{ id = "VideoLAN.VLC"; nombre = "VLC Media Player" },
    @{ id = "AnyDeskSoftwareGmbH.AnyDesk"; nombre = "AnyDesk" },
    @{ id = "Fortinet.FortiClientVPN"; nombre = "FortiClient VPN" },
    @{ id = "Microsoft.Teams"; nombre = "Microsoft Teams" }
)

# Función para instalar con progreso
function Instalar-App {
    param (
        [string]$id,
        [string]$nombre
    )

    Write-Host "📦 Instalando $nombre..." -ForegroundColor Cyan
    try {
        winget install --id "$id" --silent --accept-package-agreements --accept-source-agreements -h -e
        Write-Host "✅ $nombre instalado correctamente." -ForegroundColor Green
    }
    catch {
        Write-Host "❌ Error al instalar ${nombre}: $_" -ForegroundColor Red
    }
}

# Instalar todas las apps
foreach ($app in $apps) {
    Instalar-App -id $app.id -nombre $app.nombre
}

# 🔽 INSTALACIÓN NITRO DESDE GITHUB RELEASE
$nitroUrl = "https://github.com/Fortu27/autoinstalador_windows/releases/download/v1.0.0/Nitro.Pro.10.5.7.32.-.x64.exe"
$nitroPath = "$env:TEMP\nitro_installer.exe"

Write-Host "`n📥 Descargando Nitro Pro desde $nitroUrl..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri $nitroUrl -OutFile $nitroPath
    Write-Host "🚀 Ejecutando instalador de Nitro Pro..." -ForegroundColor Yellow
    Start-Process $nitroPath -ArgumentList "/quiet" -Wait
    Write-Host "✅ Nitro Pro instalado correctamente." -ForegroundColor Green
}
catch {
    Write-Host "❌ Error al instalar Nitro Pro: $_" -ForegroundColor Red
}

