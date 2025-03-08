const connection = require('./connection');

const getAll = async () => {
    const users = await connection.execute('SELECT * FROM eventos ORDER BY dia, hora');
    return users;
};


const registerEvento = async (evento) => {
    const {nome, descricao, dia, hora, local, idUsuarioPai} = evento;

    const query = 'INSERT INTO eventos(nome, descricao, dia, hora, local, idUsuarioPai) VALUES (?, ?, ?, ?, ?, ?)';
    const newEvento = await connection.execute(query, [nome, descricao, dia, hora, local, idUsuarioPai]);

    return newEvento;
};

const updateEvento = async (id, evento) => {
    const {nome, descricao, dia, hora, local, idStatus} = evento;
    const query = 'UPDATE eventos SET nome = ?, descricao = ?, dia = ?, hora = ?, local = ?, idStatus = ? WHERE id = ?';
    const [updatedEvento] = await connection.execute(query, [nome, descricao, dia, hora, local, idStatus, id]);
 
    return updatedEvento;
} 

const finishEvento = async (id) => {
    const query = 'UPDATE eventos SET idStatus = "3" WHERE id = ?';
    const [finishedEvento] = await connection.execute(query, [id]);

    return finishedEvento;
};

const cancelEvento = async (id) => {
    const query = 'UPDATE eventos SET idStatus = "4" WHERE id = ?';
    const [canceledEvento] = await connection.execute(query, [id]);

    return canceledEvento;
};

module.exports = {
    getAll,
    registerEvento,
    updateEvento,
    finishEvento,
    cancelEvento
};