@echo off
cd /d "%~dp0"
echo ---------------------------------
echo Iniciando push automatico a GitHub...
echo ---------------------------------

git add .
echo Archivos agregados.

set /p mensaje=Ingrese el mensaje de commit: 
git commit -m "%mensaje%"
echo Commit realizado con mensaje: "%mensaje%"

echo Ejecutando git push...
git push origin HEAD

if %errorlevel% neq 0 (
    echo ❌ Error al hacer push. Revise las credenciales o el remoto.
) else (
    echo ✅ Cambios enviados correctamente.
)

echo ---------------------------------
pause
