const { src, dest, watch } = require('gulp');
const sass = require('gulp-sass')(require('sass'));
const sourcemaps = require('gulp-sourcemaps');

const paths = {
    scss: 'src/scss/**/*.scss',  // Ruta de tus archivos .scss
    css: 'dist/css'  // Carpeta de destino para los archivos compilados
};

// Tarea para compilar Sass con Sourcemaps
function css() {
    return src(paths.scss)  // Toma todos los archivos SCSS
        .pipe(sourcemaps.init())  // Inicializa sourcemaps
        .pipe(sass().on('error', sass.logError))  // Compila Sass y maneja errores
        .pipe(sourcemaps.write('.'))  // Escribe los sourcemaps en el mismo directorio
        .pipe(dest(paths.css));  // Guarda los archivos CSS compilados
}

// Tarea para observar los cambios en los archivos SCSS
function watchArchivos() {
    watch(paths.scss, css);  // Si algún archivo SCSS cambia, vuelve a ejecutar la tarea 'css'
}

// Exporta las tareas
exports.css = css;
exports.watchArchivos = watchArchivos;
exports.default = watchArchivos;  // Ejecuta la tarea 'watch' por defecto
