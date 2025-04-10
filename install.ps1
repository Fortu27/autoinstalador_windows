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

# 🔥 Instalación especial: Nitro Pro (fuera de winget)
$nitroUrl = "https://github.com/Fortu27/autoinstalador_windows/releases/download/v1.0.0/Nitro.Pro.10.5.7.32.-.x64.exe"
$nitroPath = "$env:TEMP\NitroProInstaller.exe"

Write-Host "📦 Descargando Nitro Pro desde GitHub..."
try {
    Invoke-WebRequest -Uri $nitroUrl -OutFile $nitroPath -UseBasicParsing
    Write-Host "📥 Instalando Nitro Pro..."
    Start-Process $nitroPath -ArgumentList "/quiet" -Wait
    Write-Host "✅ Nitro Pro instalado correctamente.`n"
} catch {
    Write-Host "❌ Error al instalar Nitro Pro: $($_.Exception.Message)`n"
}

# 🔒 Activación de Nitro Pro desde link privado
$activarNitroUrl = "https://datastarargentina-my.sharepoint.com/..."  # ← Pegá acá tu link real
$clavePath = "$env:TEMP\nitro_key.txt"

try {
    Write-Host "`n🔐 Descargando clave de activación de Nitro Pro..."
    Invoke-WebRequest -Uri $activarNitroUrl -OutFile $clavePath

    $clave = Get-Content $clavePath
    Write-Host "🔑 Activando Nitro Pro..."
    
    # Reemplazá esta línea con el comando real de activación
    & "C:\Program Files\Nitro\Pro 10\NitroPDF.exe" /SN:$clave

    Remove-Item $clavePath -Force
} catch {
    Write-Host "⚠️ No se pudo activar Nitro Pro automáticamente. Verificá el acceso al archivo de licencia."
}


Write-Host "`n🎉 Instalación completa. Listo para usar la PC como un campeón."

