# Instalador automático de aplicaciones 

# Lista de apps a instalar con Winget
$apps = @(
    @{ nombre = "Google Chrome"; id = "Google.Chrome" },
    @{ nombre = "WinRAR"; id = "RARLab.WinRAR" },
    @{ nombre = "Adobe Acrobat Reader"; id = "Adobe.Acrobat.Reader.64-bit" },
    @{ nombre = "AnyDesk"; id = "AnyDeskSoftwareGmbH.AnyDesk" },
    @{ nombre = "VLC Media Player"; id = "VideoLAN.VLC" },
    @{ nombre = "Microsoft Teams"; id = "Microsoft.Teams" },
    @{ nombre = "FortiClient VPN"; id = "Fortinet.FortiClientVPN" }
)

# Función para instalar con winget
function Instalar-AppWinget($nombre, $id) {
    Write-Host "⬇️ Instalando $nombre..."
    $resultado = winget install --id $id -e --silent --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ $nombre instalado correctamente.`n"
    } else {
        Write-Host "❌ Error al instalar $nombre.`n"
    }
}

# Instalación de cada app con Winget
foreach ($app in $apps) {
    Instalar-AppWinget -nombre $app.nombre -id $app.id
}

# 🔐 Mostrar clave de activación de Nitro Pro (manual)
$activarNitroUrl = "https://github.com/Fortu27/autoinstalador_windows/releases/download/v1.0.0/Nitro.Pro.10.5.7.32.-.x64.exe"  # <-- Pegá acá tu link real al .txt
$clavePath = "$env:TEMP\nitro_key.txt"

try {
    Write-Host "`n📥 Descargando clave de activación de Nitro Pro..."
    Invoke-WebRequest -Uri $activarNitroUrl -OutFile $clavePath

    $clave = Get-Content $clavePath
    Write-Host "`n📝 Clave de activación descargada:"
    Write-Host "---------------------------------"
    Write-Host $clave -ForegroundColor Yellow
    Write-Host "---------------------------------"
    Write-Host "⚠️ Ingresala manualmente en Nitro Pro."
    
    Remove-Item $clavePath -Force
} catch {
    Write-Host "❌ No se pudo descargar la clave. Verificá el link o los permisos."
}


Write-Host "`n🎉 Instalación completa. Listo para usar la PC como un campeón."

