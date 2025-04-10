Write-Host "🚀 Instalador automático iniciado..." -ForegroundColor Cyan

function Instalar-App($nombre, $id) {
    Write-Host "🔧 Instalando $nombre..."
    winget install --id=$id -e --silent
}

# Lista de programas
Instalar-App "WinRAR" "RARLab.WinRAR"
Instalar-App "Google Chrome" "Google.Chrome"
Instalar-App "Adobe Acrobat Reader" "Adobe.Acrobat.Reader.64-bit"
Instalar-App "AnyDesk" "AnyDeskSoftwareGmbH.AnyDesk"
Instalar-App "VLC Media Player" "VideoLAN.VLC"

Write-Host "`n✅ Todo instalado. Reiniciá si algo no funciona bien." -ForegroundColor Green
