const connection = require('./connection');

const getAll = async () => {
    const favoritos = await connection.execute('SELECT * FROM favorito');
    return favoritos;
};

const registerFavorito = async (favorito) => {
    const {idUser, idEvento} = favorito;
    const query = 'INSERT INTO favorito(idUsuario, idEvento) VALUES (?, ?)';
    const addedFavorite = await connection.execute(query, [idUser, idEvento]);

    return addedFavorite;
};

const cancelFavorito = async (favorito) => {
    const {idUser, idEvento} = favorito;
    const query = 'DELETE FROM favorito WHERE idUsuario = ? AND idEvento = ?';
    const unfavorite = await connection.execute(query, [idUser, idEvento]);

    return unfavorite;
};


module.exports = {
    getAll,
    registerFavorito,
    cancelFavorito
};