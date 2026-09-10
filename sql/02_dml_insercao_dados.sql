-- =====================================================================
-- 02_dml_insercao_dados_mysql.sql
-- Carga de dados - Sistema de Gestão de Funcionários
-- Compatível com MySQL 8.0+
-- =====================================================================

USE gestao_funcionarios;


-- =====================================================================
-- PAIS
-- =====================================================================

INSERT INTO pais (id_pais, nome_pais)
VALUES
(1, 'Moçambique');


-- =====================================================================
-- PROVINCIA
-- =====================================================================

INSERT INTO provincia (id_provincia, nome_provincia, id_pais)
VALUES
(1, 'Maputo Cidade', 1),
(2, 'Maputo Província', 1),
(3, 'Gaza', 1),
(4, 'Inhambane', 1),
(5, 'Sofala', 1),
(6, 'Nampula', 1),
(7, 'Manica', 1),
(8, 'Tete', 1),
(9, 'Zambézia', 1),
(10, 'Cabo Delgado', 1);


-- =====================================================================
-- CIDADE
-- =====================================================================

INSERT INTO cidade (id_cidade, nome_cidade, id_provincia)
VALUES
(1, 'Maputo', 1),
(2, 'Matola', 2),
(3, 'Chókwè', 3),
(4, 'Maxixe', 4),
(5, 'Beira', 5),
(6, 'Nampula', 6),
(7, 'Chimoio', 7),
(8, 'Tete', 8),
(9, 'Quelimane', 9),
(10, 'Pemba', 10);


-- =====================================================================
-- CARGO
-- =====================================================================

INSERT INTO cargo (cod_cargo, nome_cargo)
VALUES
('C01', 'Técnico de Informática'),
('C02', 'Contabilista'),
('C03', 'Engenheiro Civil'),
('C04', 'Enfermeiro'),
('C05', 'Professor'),
('C06', 'Motorista'),
('C07', 'Gestor de Recursos Humanos'),
('C08', 'Assistente Administrativo');


-- =====================================================================
-- FUNCAO
-- =====================================================================

INSERT INTO funcao (cod_funcao, nome_funcao)
VALUES
('F01', 'Tecnologias de Informação'),
('F02', 'Finanças'),
('F03', 'Engenharia'),
('F04', 'Saúde'),
('F05', 'Educação'),
('F06', 'Logística'),
('F07', 'Recursos Humanos'),
('F08', 'Administração');


-- =====================================================================
-- POSTO_TRABALHO
-- =====================================================================

INSERT INTO posto_trabalho (id_posto, nome_posto)
VALUES
(1, 'Sede Maputo'),
(2, 'Delegação Matola'),
(3, 'Delegação Gaza'),
(4, 'Delegação Inhambane'),
(5, 'Delegação Beira'),
(6, 'Delegação Nampula'),
(7, 'Delegação Manica'),
(8, 'Delegação Tete'),
(9, 'Delegação Zambézia'),
(10, 'Delegação Cabo Delgado');


-- =====================================================================
-- FUNCIONARIO
-- =====================================================================

