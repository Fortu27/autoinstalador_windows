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

$claveCorrecta = 'D4t4st4R$$'  # Cambiá esto por la contraseña real
$intentosMaximos = 3
$intento = 1
$autenticado = $false

while ($intento -le $intentosMaximos -and -not $autenticado) {
    Write-Host "`n🔐 Intento $intento de $intentosMaximos"
    $password = Read-Host -AsSecureString "Ingresá la contraseña para ver la clave de Nitro"
    $passwordTexto = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
        [Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
    )

    if ($passwordTexto -eq $claveCorrecta) {
        Write-Host "`n✅ Contraseña correcta. Mostrando link de activación..."
        Write-Host "https://datastarargentina-my.sharepoint.com/:f:/g/personal/mfortunato_datastar_com_ar/EjYWX5qs1e9Fm2zrRCGoRPEB3MqSSe8WGFi4KPFol3DG2g?e=qHoiCe" -ForegroundColor Cyan
        $autenticado = $true
    } else {
        Write-Host "❌ Contraseña incorrecta." -ForegroundColor Red
        if ($intento -lt $intentosMaximos) {
            Write-Host "⏳ Intentá de nuevo..."
        }
        $intento++
    }
}

if (-not $autenticado) {
    Write-Host "`n🚫 Demasiados intentos fallidos. Hablar con Soporte Interno" -ForegroundColor DarkRed
}



Write-Host "`n🎉 Instalación completa. Listo para usar la PC como un campeón."

