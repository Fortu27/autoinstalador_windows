# Instalador Automático para Windows

Este script instala automáticamente los programas básicos para PCs nuevas:

- WinRAR  
- Google Chrome  
- Adobe Acrobat Reader  
- AnyDesk  
- VLC Media Player

## Uso

1. Abrí PowerShell como administrador  
2. Ejecutá esto:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
iwr -useb https://raw.githubusercontent.com/Fortu27/autoinstalador_windows/main/install.ps1 | iex

