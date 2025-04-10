# 🛠️ Autoinstalador Windows 

Este script en PowerShell instala automáticamente las aplicaciones esenciales para cualquier equipo nuevo en pocos minutos. Ideal para entornos sin Intune, técnicos tercerizados o simplemente para no perder tiempo reinstalando todo.

---

## ⚙️ ¿Qué instala?

Con `winget`:

- ✅ Google Chrome  
- ✅ WinRAR  
- ✅ Adobe Acrobat Reader (64-bit)  
- ✅ AnyDesk  
- ✅ VLC Media Player  
- ✅ Microsoft Teams  
- ✅ FortiClient VPN

Y además:

- ✅ **Nitro Pro 10.5.7.32 (x64)** desde GitHub Releases

---

## 🚀 ¿Cómo se usa?

### 1. Abrí PowerShell **como administrador**

Presioná `Win + X` → "Windows PowerShell (Admin)"

### 2. Ejecutá esto:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
iwr -useb https://raw.githubusercontent.com/Fortu27/autoinstalador_windows/main/install.ps1 | iex


