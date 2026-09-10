-- =====================================================================
-- 03_queries_exemplo.sql
-- Queries de exemplo com JOIN
-- Reconstituicao da informacao original a partir do esquema
-- normalizado (4FN)
--
-- Trabalho II - Normalizacao de Base de Dados
-- Universidade Licungo
--
-- COMPATIVEL COM MYSQL
-- =====================================================================


-- =====================================================================
-- QUERY 1
-- Ficha completa do funcionario
-- =====================================================================

SELECT
    fu.nuit,
    fu.nome,
    fu.data_nascimento,
    fu.bi,
    fu.email,

    CONCAT(
        fu.avenida_rua,
        ', n.º ',
        fu.numero_porta,
        ', ',
        fu.bairro
    ) AS endereco_completo,

    ci.nome_cidade AS cidade,
    pr.nome_provincia AS provincia,
    pa.nome_pais AS pais,

    ca.cod_cargo,
    ca.nome_cargo AS cargo,

    fn.cod_funcao,
    fn.nome_funcao AS funcao,

    pt.nome_posto AS posto_trabalho,

    fu.data_admissao

FROM funcionario AS fu

INNER JOIN cidade AS ci
    ON ci.id_cidade = fu.id_cidade

INNER JOIN provincia AS pr
    ON pr.id_provincia = ci.id_provincia

INNER JOIN pais AS pa
    ON pa.id_pais = pr.id_pais

INNER JOIN cargo AS ca
    ON ca.cod_cargo = fu.cod_cargo

INNER JOIN funcao AS fn
    ON fn.cod_funcao = fu.cod_funcao

INNER JOIN posto_trabalho AS pt
    ON pt.id_posto = fu.id_posto

ORDER BY fu.nome ASC;


-- =====================================================================
-- QUERY 2
-- Funcionarios e respetivos filhos
-- =====================================================================

SELECT
    fu.nuit,
    fu.nome AS nome_funcionario,
    ff.nome_filho

FROM funcionario AS fu

INNER JOIN funcionario_filho AS ff
    ON ff.nuit = fu.nuit

ORDER BY
    fu.nome ASC,
    ff.id_filho ASC;


-- =====================================================================
-- QUERY 3
-- Funcionarios e respetivos contactos telefonicos
-- =====================================================================

SELECT
    fu.nuit,
    fu.nome AS nome_funcionario,
    ft.numero_telefone

FROM funcionario AS fu

INNER JOIN funcionario_telefone AS ft
    ON ft.nuit = fu.nuit

ORDER BY
    fu.nome ASC,
    ft.id_telefone ASC;


-- =====================================================================
-- QUERY 4
-- RECONSTITUICAO DA FOLHA ORIGINAL
-- =====================================================================
--
-- Esta consulta apresenta novamente:
--
-- Filho 1
-- Filho 2
-- Filho 3
--
-- Celular 1
-- Celular 2
-- Celular 3
--
-- sem utilizar WITH ou ROW_NUMBER().
--
-- Isso permite maior compatibilidade com diferentes versoes
-- do MySQL e evita a multiplicacao de linhas entre filhos
-- e telefones.
-- =====================================================================

SELECT

    -- ================================================================
    -- DADOS PESSOAIS
    -- ================================================================

    fu.nome,
    fu.data_nascimento,
    fu.nuit,
    fu.bi,
    fu.email,

    -- ================================================================
    -- ENDERECO
    -- ================================================================

    CONCAT(
        fu.avenida_rua,
        ', n.º ',
        fu.numero_porta,
        ', ',
        fu.bairro
    ) AS endereco,

    -- ================================================================
    -- LOCALIZACAO
    -- ================================================================

    ci.nome_cidade AS cidade,
    pr.nome_provincia AS provincia,
    pa.nome_pais AS pais,

    -- ================================================================
    -- DADOS PROFISSIONAIS
    -- ================================================================

    ca.nome_cargo AS cargo,
    fu.cod_cargo,

    fn.nome_funcao AS funcao,
    fu.cod_funcao,

    pt.nome_posto AS posto_trabalho,

    fu.data_admissao,

    -- ================================================================
    -- FILHO 1
    -- ================================================================

    (
        SELECT ff.nome_filho
        FROM funcionario_filho AS ff
        WHERE ff.nuit = fu.nuit
        ORDER BY ff.id_filho ASC
        LIMIT 1 OFFSET 0
    ) AS filho_1,

    -- ================================================================
    -- FILHO 2
    -- ================================================================

    (
        SELECT ff.nome_filho
        FROM funcionario_filho AS ff
        WHERE ff.nuit = fu.nuit
        ORDER BY ff.id_filho ASC
        LIMIT 1 OFFSET 1
    ) AS filho_2,

    -- ================================================================
    -- FILHO 3
    -- ================================================================

    (
        SELECT ff.nome_filho
        FROM funcionario_filho AS ff
        WHERE ff.nuit = fu.nuit
        ORDER BY ff.id_filho ASC
        LIMIT 1 OFFSET 2
    ) AS filho_3,

    -- ================================================================
    -- CELULAR 1
    -- ================================================================

    (
        SELECT ft.numero_telefone
        FROM funcionario_telefone AS ft
        WHERE ft.nuit = fu.nuit
        ORDER BY ft.id_telefone ASC
        LIMIT 1 OFFSET 0
    ) AS celular_1,

    -- ================================================================
    -- CELULAR 2
    -- ================================================================

    (
        SELECT ft.numero_telefone
        FROM funcionario_telefone AS ft
        WHERE ft.nuit = fu.nuit
        ORDER BY ft.id_telefone ASC
        LIMIT 1 OFFSET 1
    ) AS celular_2,

    -- ================================================================
    -- CELULAR 3
    -- ================================================================

    (
        SELECT ft.numero_telefone
        FROM funcionario_telefone AS ft
        WHERE ft.nuit = fu.nuit
        ORDER BY ft.id_telefone ASC
        LIMIT 1 OFFSET 2
    ) AS celular_3

FROM funcionario AS fu

-- ================================================================
-- LOCALIZACAO
-- ================================================================

INNER JOIN cidade AS ci
    ON ci.id_cidade = fu.id_cidade

INNER JOIN provincia AS pr
    ON pr.id_provincia = ci.id_provincia

INNER JOIN pais AS pa
    ON pa.id_pais = pr.id_pais

-- ================================================================
-- DADOS PROFISSIONAIS
-- ================================================================

INNER JOIN cargo AS ca
    ON ca.cod_cargo = fu.cod_cargo

INNER JOIN funcao AS fn
    ON fn.cod_funcao = fu.cod_funcao

INNER JOIN posto_trabalho AS pt
    ON pt.id_posto = fu.id_posto

ORDER BY fu.nome ASC;


-- =====================================================================
-- QUERY 5 (BONUS)
-- Numero de funcionarios por cargo e posto de trabalho
-- =====================================================================

SELECT
    pt.nome_posto,
    ca.nome_cargo,
    COUNT(*) AS total_funcionarios

FROM funcionario AS fu

INNER JOIN cargo AS ca
    ON ca.cod_cargo = fu.cod_cargo

INNER JOIN posto_trabalho AS pt
    ON pt.id_posto = fu.id_posto

GROUP BY
    pt.nome_posto,
    ca.nome_cargo

ORDER BY
    pt.nome_posto ASC,
    ca.nome_cargo ASC;
