-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 17-Mar-2025 às 13:58
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
(2, 'Educação'),
(9, 'Cinema'),
(10, 'Jogos'),
(11, 'Música');

-- --------------------------------------------------------

--
-- Estrutura da tabela `eventos`
--

CREATE TABLE `eventos` (
  `id` int NOT NULL,
  `nome` varchar(90) NOT NULL,
  `descricao` longtext NOT NULL,
  `dia` date NOT NULL,
  `hora` time NOT NULL,
  `local` longtext NOT NULL,
  `idUsuarioPai` int NOT NULL,
  `idStatus` enum('1','2','3','4') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `eventos`
--

INSERT INTO `eventos` (`id`, `nome`, `descricao`, `dia`, `hora`, `local`, `idUsuarioPai`, `idStatus`) VALUES
(1, 'volei de quadra', 'alegria e diversao, um grupo de 6 passando a bola pra outro grupo de 6 por cima da rede, todas as idades, apenas recreação', '2025-02-13', '11:00:00', 'Colégio Ufopa, travessa de vidro, 200, entre Rua 1 e Rua 2', 1, '1'),
(2, 'Transmissão jogo do Sampaio Corrê e Barcelona', 'Venha assistir essa partida imperdível ao lado dos seus amigos e das pessoas importantes para você enquanto toma uma cerveja bem gelada. Som ao vivo durante o intervalo.', '2025-02-09', '16:30:00', 'Bar Bante, Rua dos Cocais, Bairro Transmissoria, no canto do hospital Cura por Dinheiro', 1, '1'),
(3, 'testes', 'testando so', '2025-02-07', '08:56:00', 'Tem VOLEI AQUI', 1, '1'),
(4, 'role', 'role de teste', '2025-02-07', '12:00:00', 'local de testes', 1, '3'),
(5, 'teste5', 'teste de edicao de evento', '2025-12-25', '12:00:00', 'local de tste de edicao', 1, '4'),
(6, 'role3', 'role de teste', '2025-02-07', '00:00:12', 'local de testes', 1, '1'),
(7, 'role4', 'role de teste', '2025-02-07', '00:00:12', 'local de testes', 1, '1'),
(8, 'teste', 'nada de mais', '2025-03-18', '12:12:00', 'lago do maica', 1, '1'),
(9, 'aula', 'aula', '2026-12-12', '12:00:00', 'ESCOLA', 1, '1'),
(10, 'teste', 'wjdfnsjd', '2009-12-12', '12:12:00', 'kdnMFSDJ', 1, '1'),
(11, 'teste', '5 coisas', '2025-05-25', '05:15:00', 'rua 5 de junho', 1, '1'),
(12, 'teste2', '6 coisas', '2025-05-25', '05:15:00', 'rua 5 de junho', 1, '1'),
(13, 'teste19', '9 coisas', '2025-05-25', '05:15:00', 'rua 5 de junho', 1, '1'),
(14, 'kdsfjsdf', 'qrijgkjftkg', '2035-12-12', '06:24:00', 'oqwdfnwujn', 1, '1'),
(15, 'yewgfuwegd', 'qrijgkjftkg', '2035-12-12', '06:24:00', 'iyegf', 1, '1'),
(16, 'iwrjifgrhg', 'pokopkok', '2006-01-01', '00:00:00', 'oppkok', 1, '1'),
(17, 'poiopi', 'opiporitpoerioep', '2026-12-12', '12:12:00', 'poipoiopi', 1, '1'),
(18, 'assistir chuva', 'chuva', '2026-06-06', '06:06:00', 'orla', 1, '1');

--
-- Acionadores `eventos`
--
DELIMITER $$
CREATE TRIGGER `atualizar_status_evento` BEFORE UPDATE ON `eventos` FOR EACH ROW BEGIN
    -- Verifica se a data do evento é igual à data atual E a hora do evento é igual à hora atual
    IF NEW.dia = CURRENT_DATE AND NEW.hora = CURRENT_TIME THEN
        SET NEW.idStatus = '2';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `evento_categoria`
--

CREATE TABLE `evento_categoria` (
  `id` int NOT NULL,
  `idEvento` int NOT NULL,
  `idCategoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `evento_categoria`
--

INSERT INTO `evento_categoria` (`id`, `idEvento`, `idCategoria`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `evento_tag`
--

CREATE TABLE `evento_tag` (
  `id` int NOT NULL,
  `idEvento` int NOT NULL,
  `idTag` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `evento_tag`
--

INSERT INTO `evento_tag` (`id`, `idEvento`, `idTag`) VALUES
(1, 2, 4),
(2, 2, 6),
(3, 1, 1),
(4, 1, 2),
(5, 1, 6),
(6, 5, 1);

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
(1, 2),
(2, 4),
(2, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `status`
--

CREATE TABLE `status` (
  `id_status` int NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `status`
--

INSERT INTO `status` (`id_status`, `nome`) VALUES
(1, 'Agendado'),
(4, 'Cancelado'),
(2, 'Em Andamento'),
(3, 'Finalizado');

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
(2, ' Caluizio walter', 'baluizio@gmail.com', '12345678902', '93991020202', 'Csenha', 1),
(3, 'xaluizio walter', 'xaluizio@gmail.com', '02345678902', '03991020202', 'xsenha', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices para tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `evento_categoria`
--
ALTER TABLE `evento_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `evento_tag`
--
ALTER TABLE `evento_tag`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `favorito`
--
ALTER TABLE `favorito`
  ADD PRIMARY KEY (`idUsuario`,`idEvento`);

--
-- Índices para tabela `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`),
  ADD UNIQUE KEY `nome` (`nome`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `evento_categoria`
--
ALTER TABLE `evento_categoria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `evento_tag`
--
ALTER TABLE `evento_tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`lui`@`localhost` EVENT `atualizar_status_eventos` ON SCHEDULE EVERY 1 MINUTE STARTS '2025-02-07 08:54:41' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE eventos
  SET id_status = '2'
  WHERE (data_evento < CURDATE())
     OR (data_evento = CURDATE() AND hora_evento <= CURTIME())
       AND id_status <> '1'$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