INSERT INTO funcionario
(
    nuit,
    nome,
    data_nascimento,
    bi,
    email,
    avenida_rua,
    numero_porta,
    bairro,
    id_cidade,
    cod_cargo,
    cod_funcao,
    id_posto,
    data_admissao
)
VALUES
(
    '100234567',
    'Amélia Fernanda Cossa',
    '1985-03-12',
    '110100123456A',
    'amelia.cossa@empresa.co.mz',
    'Av. Julius Nyerere',
    '245',
    'Sommerschield',
    1,
    'C01',
    'F01',
    1,
    '2015-02-05'
),
(
    '100345678',
    'Bernardo Alfredo Machava',
    '1979-07-22',
    '110100234567B',
    'bernardo.machava@empresa.co.mz',
    'Rua da Resistência',
    '8',
    'Polana Caniço8',
    1,
    'C02',
    'F02',
    1,
    '2010-09-14'
),
(
    '100456789',
    'Celina Armando Sitoe',
    '1990-11-03',
    '110200345678C',
    'celina.sitoe@empresa.co.mz',
    'Av. Samora Machel',
    '12',
    'Fomento',
    2,
    'C08',
    'F08',
    2,
    '2018-06-01'
),
(
    '100567890',
    'Domingos Paulo Nhantumbo',
    '1982-01-30',
    '110300456789D',
    'domingos.nhantumbo@empresa.co.mz',
    'Rua 3',
    '56',
    'Chókwè-Sede',
    3,
    'C06',
    'F06',
    3,
    '2012-03-10'
),
(
    '100678901',
    'Eugénia Marta Muchanga',
    '1988-05-18',
    '110400567890E',
    'eugenia.muchanga@empresa.co.mz',
    'Av. Eduardo Mondlane',
    '301',
    'Maxixe-Sede',
    4,
    'C04',
    'F04',
    4,
    '2016-08-20'
),
(
    '100789012',
    'Fernando José Macuácua',
    '1975-09-25',
    '110500678901F',
    'fernando.macuacua@empresa.co.mz',
    'Av. Poder Popular',
    '77',
    'Macuti',
    5,
    'C03',
    'F03',
    5,
    '2008-01-15'
),
(
    '100890123',
    'Graça Isabel Zunguze',
    '1992-12-07',
    '110600789012G',
    'graca.zunguze@empresa.co.mz',
    'Rua da Frescura',
    '19',
    'Ponta Gêa',
    5,
    'C05',
    'F05',
    5,
    '2019-02-02'
),
(
    '100901234',
    'Hélder António Cuamba',
    '1980-04-14',
    '110700890123H',
    'helder.cuamba@empresa.co.mz',
    'Av. 25 de Setembro',
    '150',
    'Alto Maé',
    1,
    'C07',
    'F07',
    1,
    '2011-11-11'
),
(
    '101012345',
    'Ivete Sara Chirindza',
    '1995-06-29',
    '110800901234I',
    'ivete.chirindza@empresa.co.mz',
    'Rua do Bagamoyo',
    '5',
    'Muhipiti',
    6,
    'C01',
    'F01',
    6,
    '2020-07-03'
),
(
    '101123456',
    'João Baptista Nhaca',
    '1978-08-09',
    '110900012345J',
    'joao.nhaca@empresa.co.mz',
    'Av. Josina Machel',
    '200',
    'Namahera',
    6,
    'C02',
    'F02',
    6,
    '2009-05-25'
),
(
    '101234567',
    'Lúcia Ermelinda Bila',
    '1991-02-16',
    '111000123456K',
    'lucia.bila@empresa.co.mz',
    'Rua da Base',
    '33',
    'Chaimite',
    5,
    'C08',
    'F08',
    5,
    '2017-09-19'
),
(
    '101345678',
    'Marcelino Inácio Tembe',
    '1983-10-21',
    '111100234567L',
    'marcelino.tembe@empresa.co.mz',
    'Av. Kwame Nkrumah',
    '410',
    'Coop',
    1,
    'C03',
    'F03',
    1,
    '2013-04-08'
),
(
    '101456789',
    'Noémia Alzira Massingue',
    '1987-03-04',
    '111200345678M',
    'noemia.massingue@empresa.co.mz',
    'Rua de Chimoio',
    '67',
    'Chingussura',
    7,
    'C04',
    'F04',
    7,
    '2014-12-12'
),
(
    '101567890',
    'Osvaldo Simião Ubisse',
    '1976-07-27',
    '111300456789N',
    'osvaldo.ubisse@empresa.co.mz',
    'Av. 7 de Setembro',
    '90',
    'Matundo',
    8,
    'C06',
    'F06',
    8,
    '2006-10-30'
),
(
    '101678901',
    'Paulina Fátima Uache',
    '1993-01-15',
    '111400567890O',
    'paulina.uache@empresa.co.mz',
    'Rua da Missão',
    '24',
    'Chalaua',
    9,
    'C05',
    'F05',
    9,
    '2021-09-09'
),
(
    '101789012',
    'Ricardo Manuel Come',
    '1981-06-02',
    '111500678901P',
    'ricardo.come@empresa.co.mz',
    'Av. Franqueza',
    '18',
    'Chuwaula',
    10,
    'C07',
    'F07',
    10,
    '2010-07-17'
);


-- =====================================================================
-- FUNCIONARIO_FILHO
-- =====================================================================

INSERT INTO funcionario_filho
(
    id_filho,
    nuit,
    nome_filho
)
VALUES
(1, '100234567', 'Cátia Cossa'),
(2, '100345678', 'Nelson Machava'),
(3, '100345678', 'Ivete Machava'),
(4, '100345678', 'Suzana Machava'),
(5, '100567890', 'Paulo Nhantumbo Jr'),
(6, '100567890', 'Alzira Nhantumbo'),
(7, '100678901', 'Marta Muchanga'),
(8, '100789012', 'José Macuácua'),
(9, '100789012', 'Beatriz Macuácua'),
(10, '100789012', 'Adriano Macuácua'),
(11, '100901234', 'António Cuamba Jr'),
(12, '100901234', 'Filomena Cuamba'),
(13, '101123456', 'Baptista Nhaca Jr'),
(14, '101234567', 'Ermelinda Bila'),
(15, '101345678', 'Inácio Tembe Jr'),
(16, '101345678', 'Rosa Tembe'),
(17, '101567890', 'Simião Ubisse Jr'),
(18, '101567890', 'Alcinda Ubisse'),
(19, '101567890', 'Custódio Ubisse'),
(20, '101789012', 'Manuel Come Jr');


-- =====================================================================
-- FUNCIONARIO_TELEFONE
-- =====================================================================

INSERT INTO funcionario_telefone
(
    id_telefone,
    nuit,
    numero_telefone
)
VALUES
(1, '100234567', '841234567'),
(2, '100234567', '821234567'),
(3, '100345678', '845678901'),
(4, '100456789', '861122334'),
(5, '100567890', '847890123'),
(6, '100567890', '878901234'),
(7, '100678901', '849012345'),
(8, '100789012', '823456789'),
(9, '100789012', '843456789'),
(10, '100789012', '863456789'),
(11, '100890123', '844567890'),
(12, '100890123', '824567890'),
(13, '100901234', '825678901'),
(14, '101012345', '846789012'),
(15, '101123456', '827890123'),
(16, '101123456', '847890124'),
(17, '101234567', '848901234'),
(18, '101345678', '829012345'),
(19, '101345678', '849012346'),
(20, '101345678', '869012347'),
(21, '101456789', '841122334'),
(22, '101567890', '822233445'),
(23, '101567890', '842233445'),
(24, '101678901', '843344556'),
(25, '101789012', '824455667'),
(26, '101789012', '844455667');


-- =====================================================================
-- VERIFICAÇÃO DOS DADOS
-- =====================================================================

SELECT * FROM pais;

SELECT * FROM provincia;

SELECT * FROM cidade;

SELECT * FROM cargo;

SELECT * FROM funcao;

SELECT * FROM posto_trabalho;

SELECT * FROM funcionario;

SELECT * FROM funcionario_filho;

SELECT * FROM funcionario_telefone;
