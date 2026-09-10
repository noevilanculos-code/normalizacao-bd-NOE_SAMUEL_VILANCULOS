-- =====================================================================
-- 01_ddl_criacao_tabelas_mysql.sql
-- Sistema de Gestão de Funcionários
-- Esquema relacional normalizado (4FN)
-- Universidade Licungo - Faculdade de Ciências e Tecnologias
-- Curso de Licenciatura em Informática
--
-- Compatível com MySQL 8.0+
-- Motor: InnoDB
-- =====================================================================

-- Criar a base de dados
CREATE DATABASE IF NOT EXISTS gestao_funcionarios
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Selecionar a base de dados
USE gestao_funcionarios;


-- =====================================================================
-- REMOVER TABELAS EXISTENTES
-- =====================================================================

DROP TABLE IF EXISTS funcionario_telefone;
DROP TABLE IF EXISTS funcionario_filho;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS posto_trabalho;
DROP TABLE IF EXISTS funcao;
DROP TABLE IF EXISTS cargo;
DROP TABLE IF EXISTS cidade;
DROP TABLE IF EXISTS provincia;
DROP TABLE IF EXISTS pais;


-- =====================================================================
-- TABELA PAIS
-- =====================================================================

CREATE TABLE pais (
    id_pais INT NOT NULL,
    nome_pais VARCHAR(60) NOT NULL,

    CONSTRAINT pk_pais
        PRIMARY KEY (id_pais),

    CONSTRAINT uq_pais_nome
        UNIQUE (nome_pais)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


-- =====================================================================
-- TABELA PROVINCIA
-- =====================================================================

CREATE TABLE provincia (
    id_provincia INT NOT NULL,
    nome_provincia VARCHAR(60) NOT NULL,
    id_pais INT NOT NULL,

    CONSTRAINT pk_provincia
        PRIMARY KEY (id_provincia),

    CONSTRAINT fk_provincia_pais
        FOREIGN KEY (id_pais)
        REFERENCES pais(id_pais),

    CONSTRAINT uq_provincia_pais
        UNIQUE (nome_provincia, id_pais)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


-- =====================================================================
-- TABELA CIDADE
-- =====================================================================

CREATE TABLE cidade (
    id_cidade INT NOT NULL,
    nome_cidade VARCHAR(60) NOT NULL,
    id_provincia INT NOT NULL,

    CONSTRAINT pk_cidade
        PRIMARY KEY (id_cidade),

    CONSTRAINT fk_cidade_provincia
        FOREIGN KEY (id_provincia)
        REFERENCES provincia(id_provincia),

    CONSTRAINT uq_cidade_provincia
        UNIQUE (nome_cidade, id_provincia)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


-- =====================================================================
-- TABELA CARGO
-- =====================================================================

CREATE TABLE cargo (
    cod_cargo VARCHAR(5) NOT NULL,
    nome_cargo VARCHAR(80) NOT NULL,

    CONSTRAINT pk_cargo
        PRIMARY KEY (cod_cargo),

    CONSTRAINT uq_cargo_nome
        UNIQUE (nome_cargo)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


-- =====================================================================
-- TABELA FUNCAO
-- =====================================================================

CREATE TABLE funcao (
    cod_funcao VARCHAR(5) NOT NULL,
    nome_funcao VARCHAR(80) NOT NULL,

    CONSTRAINT pk_funcao
        PRIMARY KEY (cod_funcao),

    CONSTRAINT uq_funcao_nome
        UNIQUE (nome_funcao)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


-- =====================================================================
-- TABELA POSTO_TRABALHO
-- =====================================================================

CREATE TABLE posto_trabalho (
    id_posto INT NOT NULL,
    nome_posto VARCHAR(80) NOT NULL,

    CONSTRAINT pk_posto
        PRIMARY KEY (id_posto),

    CONSTRAINT uq_posto_nome
        UNIQUE (nome_posto)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


-- =====================================================================
-- TABELA FUNCIONARIO
-- =====================================================================

CREATE TABLE funcionario (
    nuit VARCHAR(9) NOT NULL,
    nome VARCHAR(120) NOT NULL,
    data_nascimento DATE NOT NULL,
    bi VARCHAR(20) NOT NULL,
    email VARCHAR(120) NOT NULL,
    avenida_rua VARCHAR(120) NOT NULL,
    numero_porta VARCHAR(10),
    bairro VARCHAR(80),
    id_cidade INT NOT NULL,
    cod_cargo VARCHAR(5) NOT NULL,
    cod_funcao VARCHAR(5) NOT NULL,
    id_posto INT NOT NULL,
    data_admissao DATE NOT NULL,

    CONSTRAINT pk_funcionario
        PRIMARY KEY (nuit),

    CONSTRAINT uq_funcionario_bi
        UNIQUE (bi),

    CONSTRAINT uq_funcionario_email
        UNIQUE (email),

    CONSTRAINT fk_funcionario_cidade
        FOREIGN KEY (id_cidade)
        REFERENCES cidade(id_cidade),

    CONSTRAINT fk_funcionario_cargo
        FOREIGN KEY (cod_cargo)
        REFERENCES cargo(cod_cargo),

    CONSTRAINT fk_funcionario_funcao
        FOREIGN KEY (cod_funcao)
        REFERENCES funcao(cod_funcao),

    CONSTRAINT fk_funcionario_posto
        FOREIGN KEY (id_posto)
        REFERENCES posto_trabalho(id_posto)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


-- =====================================================================
-- TABELA FUNCIONARIO_FILHO
-- =====================================================================

CREATE TABLE funcionario_filho (
    id_filho INT NOT NULL,
    nuit VARCHAR(9) NOT NULL,
    nome_filho VARCHAR(120) NOT NULL,

    CONSTRAINT pk_funcionario_filho
        PRIMARY KEY (id_filho),

    CONSTRAINT fk_filho_funcionario
        FOREIGN KEY (nuit)
        REFERENCES funcionario(nuit)
        ON DELETE CASCADE,

    CONSTRAINT uq_filho_por_funcionario
        UNIQUE (nuit, nome_filho)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


-- =====================================================================
-- TABELA FUNCIONARIO_TELEFONE
-- =====================================================================

CREATE TABLE funcionario_telefone (
    id_telefone INT NOT NULL,
    nuit VARCHAR(9) NOT NULL,
    numero_telefone VARCHAR(15) NOT NULL,

    CONSTRAINT pk_funcionario_telefone
        PRIMARY KEY (id_telefone),

    CONSTRAINT fk_telefone_funcionario
        FOREIGN KEY (nuit)
        REFERENCES funcionario(nuit)
        ON DELETE CASCADE,

    CONSTRAINT uq_telefone_numero
        UNIQUE (numero_telefone)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


-- =====================================================================
-- VERIFICAR AS TABELAS CRIADAS
-- =====================================================================

SHOW TABLES;
