const connection = require('./connection');

const getAll = async () => {
    const tags = await connection.execute('SELECT * FROM tag');
    return tags;
};

module.exports = {
    getAll
};