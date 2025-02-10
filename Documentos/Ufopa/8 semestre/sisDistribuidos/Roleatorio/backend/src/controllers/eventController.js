const eventModel = require('../models/eventModel');

const getAll = async (request, response) => {
    const [eventos] = await eventModel.getAll();
    return response.status(200).json(eventos);
};

const registerEvento = async(request, response) => {
    const newEvento= await eventModel.registerEvento(request.body);
    return response.status(201).json(newEvento);
};  

const updateEvento = async(request, response) => {
    const {id} = request.params;

    await eventModel.updateEvento(id, request.body);
    return response.status(204).json();
};

const finishEvento = async(request, response) => {
    const {id} = request.params;

    await eventModel.finishEvento(id);
    return response.status(204).json(); 
};

const cancelEvento = async(request, response) => {
    const {id} = request.params;

    await eventModel.cancelEvento(id);
    return response.status(204).json(); 
};

module.exports = {
    getAll,
    registerEvento,
    updateEvento,
    finishEvento,
    cancelEvento
};