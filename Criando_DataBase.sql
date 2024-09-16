CREATE DATABASE digital;

CREATE SCHEMA rh;

---"IF NOT EXISTS" CRIA UMA A TABELA DESDE QUE NO SCHEMA RH NÃO TENHA UMA TABELA COM O NOME "PESSOA"---
CREATE TABLE IF NOT EXISTS rh.pessoa
(id serial,
nome character varying,
cpf character varying,
email character varying,
nascimento date,
renda numeric(18,2),
casa_propria boolean,
CONSTRAINT pessoa_pkey PRIMARY KEY (id));

---INSERIR DADOS NA TABELA PESSOA---
INSERT INTO rh.pessoa (nome, cpf, email, nascimento, renda, casa_propria)
VALUES ('Pedro', '123654789321', 'pedro@digital.com', '1990-01-01', 2450.75, true),
('Maria', '98745632124', 'maria@digital.com', '1989-01-01', 4500.50, false);

INSERT INTO rh.pessoa (nome, cpf, email, nascimento, renda, casa_propria)
VALUES ('Enzo', '548516487785', 'enzo@digital.com', '2007-05-23', 600.75, false),
('Lua', '95123657895', 'lua@digital.com', '2009-02-16', 150.20, false);

---CRIANDO A TABELA 'ESTADO' DENTRO DO ESQUEMA RH---
CREATE TABLE IF NOT EXISTS rh.estado
(id serial,
sigla character varying,
nome character varying,
CONSTRAINT estado_pkey PRIMARY KEY (id));

---INSERINDO DADOS NA TABELO ESTADO. LEMBRANDO QUE COMO FOI COLOCADO O "id serial" NÃO TEM NECESSIDADE DE INSERIR O ID---
INSERT INTO rh.estado (sigla, nome)
VALUES ('AC', 'Acre'),
('AL', 'Alagoas'),
('AP', 'Amapá'),
('AM', 'Amazonas'),
('BA', 'Bahia'),
('CE', 'Ceará'),
('DF', 'Distrito Federal'),
('ES', 'Espírito Santo'),
('GO', 'Goiás'),
('MA', 'Maranhão'),
('MT', 'Mato Grosso'),
('MS', 'Mato Grosso do Sul'),
('MG', 'Minas Gerais'),
('PA', 'Pará'),
('PB', 'Paraíba'),
('PR', 'Paraná'),
('PE', 'Pernambuco'),
('PI', 'Piauí'),
('RJ', 'Rio de Janeiro'),
('RN', 'Rio Grande do Norte'),
('RS', 'Rio Grande do Sul'),
('RO', 'Rondônia'),
('RR', 'Roraima'),
('SC', 'Santa Catarina'),
('SP', 'São Paulo'),
('SE', 'Sergipe'),
('TO', 'Tocantins');

---CRIANDO TABELA REGIAO---
CREATE TABLE IF NOT EXISTS public.regiao
(id serial NOT NULL,
nome character varying,
CONSTRAINT regiao_pkey PRIMARY KEY (id));

---CRIANDO NOVA TABELA DE DEPARTAMENTO UTILIZANDO ALÉM DA CHAVE PRIMÁRIA, A CHAVE ESTRAGEIRA LINKANDO COM A TABELA REGIAO---
CREATE TABLE IF NOT EXISTS public.departamento
(id serial NOT NULL,
nome character varying,
id_regiao integer,
CONSTRAINT departamento_pkey PRIMARY KEY (id),
CONSTRAINT departamento_id_regiao_fkey FOREIGN KEY (id_regiao) 
	REFERENCES public.regiao (id));

---INSERINDO OS DADOS NA TABELA REGIAO---
INSERT INTO public.regiao (id, nome)
VALUES (1, 'Norte'),
		(2, 'Centro'),
		(3, 'Sul');

---INSERINDO OS DADOS NA TABELA DEPARTAMENTO---
INSERT INTO public.departamento (id, nome, id_regiao)
VALUES (10, 'Vendas', 1),
		(20, 'Operações', 1),
		(30, 'Administrativo', 2),
		(40, 'Financeiro', 3);
