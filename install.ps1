# Configuración inicial
Set-ExecutionPolicy Bypass -Scope Process -Force
Write-Host "🚀 Iniciando instalación automática..." -ForegroundColor Cyan

# Función genérica para descargar e instalar
function Descargar-E-instalar {
    param (
        [string]$nombre,
        [string]$url,
        [string]$archivo
    )

    try {
        $ruta = "$env:TEMP\$archivo"
        Write-Host "⬇️ Descargando $nombre..."
        Invoke-WebRequest -Uri $url -OutFile $ruta
        Write-Host "🚀 Instalando $nombre..."
        Start-Process -FilePath $ruta -ArgumentList "/S" -Wait
        Remove-Item $ruta -Force
        Write-Host "✅ $nombre instalado.`n" -ForegroundColor Green
    } catch {
       Write-Host "❌ Error al instalar ${nombre} : $_" -ForegroundColor Red


    }
}

# WinRAR
Descargar-E-instalar -nombre "WinRAR" `
    -url "https://www.rarlab.com/rar/winrar-x64-621.exe" `
    -archivo "winrar.exe"

# Google Chrome
Descargar-E-instalar -nombre "Google Chrome" `
    -url "https://dl.google.com/chrome/install/latest/chrome_installer.exe" `
    -archivo "chrome_installer.exe"

# Adobe Reader
Descargar-E-instalar -nombre "Adobe Reader" `
    -url "https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2300820414/AcroRdrDC2300820414_en_US.exe" `
    -archivo "adobe_reader.exe"

# VLC
Descargar-E-instalar -nombre "VLC Player" `
    -url "https://get.videolan.org/vlc/3.0.20/win64/vlc-3.0.20-win64.exe" `
    -archivo "vlc.exe"

# AnyDesk
Descargar-E-instalar -nombre "AnyDesk" `
    -url "https://download.anydesk.com/AnyDesk.exe" `
    -archivo "anydesk.exe"

# Microsoft Teams (opcional)
Descargar-E-instalar -nombre "Microsoft Teams" `
    -url "https://statics.teams.cdn.office.net/production-windows-x64/enterprise/webview2/lkg/MSTeams-x64.msix" `
    -archivo "teams.msix"

# FortiClient VPN (opcional)
Descargar-E-instalar -nombre "FortiClient VPN" `
    -url "https://filestore.fortinet.com/forticlient/windows/forticlient_vpn_7.0.8.0427_x64.exe" `
    -archivo "forticlient.exe"

# Nitro PDF Pro (desde OneDrive – reemplazá el link abajo)
$nitroUrl = "https://datastarargentina-my.sharepoint.com/:u:/g/personal/mfortunato_datastar_com_ar/EVe090W8oPZGvqCRCyqsTgkBn49jtcEnPkXOpKkqKWeeIQ?e=LKIRBD"
Descargar-E-instalar -nombre "Nitro Pro" -url $nitroUrl -archivo "nitropro.exe"

Write-Host "🎉 Instalación finalizada." -ForegroundColor Cyan

