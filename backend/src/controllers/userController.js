const userModel = require('../models/userModel');

const getAll = async (request, response) => {
    const [users] = await userModel.getAll();
    return response.status(200).json(users);
};

const registerUser = async(request, response) => {
    const registeredUser = await userModel.registerUser(request.body);
    return response.status(201).json(registeredUser);
};

const updateUser = async(request, response) => {
    const {id} = request.params;

    await userModel.updateUser(id, request.body);
    return response.status(204).json();
}

const deleteUser = async(request, response) => {
    const {id} = request.params;

    await userModel.deleteUser(id);
    return response.status(204).json();
}

module.exports = {
    getAll,
    registerUser,
    updateUser,
    deleteUser
};
