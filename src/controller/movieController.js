// src/controller/movieController.js
const movieModel = require('../data/movieModel');

exports.getAllMovies = async (req, res) => {
    try {
        const [movies] = await movieModel.getAll();
        res.render('movies', { movies });
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
        res.status(201).json({ id: result.insertId, ...req.body });
    } catch (error) {
        res.status(500).send(error.message);
    }
};

exports.updateMovie = async (req, res) => {
    try {
        const result = await movieModel.update(req.params.id, req.body);
        res.json(result);
    } catch (error) {
        res.status(500).send(error.message);
    }
};

exports.deleteMovie = async (req, res) => {
    try {
        await movieModel.delete(req.params.id);
        res.status(204).send();
    } catch (error) {
        res.status(500).send(error.message);
    }
};
