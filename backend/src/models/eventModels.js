const connection = require('./connection');

const getAll = async () => {
    const users = await connection.execute('SELECT * FROM eventos');
    return users;
};

module.exports = {

}