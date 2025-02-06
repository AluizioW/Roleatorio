-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 06-Fev-2025 às 02:36
-- Versão do servidor: 8.0.41-0ubuntu0.20.04.1
-- versão do PHP: 7.4.3-4ubuntu2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `roleatorio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `nome`) VALUES
(1, 'Esporte'),
(2, 'Educação');

-- --------------------------------------------------------

--
-- Estrutura da tabela `evento_categoria`
--

CREATE TABLE `evento_categoria` (
  `idEvento` int NOT NULL,
  `idCategoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `evento_categoria`
--

INSERT INTO `evento_categoria` (`idEvento`, `idCategoria`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `evento_tag`
--

CREATE TABLE `evento_tag` (
  `idEvento` int NOT NULL,
  `idTag` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `evento_tag`
--

INSERT INTO `evento_tag` (`idEvento`, `idTag`) VALUES
(2, 4),
(2, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `events`
--

CREATE TABLE `events` (
  `id` int NOT NULL,
  `nome` varchar(90) NOT NULL,
  `descricao` longtext NOT NULL,
  `dia` date NOT NULL,
  `hora` time NOT NULL,
  `local` longtext NOT NULL,
  `idCategoria` int NOT NULL,
  `idTag` int NOT NULL,
  `idUsuarioPai` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `events`
--

INSERT INTO `events` (`id`, `nome`, `descricao`, `dia`, `hora`, `local`, `idCategoria`, `idTag`, `idUsuarioPai`) VALUES
(1, 'volei de quadra', 'alegria e diversao, um grupo de 6 passando a bola pra outro grupo de 6 por cima da rede, todas as idades, apenas recreação', '2025-02-13', '11:00:00', 'Colégio Ufopa, travessa de vidro, 200, entre Rua 1 e Rua 2', 1, 1, 1),
(2, 'Transmissão jogo do Sampaio Corrê e Barcelona', 'Venha assistir essa partida imperdível ao lado dos seus amigos e das pessoas importantes para você enquanto toma uma cerveja bem gelada. Som ao vivo durante o intervalo.', '2025-02-09', '16:30:00', 'Bar Bante, Rua dos Cocais, Bairro Transmissoria, no canto do hospital Cura por Dinheiro', 1, 6, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `favorito`
--

CREATE TABLE `favorito` (
  `idUsuario` int NOT NULL,
  `idEvento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `favorito`
--

INSERT INTO `favorito` (`idUsuario`, `idEvento`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tag`
--

CREATE TABLE `tag` (
  `id` int NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `tag`
--

INSERT INTO `tag` (`id`, `nome`) VALUES
(1, 'volei'),
(2, 'grupo'),
(3, 'jovem'),
(4, 'adulto'),
(5, 'familia'),
(6, 'lazer'),
(7, 'escola');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `nome` varchar(90) NOT NULL,
  `email` varchar(90) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `excluido` tinyint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `nome`, `email`, `cpf`, `celular`, `senha`, `excluido`) VALUES
(1, ' Baluizio walter', 'aluizio@email.com', '12345678902', '93991020202', 'Bsenha', 0),
(2, ' Caluizio walter', 'baluizio@gmail.com', '12345678902', '93991020202', 'Csenha', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices para tabela `evento_categoria`
--
ALTER TABLE `evento_categoria`
  ADD PRIMARY KEY (`idEvento`,`idCategoria`);

--
-- Índices para tabela `evento_tag`
--
ALTER TABLE `evento_tag`
  ADD PRIMARY KEY (`idEvento`,`idTag`);

--
-- Índices para tabela `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `favorito`
--
ALTER TABLE `favorito`
  ADD PRIMARY KEY (`idUsuario`,`idEvento`);

--
-- Índices para tabela `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `events`
--
ALTER TABLE `events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
