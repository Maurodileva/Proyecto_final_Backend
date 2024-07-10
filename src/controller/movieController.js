// src/controller/movieController.js
const movieModel = require('../data/movieModel');

exports.getAllMovies = async (req, res) => {
    try {
        const [movies] = await movieModel.getAll();
        res.render('movies', { movies, message: req.query.message || null });
    } catch (error) {
        res.status(500).send(error.message);
    }
};

exports.getMovieById = async (req, res) => {
    try {
        const [movie] = await movieModel.getById(req.params.id);
        res.json(movie);
    } catch (error) {
        res.status(500).send(error.message);
    }
};

exports.createMovie = async (req, res) => {
    try {
        const result = await movieModel.create(req.body);
        const newMovieId = result.insertId;
        res.redirect(`/movies?message=Película creada con ID: ${newMovieId} y nombre: ${req.body.Pelicula_Nombre}`);
    } catch (error) {
        res.status(500).send(error.message);
    }
};

exports.updateMovie = async (req, res) => {
    try {
        const result = await movieModel.update(req.params.id, req.body);
        res.redirect(`/movies?message=Película actualizada con ID: ${req.params.id} y nombre: ${req.body.Pelicula_Nombre}`);
    } catch (error) {
        res.status(500).send(error.message);
    }
};

exports.deleteMovie = async (req, res) => {
    try {
        const result = await movieModel.delete(req.params.id);
        res.redirect(`/movies?message=Película eliminada con ID: ${req.params.id}`);
    } catch (error) {
        res.status(500).send(error.message);
    }
};
