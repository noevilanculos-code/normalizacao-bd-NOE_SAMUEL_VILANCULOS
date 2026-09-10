CREATE TABLE `pais` (
  `id_pais` int PRIMARY KEY,
  `nome_pais` varchar(60) UNIQUE NOT NULL
);

CREATE TABLE `provincia` (
  `id_provincia` int PRIMARY KEY,
  `nome_provincia` varchar(60) NOT NULL,
  `id_pais` int NOT NULL
);

CREATE TABLE `cidade` (
  `id_cidade` int PRIMARY KEY,
  `nome_cidade` varchar(60) NOT NULL,
  `id_provincia` int NOT NULL
);

CREATE TABLE `cargo` (
  `cod_cargo` varchar(5) PRIMARY KEY,
  `nome_cargo` varchar(80) UNIQUE NOT NULL
);

CREATE TABLE `funcao` (
  `cod_funcao` varchar(5) PRIMARY KEY,
  `nome_funcao` varchar(80) UNIQUE NOT NULL
);

CREATE TABLE `posto_trabalho` (
  `id_posto` int PRIMARY KEY,
  `nome_posto` varchar(80) UNIQUE NOT NULL
);

CREATE TABLE `funcionario` (
  `nuit` varchar(9) PRIMARY KEY,
  `nome` varchar(120) NOT NULL,
  `data_nascimento` date NOT NULL,
  `bi` varchar(20) UNIQUE NOT NULL,
  `email` varchar(120) UNIQUE NOT NULL,
  `avenida_rua` varchar(120) NOT NULL,
  `numero_porta` varchar(10),
  `bairro` varchar(80),
  `id_cidade` int NOT NULL,
  `cod_cargo` varchar(5) NOT NULL,
  `cod_funcao` varchar(5) NOT NULL,
  `id_posto` int NOT NULL,
  `data_admissao` date NOT NULL
);

CREATE TABLE `funcionario_filho` (
  `id_filho` int PRIMARY KEY,
  `nuit` varchar(9) NOT NULL,
  `nome_filho` varchar(120) NOT NULL
);

CREATE TABLE `funcionario_telefone` (
  `id_telefone` int PRIMARY KEY,
  `nuit` varchar(9) NOT NULL,
  `numero_telefone` varchar(15) UNIQUE NOT NULL
);

CREATE UNIQUE INDEX `provincia_index_0` ON `provincia` (`nome_provincia`, `id_pais`);

CREATE UNIQUE INDEX `cidade_index_1` ON `cidade` (`nome_cidade`, `id_provincia`);

CREATE UNIQUE INDEX `funcionario_filho_index_2` ON `funcionario_filho` (`nuit`, `nome_filho`);

ALTER TABLE `provincia` ADD FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`);

ALTER TABLE `cidade` ADD FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`);

ALTER TABLE `funcionario` ADD FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`);

ALTER TABLE `funcionario` ADD FOREIGN KEY (`cod_cargo`) REFERENCES `cargo` (`cod_cargo`);

ALTER TABLE `funcionario` ADD FOREIGN KEY (`cod_funcao`) REFERENCES `funcao` (`cod_funcao`);

ALTER TABLE `funcionario` ADD FOREIGN KEY (`id_posto`) REFERENCES `posto_trabalho` (`id_posto`);

ALTER TABLE `funcionario_filho` ADD FOREIGN KEY (`nuit`) REFERENCES `funcionario` (`nuit`);

ALTER TABLE `funcionario_telefone` ADD FOREIGN KEY (`nuit`) REFERENCES `funcionario` (`nuit`);
