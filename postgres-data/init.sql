CREATE SCHEMA api;

-- CRIAÇÃO DA TABELA PRODUTOS(/PRODUTO)
CREATE TABLE api.produto (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  descricao TEXT,
  criadoEm TIMESTAMPTZ,
  isEstoque BOOLEAN NOT NULL DEFAULT false
);

-- INSERÇÃO DE DADOS NA TABELA PRODUTOS(/PRODUTO)
INSERT INTO api.produto (nome, descricao, criadoEm, isEstoque)
VALUES ('Camisa Polo', 'Camisa casual de algodão', NOW(), true);

INSERT INTO api.produto (nome, descricao, criadoEm, isEstoque)
VALUES ('Notebook Lenovo', 'Notebook com processador i7 e 16GB RAM, ideal para trabalho e entretenimento.', NOW(), true);

INSERT INTO api.produto (nome, criadoEm, isEstoque)
VALUES ('Lápis HB #2', NOW(), true);

INSERT INTO api.produto (nome, descricao, criadoEm, isEstoque)
VALUES ('Fone de Ouvido Bluetooth', 'Fone sem fio com cancelamento de ruído', '2024-05-27 10:30:00', true);

INSERT INTO api.produto (nome, descricao, criadoEm, isEstoque)
VALUES ('Mochila Escolar', 'Mochila resistente para estudantes', NOW(), false);

INSERT INTO api.produto (nome, descricao, criadoEm, isEstoque)
VALUES ('Caneta Esferográfica', 'Caneta de tinta azul, ótima para escrita suave', NOW(), true);

INSERT INTO api.produto (nome, descricao, criadoEm, isEstoque)
VALUES ('Sapatênis Masculino em Couro Legítimo', 'Calçado casual masculino feito com couro legítimo e solado de borracha', NOW(), true);

INSERT INTO api.produto (nome, descricao, criadoEm, isEstoque)
VALUES ('Garrafa Térmica', 'Garrafa térmica de aço inoxidável com capacidade para 1 litro', '2024-03-15 08:00:00', true);

INSERT INTO api.produto (nome, isEstoque)
VALUES ('Cadeira de Escritório Ergonômica', true);

INSERT INTO api.produto (nome, descricao, criadoEm, isEstoque)
VALUES ('Mouse Sem Fio', '', DEFAULT, true);

-- ROLE PARA ACESSO ANÔNIMO
CREATE ROLE web_anon nologin; -- PERMISSÃO READ-ONLY
GRANT usage ON SCHEMA api TO web_anon; -- DÁ ACESSO AOS OBJETOS DO ESQUEMA [API]
GRANT SELECT ON api.produto TO web_anon; -- DÁ ACESSO A LEITURA DO REGISTRO DA TABELA [PRODUTO]

-- PERMISSÕES PARA INSERT
GRANT INSERT ON api.produto TO web_anon;
GRANT usage ON SEQUENCE api.produto_id_seq TO web_anon;
GRANT SELECT ON api.produto TO web_anon;

-- PERMISSÕES PARA UPDATE
GRANT UPDATE ON api.produto TO web_anon;

-- PERMISSÕES PARA DELETE
GRANT DELETE ON api.produto TO web_anon;

-- ROLE PERFIL PARA AUTENTICAÇÃO PARA NÃO USAR O USUÁRIO ROOT
CREATE ROLE usuario noinherit LOGIN PASSWORD 'senha';
GRANT web_anon TO usuario;
