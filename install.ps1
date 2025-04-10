Set-ExecutionPolicy Bypass -Scope Process -Force

$apps = @(
    @{ id = "RARLab.WinRAR"; nombre = "WinRAR" },
    @{ id = "Google.Chrome"; nombre = "Google Chrome" },
    @{ id = "Adobe.Acrobat.Reader.64-bit"; nombre = "Adobe Reader" },
    @{ id = "VideoLAN.VLC"; nombre = "VLC Media Player" },
    @{ id = "Fortinet.FortiClientVPN"; nombre = "FortiClient VPN" },
    @{ id = "Microsoft.Teams"; nombre = "Microsoft Teams" }
)

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

foreach ($app in $apps) {
    Instalar-App -id $app.id -nombre $app.nombre
}

# 🔽 Instalar AnyDesk manualmente
$anydeskUrl = "https://download.anydesk.com/AnyDesk.exe"
$anydeskPath = "$env:TEMP\AnyDesk.exe"

Write-Host "`n📥 Descargando AnyDesk desde su sitio oficial..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri $anydeskUrl -OutFile $anydeskPath
    Write-Host "🚀 Ejecutando instalador de AnyDesk..." -ForegroundColor Yellow
    Start-Process $anydeskPath -ArgumentList "/silent" -Wait
    Write-Host "✅ AnyDesk instalado


