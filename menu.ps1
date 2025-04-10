# menu.ps1 — Menú interactivo para probar instalaciones

Set-ExecutionPolicy Bypass -Scope Process -Force

# Definimos las opciones del menú
$opciones = @(
    @{ Key = "1"; Nombre = "Google Chrome"; Acción = { winget install --id=Google.Chrome -e --silent --accept-package-agreements --accept-source-agreements } },
    @{ Key = "2"; Nombre = "WinRAR"; Acción = { winget install --id=RARLab.WinRAR -e --silent --accept-package-agreements --accept-source-agreements } },
    @{ Key = "3"; Nombre = "VLC Media Player"; Acción = { winget install --id=VideoLAN.VLC -e --silent --accept-package-agreements --accept-source-agreements } },
    @{ Key = "4"; Nombre = "Adobe Reader"; Acción = { winget install --id=Adobe.Acrobat.Reader.64-bit -e --silent --accept-package-agreements --accept-source-agreements } },
    @{ Key = "5"; Nombre = "AnyDesk"; Acción = {
        $url="https://download.anydesk.com/AnyDesk.exe"
        $out="$env:TEMP\AnyDesk.exe"
        Invoke-WebRequest $url -OutFile $out
        Start-Process $out -ArgumentList "/silent" -Wait
    } },
    @{ Key = "6"; Nombre = "FortiClient VPN"; Acción = { winget install --id=Fortinet.FortiClientVPN -e --silent --accept-package-agreements --accept-source-agreements } },
    @{ Key = "7"; Nombre = "Microsoft Teams"; Acción = { winget install --id=Microsoft.Teams -e --silent --accept-package-agreements --accept-source-agreements } },
    @{ Key = "8"; Nombre = "Nitro Pro"; Acción = {
        $url="https://github.com/Fortu27/autoinstalador_windows/releases/download/v1.0.0/Nitro.Pro.10.5.7.32.-.x64.exe"
        $out="$env:TEMP\NitroProInstaller.exe"
        Invoke-WebRequest $url -OutFile $out
        Start-Process $out -ArgumentList "/quiet" -Wait
    } },
    @{ Key = "9"; Nombre = "Instalar todo"; Acción = { $global:instalarTodo = $true } },
    @{ Key = "0"; Nombre = "Salir"; Acción = { exit } }
)

function Mostrar-Menú {
    Clear-Host
    Write-Host "=== Menú de Instalación ===`n" -ForegroundColor Cyan
    foreach ($opt in $opciones) {
        Write-Host "$($opt.Key). $($opt.Nombre)"
    }
    Write-Host
}

# Bucle principal
do {
    Mostrar-Menú
    $elección = Read-Host "Elige una opción (0 para salir)"
    
    $seleccion = $opciones | Where-Object Key -EQ $elección
    if ($null -ne $seleccion) {
        if ($seleccion.Key -eq "9") {
            # Instalar todo
            foreach ($opt in $opciones | Where-Object { $_.Key -match '^[1-8]$' }) {
                Write-Host "`n--- $($opt.Nombre) ---" -ForegroundColor Yellow
                & $opt.Acción
            }
            Write-Host "`n✅ Todas las instalaciones completadas." -ForegroundColor Green
            break
        } elseif ($seleccion.Key -eq "0") {
            break
        } else {
            Write-Host "`n--- Instalando $($seleccion.Nombre) ---" -ForegroundColor Yellow
            & $seleccion.Acción
            Read-Host "`nPresioná Enter para volver al menú"
        }
    } else {
        Write-Host "`n❌ Opción inválida. Intentá de nuevo." -ForegroundColor Red
        Start-Sleep -Seconds 1
    }
} while ($true)
