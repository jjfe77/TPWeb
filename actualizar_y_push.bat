@echo off
cd /d "%~dp0"

echo ======================================
echo 🔄 Generando lista.json con formato legible
echo ======================================

setlocal enabledelayedexpansion
(
    echo [
    set first=true
    for %%f in (proyectos\*.zip) do (
        if "!first!"=="true" (
            echo   { "archivo": "%%~nxf" }
            set first=false
        ) else (
            echo , { "archivo": "%%~nxf" }
        )
    )
    echo ]
) > proyectos\lista.json

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
