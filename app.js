const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

// Configura el motor de vistas
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'src', 'views'));

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Servir archivos estáticos (CSS, imágenes, etc.)
app.use(express.static(path.join(__dirname, 'src', 'public')));

// Rutas
const movieRoutes = require('./src/routes/movieRoutes');

// Ruta para la raíz que redirige a /movies
app.get('/', (req, res) => {
  res.redirect('/movies');
});

app.use('/movies', movieRoutes);

// Manejar todas las demás rutas y devolver un error 404
app.use((req, res, next) => {
  res.status(404).send('Página no encontrada');
});


// Inicia el servidor
app.listen(port, () => {
  console.log(`PROYECTO MOVIES: Servidor ejecutándose en puerto ${port}`);
});
