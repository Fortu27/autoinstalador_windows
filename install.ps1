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

# 🔐 Mostrar link para clave de activación de Nitro Pro (requiere login)
$linkClave = "https://github.com/Fortu27/autoinstalador_windows/releases/download/v1.0.0/Nitro.Pro.10.5.7.32.-.x64.exe" 

Write-Host "`n🔐 Para activar Nitro Pro, accedé al siguiente link con tu cuenta corporativa:"
Write-Host $linkClave -ForegroundColor Cyan
Write-Host "⚠️ Una vez dentro, copiá la clave y activá Nitro manualmente desde el programa."


Write-Host "`n🎉 Instalación completa. Listo para usar la PC como un campeón."

