// src/data/movieModel.js
const db = require('./db');

exports.getAll = () => {
    return db.query('SELECT * FROM Peliculas');
};

exports.getById = (id) => {
    return db.query('SELECT * FROM Peliculas WHERE id = ?', [id]);
};

exports.create = (movie) => {
    const { Pelicula_Nombre, Pelicula_Nombre_Original, Anio, Sinopsis, id_Estado, Lenguaje_Original_id, PresupuestoUSD, IngresosUSD } = movie;
    return db.query(
        'INSERT INTO Peliculas (Pelicula_Nombre, Pelicula_Nombre_Original, Anio, Sinopsis, id_Estado, Lenguaje_Original_id, PresupuestoUSD, IngresosUSD) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
        [Pelicula_Nombre, Pelicula_Nombre_Original, Anio, Sinopsis, id_Estado, Lenguaje_Original_id, PresupuestoUSD, IngresosUSD]
    );
};

exports.update = (id, movie) => {
    const { Pelicula_Nombre, Pelicula_Nombre_Original, Anio, Sinopsis, id_Estado, Lenguaje_Original_id, PresupuestoUSD, IngresosUSD } = movie;
    return db.query(
        'UPDATE Peliculas SET Pelicula_Nombre = ?, Pelicula_Nombre_Original = ?, Anio = ?, Sinopsis = ?, id_Estado = ?, Lenguaje_Original_id = ?, PresupuestoUSD = ?, IngresosUSD = ? WHERE id = ?',
        [Pelicula_Nombre, Pelicula_Nombre_Original, Anio, Sinopsis, id_Estado, Lenguaje_Original_id, PresupuestoUSD, IngresosUSD, id]
    );
};

exports.delete = (id) => {
    return db.query('DELETE FROM Peliculas WHERE id = ?', [id]);
};
