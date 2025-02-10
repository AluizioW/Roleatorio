const connection = require('./connection');

const getAll = async () => {
    const users = await connection.execute('SELECT * FROM users');
    return users;
};

const registerUser = async (user) => {
    const {nome, email, cpf, celular, senha} = user;

    const query = 'INSERT INTO users(nome, email, cpf, celular, senha) VALUES (?, ?, ?, ?, ?)';
    const registeredUser = await connection.execute(query, [nome, email, cpf, celular, senha]);

    return registeredUser;
};

const updateUser = async (id, user) => {
    const {nome, cpf, celular, senha} = user;

    // testar email depois
    const query = 'UPDATE users SET nome = ?, cpf = ?, celular = ?, senha = ? WHERE id = ?';
    const [updatedUser] = await connection.execute(query, [nome, cpf, celular, senha, id]);

    return updatedUser;
}

const deleteUser = async (id, user) => {
    
    const query = 'UPDATE users SET excluido = "1" WHERE id = ?';
    const [deletedUser] = await connection.execute(query, [id]);

    return {message: "Usuário excluído com sucesso!"};
}

module.exports = {
    getAll,
    registerUser,
    updateUser,
    deleteUser
}; 