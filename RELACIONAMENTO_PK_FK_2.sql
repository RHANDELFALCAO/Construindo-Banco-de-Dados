CREATE TABLE festa_infantil.aluguel_tema ( 
	id                   INTEGER   NOT NULL,
	id_tema              INTEGER   ,
	id_aluguel           INTEGER   ,
	CONSTRAINT pk_aluguel_tema PRIMARY KEY ( id ),
	CONSTRAINT unq_aluguel_tema_id_aluguel UNIQUE ( id_aluguel ) 
 );
 
 CREATE TABLE festa_infantil.tema ( 
	id                   INTEGER   NOT NULL,
	nome                 VARCHAR(100)   NOT NULL,
	valor                NUMERIC(18,2)   ,
	CONSTRAINT pk_tema PRIMARY KEY ( id )
 );

CREATE TABLE festa_infantil.tema_itens ( 
	id                   INTEGER   NOT NULL,
	id_tema              INTEGER   ,
	id_itens             INTEGER   ,
	CONSTRAINT pk_tema_itens PRIMARY KEY ( id )
 );
 
 CREATE TABLE festa_infantil.itens ( 
	id                   INTEGER   NOT NULL,
	nome                 VARCHAR(100)   NOT NULL,
	CONSTRAINT pk_itens PRIMARY KEY ( id )
 );

CREATE TABLE festa_infantil.aluguel ( 
	id                   INTEGER   NOT NULL,
	data_hora_inicio     TIMESTAMP   NOT NULL,
	data_hora_fim        TIMESTAMP   NOT NULL,
	id_endereco          INTEGER   ,
	id_cliente           INTEGER   ,
	desconto             NUMERIC(18,2)   ,
	CONSTRAINT pk_aluguel PRIMARY KEY ( id )
 );
 
 CREATE TABLE festa_infantil.cliente ( 
	id                   INTEGER   NOT NULL,
	nome                 VARCHAR(100)   NOT NULL,
	data_cadastro        DATE   NOT NULL,
	rg                   VARCHAR(100)   NOT NULL,
	cpf                  VARCHAR(100)   NOT NULL,
	id_endereco          INTEGER   ,
	CONSTRAINT pk_tbl PRIMARY KEY ( id ),
	CONSTRAINT unq_cliente_id_endereco UNIQUE ( id_endereco ) 
 );

CREATE TABLE festa_infantil.tipo_contato_cliente ( 
	id                   INTEGER   NOT NULL,
	id_tipo_contato      INTEGER   ,
	id_cliente           INTEGER   ,
	valor                VARCHAR(100)   NOT NULL,
	CONSTRAINT pk_tipo_contato_cliente PRIMARY KEY ( id )
 );
 
 CREATE TABLE festa_infantil.tipo_contato ( 
	id                   INTEGER   NOT NULL,
	nome                 VARCHAR(100)   NOT NULL,
	CONSTRAINT pk_tipo_contato PRIMARY KEY ( id )
 );

CREATE TABLE festa_infantil.endereco ( 
	id                   INTEGER   NOT NULL,
	logradouro           VARCHAR(100)   NOT NULL,
	numero               VARCHAR(100)   NOT NULL,
	cep                  VARCHAR(100)   NOT NULL,
	complemento          VARCHAR(100)   ,
	id_bairro            INTEGER   ,
	CONSTRAINT pk_endereco PRIMARY KEY ( id ),
	CONSTRAINT unq_endereco_id_bairro UNIQUE ( id_bairro ) 
 );
 
 CREATE TABLE festa_infantil.bairro ( 
	id                   INTEGER   NOT NULL,
	nome                 VARCHAR(100)   NOT NULL,
	id_cidade            INTEGER   ,
	CONSTRAINT pk_bairro PRIMARY KEY ( id )
 );
 
 CREATE TABLE festa_infantil.cidade ( 
	id                   INTEGER   NOT NULL,
	nome                 VARCHAR(100)   NOT NULL,
	id_estado            INTEGER   ,
	CONSTRAINT pk_cidade PRIMARY KEY ( id )
 );

CREATE TABLE festa_infantil.estado ( 
	id                   INTEGER   NOT NULL,
	sigla                VARCHAR(100)   NOT NULL,
	nome                 VARCHAR(100)   NOT NULL,
	CONSTRAINT pk_estado PRIMARY KEY ( id )
 );
 
 ALTER TABLE festa_infantil.aluguel_tema ADD CONSTRAINT fk_aluguel_tema_aluguel FOREIGN KEY ( id_aluguel ) REFERENCES festa_infantil.aluguel( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE festa_infantil.aluguel_tema ADD CONSTRAINT fk_aluguel_tema_tema FOREIGN KEY ( id_tema ) REFERENCES festa_infantil.tema( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE festa_infantil.tema_itens ADD CONSTRAINT fk_tema_itens_tema FOREIGN KEY ( id_tema ) REFERENCES festa_infantil.tema( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE festa_infantil.tema_itens ADD CONSTRAINT fk_tema_itens_itens FOREIGN KEY ( id_itens ) REFERENCES festa_infantil.itens( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE festa_infantil.aluguel ADD CONSTRAINT fk_aluguel_cliente FOREIGN KEY ( id_cliente ) REFERENCES festa_infantil.cliente( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE festa_infantil.aluguel ADD CONSTRAINT fk_aluguel_endereco FOREIGN KEY ( id_endereco ) REFERENCES festa_infantil.endereco( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE festa_infantil.cliente ADD CONSTRAINT fk_cliente_endereco FOREIGN KEY ( id_endereco ) REFERENCES festa_infantil.endereco( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE festa_infantil.tipo_contato_cliente ADD CONSTRAINT fk_tipo_contato_cliente_cliente FOREIGN KEY ( id_cliente ) REFERENCES festa_infantil.cliente( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE festa_infantil.tipo_contato_cliente ADD CONSTRAINT fk_tipo_contato_cliente_tipo_contato FOREIGN KEY ( id_tipo_contato ) REFERENCES festa_infantil.tipo_contato( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE festa_infantil.endereco ADD CONSTRAINT fk_endereco_bairro FOREIGN KEY ( id_bairro ) REFERENCES festa_infantil.bairro( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE festa_infantil.bairro ADD CONSTRAINT fk_bairro_cidade FOREIGN KEY ( id_cidade ) REFERENCES festa_infantil.cidade( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE festa_infantil.cidade ADD CONSTRAINT fk_cidade_estado FOREIGN KEY ( id_estado ) REFERENCES festa_infantil.estado( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;



