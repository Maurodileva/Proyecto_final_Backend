const express = require('express');
const path = require('path');
const methodOverride = require('method-override');
const app = express();
const movieRoutes = require('./src/routes/movieRoutes');

// Configuración del motor de plantillas
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'src/views'));

// Middleware para parsear el cuerpo de las solicitudes POST
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Middleware para method-override
app.use(methodOverride('_method'));

// Servir archivos estáticos
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'css')));
app.use(express.static(path.join(__dirname, 'js')));
app.use(express.static(path.join(__dirname, 'assets/img')));
app.use(express.static(path.join(__dirname, 'pages')));

// Ruta para movies
app.use('/movies', movieRoutes);

// Middleware para manejar errores 404
app.use((req, res, next) => {
    res.status(404).send("Página no encontrada");
});

// Puerto de escucha
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`<PROYECTO MOVIES CAC - Servidor escuchando en el puerto ${PORT}`);
});
