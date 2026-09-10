# Normalização de Base de Dados — Sistema de Gestão de Funcionários

**Trabalho II · Normalização de Base de Dados**
Universidade Licungo — Faculdade de Ciências e Tecnologias
Curso de Licenciatura em Informática

## Objetivo

Este repositório contém a análise e a normalização progressiva (0FN → 1FN → 2FN → 3FN → 4FN) da tabela de dados de funcionários de uma empresa moçambicana, atualmente mantida numa única folha de cálculo (16 registos), culminando num esquema relacional normalizado, no respetivo Modelo Entidade-Relacionamento (MER) e nos scripts SQL de criação e consulta.

## Estrutura do repositório

```
.
├── README.md
├── documentos/
│   └── Analise_Normalizacao_Funcionarios.docx   # Relatório completo (0FN → 4FN, cardinalidades, MER, SQL)
├── diagramas/
│   ├── mer_funcionarios.png                     # Diagrama MER (imagem, alta resolução)
│   ├── mer_funcionarios.svg                     # Diagrama MER (vetorial)
│   ├── mer_funcionarios.dot                     # Código-fonte Graphviz do diagrama
│   └── mer_funcionarios.mmd                      # Mesmo diagrama em sintaxe Mermaid (erDiagram)
└── sql/
    ├── 01_ddl_criacao_tabelas.sql                # CREATE TABLE das 9 tabelas (PK, FK, UNIQUE)
    ├── 02_dml_insercao_dados.sql                 # INSERT com os dados reais dos 16 funcionários
    └── 03_queries_exemplo.sql                    # 5 queries de exemplo (JOIN), incl. reconstituição total
```

## Como consultar cada artefacto

1. **Análise completa (documentos/Analise_Normalizacao_Funcionarios.docx)** — começa aqui. Contém:
   - Secção 2 — identificação dos problemas da tabela original (dados não atómicos, grupos repetitivos, dependências parciais/transitivas/multivaloradas);
   - Secções 3–6 — 1FN, 2FN, 3FN e 4FN aplicadas passo a passo, com as tabelas resultantes de cada fase;
   - Secção 7 — resumo do esquema relacional final (9 tabelas);
   - Secção 8 — cardinalidades de cada relacionamento;
   - Secção 9 — Modelo Entidade-Relacionamento (MER);
   - Secção 10 — scripts SQL (extratos comentados).

2. **Scripts SQL (sql/)** — testados e validados de ponta-a-ponta (schema + dados + queries) antes da entrega. Para experimentar localmente (exemplo com SQLite):
   ```bash
   sqlite3 funcionarios.db < sql/01_ddl_criacao_tabelas.sql
   sqlite3 funcionarios.db < sql/02_dml_insercao_dados.sql
   sqlite3 funcionarios.db < sql/03_queries_exemplo.sql
   ```
   Para PostgreSQL ou MySQL, os mesmos três ficheiros podem ser executados por ordem (`psql -f ...` / `mysql < ...`); a sintaxe usada (CREATE TABLE, CONSTRAINT, ROW_NUMBER(), CTE) é compatível com PostgreSQL ≥ 13 e MySQL ≥ 8.

## Resumo do esquema final (4FN)

| Tabela | Chave primária | Chaves estrangeiras |
|---|---|---|
| `pais` | id_pais | — |
| `provincia` | id_provincia | id_pais → pais |
| `cidade` | id_cidade | id_provincia → provincia |
| `cargo` | cod_cargo | — |
| `funcao` | cod_funcao | — |
| `posto_trabalho` | id_posto | — |
| `funcionario` | nuit | id_cidade, cod_cargo, cod_funcao, id_posto |
| `funcionario_filho` | id_filho | nuit → funcionario |
| `funcionario_telefone` | id_telefone | nuit → funcionario |

Todos os relacionamentos do esquema são **1:N** (ver justificação na secção 8 do relatório).

## Ferramentas utilizadas

- **Python** (pandas / openpyxl) — leitura e extração dos dados da folha de cálculo original.
- **SQLite** — validação end-to-end do esquema, da carga de dados e das queries.
- **Graphviz** — construção do Modelo Entidade-Relacionamento.
- **Microsoft Word (.docx)** — relatório final.

## Autor

Noé Samuel Vilanculos — Curso de Licenciatura em Informática, Universidade Licungo.

## VIDEO DE EXPLICACAO (YOUTUBE)

https://www.youtube.com/watch?v=Cs_cuI5X1QE
