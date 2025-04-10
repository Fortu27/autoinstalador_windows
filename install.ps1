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

# 🔒 Solicitar contraseña para ver la clave de activación
$claveCorrecta = 'D4t4st4R$$'  # ← Cambiala por la contraseña real

$password = Read-Host -AsSecureString "🔐 Ingresá la contraseña para ver la clave de Nitro"
$passwordTexto = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
)

if ($passwordTexto -eq $claveCorrecta) {
    Write-Host "`n✅ Contraseña correcta. Mostrando link de activación..."
    Write-Host "https://datastarargentina-my.sharepoint.com/:f:/r/personal/mfortunato_datastar_com_ar/Documents/Activador%20Nitro%20Pro?csf=1&web=1&e=caDnCJ" -ForegroundColor Cyan
    Write-Host "`n⚠️ Ingresá con tu cuenta y buscá la clave para activación de Nitro."
} else {
    Write-Host "`n❌ Contraseña incorrecta. Hablar con Soporteinterno" -ForegroundColor Red
}



Write-Host "`n🎉 Instalación completa. Listo para usar la PC como un campeón."

