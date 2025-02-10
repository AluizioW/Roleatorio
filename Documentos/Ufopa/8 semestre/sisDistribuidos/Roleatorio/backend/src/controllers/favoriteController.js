const favoriteModel = require('../models/favoriteModel');

const getAll = async (request, response) => {
    const [favoritos] = await favoriteModel.getAll();
    return response.status(200).json(favoritos);
};

const registerFavorito = async(request, response) => {
    const newFavorito= await favoriteModel.registerFavorito(request.body);
    return response.status(201).json(newFavorito);
};

const cancelFavorito = async(request, response) => {
    await favoriteModel.cancelFavorito(request.body);
    return response.status(204).send();
};

module.exports = {
    getAll,
    registerFavorito,
    cancelFavorito
};