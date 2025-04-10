# Autoinstalador Windows 

Este script en PowerShell instala automáticamente las aplicaciones esenciales.

---

## ¿Qué instala?

- ✅ Google Chrome  
- ✅ WinRAR  
- ✅ Adobe Acrobat Reader (64-bit)  
- ✅ AnyDesk  
- ✅ VLC Media Player  
- ✅ Microsoft Teams  
- ✅ FortiClient VPN

Y además:

- ✅ **Nitro Pro** desde GitHub Releases (El Serial no lo agregue por temas de seguridad)

---

## ¿Cómo se usa?

### 1. Abrí PowerShell **como administrador**

### 2. Ejecutá esto:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
iwr -useb https://raw.githubusercontent.com/Fortu27/autoinstalador_windows/main/install.ps1 | iex


