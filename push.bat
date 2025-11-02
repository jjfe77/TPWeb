@echo off
REM === Actualizar lista.json y hacer push automático ===
echo ====================================================
echo   🔄 Actualizando lista.json de proyectos...
echo ====================================================

REM Verifica que Node esté instalado
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Node.js no está instalado o no está en PATH.
    echo Instálalo desde https://nodejs.org/
    pause
    exit /b
)

REM Ejecuta el script de generación
echo Ejecutando scripts/generar-lista.js ...
node scripts/generar-lista.js

if %errorlevel% neq 0 (
    echo ❌ Error al generar lista.json
    pause
    exit /b
)

REM Agrega cambios a git
git add proyectos/lista.json

REM Pide mensaje de commit
set /p commitmsg=💬 Escribí el mensaje del commit: 
if "%commitmsg%"=="" set commitmsg=🔄 Actualización automática de lista.json

git commit -m "%commitmsg%"

if %errorlevel% neq 0 (
    echo ⚠️ No hay cambios para commitear.
    pause
    exit /b
)

REM Envía al remoto
git push origin main

if %errorlevel% neq 0 (
    echo ❌ Error al hacer push. Verificá tu conexión o credenciales.
    pause
    exit /b
)

echo ====================================================
echo ✅ lista.json actualizado y cambios subidos correctamente.
echo ====================================================
pause
