const fs = require('fs');
const path = require('path');

// Carpeta donde están los .zip y donde se guardará lista.json
const carpeta = path.join(__dirname, '..', 'proyectos');

console.log('📂 Leyendo carpeta:', carpeta);

if (!fs.existsSync(carpeta)) {
  console.error('❌ No existe la carpeta "proyectos"');
  process.exit(1);
}

// Leer archivos .zip dentro de la carpeta proyectos
const archivos = fs.readdirSync(carpeta)
  .filter(f => f.toLowerCase().endsWith('.zip'))
  .map(f => ({ archivo: `proyectos/${f}` }));

// Ruta donde se generará lista.json (dentro de proyectos/)
const destino = path.join(carpeta, 'lista.json');

// Escribir el archivo JSON formateado
fs.writeFileSync(destino, JSON.stringify(archivos, null, 2));

console.log('✅ lista.json actualizado correctamente en proyectos/');
