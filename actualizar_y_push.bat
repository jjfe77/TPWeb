@echo off
cd /d "%~dp0"

echo ======================================
echo 🔄 Generando lista.json con los archivos ZIP
echo ======================================

setlocal enabledelayedexpansion
set "json=[" 
set first=true

for %%f in (proyectos\*.zip) do (
    if "!first!"=="true" (
        set "json=!json!{\"nombre\": \"%%~nxf\"}"
        set first=false
    ) else (
        set "json=!json!, {\"nombre\": \"%%~nxf\"}"
    )
)

set "json=!json!]"
echo !json! > proyectos\lista.json

echo ✅ Archivo lista.json generado correctamente.
echo.
type proyectos\lista.json
echo.
echo ======================================
echo 🚀 Subiendo cambios a GitHub Pages
echo ======================================

git add proyectos\lista.json
git commit -m "🔄 Actualización automática de lista.json (%date% %time%)"
git push origin main

echo.
echo ✅ Proceso completado correctamente.
pause
