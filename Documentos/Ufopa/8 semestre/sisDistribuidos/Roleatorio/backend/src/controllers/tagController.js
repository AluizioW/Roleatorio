const tagModel = require('../models/tagModel');

const getAll = async (request, response) => {
    const [tags] = await tagModel.getAll();
    return response.status(200).json(tags);
};

module.exports = {
    getAll
};