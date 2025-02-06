# Roleatório

O **Roleatório** é uma aplicação que permite aos usuários criar, visualizar, compartilhar, pesquisar e favoritar eventos. Os eventos podem ser categorizados e marcados com tags, facilitando a organização e a busca. Este sistema é ideal para quem deseja gerenciar e promover eventos de forma simples e eficiente.

### Protótipo
![Captura de tela de 2025-02-06 03-20-24](https://github.com/user-attachments/assets/53523f75-64d7-4f6a-ac7c-5b2959252b07)

https://www.figma.com/design/CFhFtNf4cVa2E9x3JdUP5I/Roleat%C3%B3rio---Sitemas-Distribuidos?node-id=0-1&p=f&t=ac14C0DlwGCmNekb-0

## Funcionalidades

### Criação de Eventos:
- Os usuários podem criar eventos com informações como **nome, local, data, hora, descrição, categorias e tags**.
- As **categorias** são predefinidas, enquanto as **tags** podem ser criadas pelos usuários.

### Visualização de Eventos:
- Os usuários podem visualizar detalhes dos eventos, incluindo informações como **local, data, hora, descrição, categorias e tags**.

### Compartilhamento de Eventos:
- Os eventos podem ser **compartilhados** por meio de links ou redes sociais.

### Pesquisa de Eventos:
- Os usuários podem pesquisar eventos por **nome, local, horário, data, categoria, tags ou usuário criador**.

### Favoritar Eventos:
- Os usuários podem **favoritar eventos** para acessá-los facilmente no futuro.

### Gerenciamento de Usuários:
- Os usuários possuem um **perfil** com informações pessoais, como **nome, email, CPF, celular e senha**.

### Modelo do Banco:
![Captura de tela de 2025-02-06 03-17-21](https://github.com/user-attachments/assets/3b669017-0f68-41ca-9b69-9b5ebac65340)


## Tecnologias Utilizadas

- **Backend**: Node.js com Express para a API.
- **Banco de Dados**: PostgreSQL para armazenar dados de usuários, eventos, categorias e tags.

### Outras Ferramentas:
- Dotenv para gerenciamento de variáveis de ambiente.

## Como Configurar o Projeto

### Pré-requisitos

- Node.js instalado.

### Passos para Configuração

1. **Instale as dependências:**

```
npm init -y
```

```
npm install express
```

```
npm install mysql2
```

```
npm install nodemon -D
```


```
npm install dotenv
```

```
npx eslint --init
```
 Esolhas no eslint: 
```
> to check syntax and find problems

> CommonJs

> none of these

> no

> node
 
> npm
```

Resultado: 
```
✔ How would you like to use ESLint? · problems
✔ What type of modules does your project use? · commonjs
✔ Which framework does your project use? · none
✔ Does your project use TypeScript? · javascript
✔ Where does your code run? · node
The config that you've selected requires the following dependencies:

eslint, globals, @eslint/js
✔ Would you like to install them now? · No / Yes
✔ Which package manager do you want to use? · npm


```

2. **Configure o banco de dados:**
   - Crie um banco de dados no PostgreSQL.
   - Configure as variáveis de ambiente no arquivo `.env` (veja o exemplo em `.env.example`):

```env
DB_HOST=localhost
DB_USER=seu_usuario
DB_PASSWORD=sua_senha
DB_NAME=nome_do_banco
JWT_SECRET=sua_chave_secreta_jwt
PORT=3000
```

3. **Inicie o servidor:**

```
npm run dev
```

4. **Acesse a aplicação:**
   - Utilize a port do .env.
   - Por exemplo: O servidor estará rodando em [http://localhost:3000](http://localhost:3000).

## Endpoints atuais da API

### Usuários
- `GET /user/user` → "getAll" retorna usuários.
- `POST /user` → "registerUser" adiciona usuário ao banco.
- `PUT /user/:id` → "updateUser" edita informações do usuário.
- `PUT /users/:id/delete` → "deleteUser" faz exclusão lógica do usuário.

### Eventos


### Categorias


### Tags


### Favoritos

## Contato

- **Nome**: Aluizio Walter Pena Sousa
- **Email**: aluizio.sousa@discente.ufopa.edu.br or walterlui9@gmail.com
