CREATE TABLE public.cliente ( 
	id                   INTEGER   NOT NULL,
	nome                 VARCHAR(100)   NOT NULL,
	data_cadastro        DATE   NOT NULL,
	cod_cliente          VARCHAR(100)   NOT NULL,
	cpf                  VARCHAR(100)   NOT NULL,
	rg                   VARCHAR(100)   NOT NULL,
	id_genero            INTEGER   ,
	id_endereco          INTEGER   ,
	CONSTRAINT pk_cliente PRIMARY KEY ( id )
 );
 
 CREATE TABLE public.genero ( 
	id                   INTEGER   NOT NULL,
	nome                 VARCHAR(100)   NOT NULL,
	CONSTRAINT pk_genero PRIMARY KEY ( id )
 );

CREATE TABLE public.loja_cliente ( 
	id                   INTEGER   NOT NULL,
	id_cliente           INTEGER   ,
	id_loja              INTEGER   ,
	CONSTRAINT pk_loja_cliente PRIMARY KEY ( id )
 );

 CREATE TABLE public.loja ( 
	id                   INTEGER   NOT NULL,
	nome                 VARCHAR(100)   NOT NULL,
	cod_loja             VARCHAR(100)   NOT NULL,
	id_endereco          INTEGER   ,
	CONSTRAINT pk_loja PRIMARY KEY ( id )
 );
 
 CREATE TABLE public.endereco ( 
	id                   INTEGER   NOT NULL,
	logradouro           VARCHAR(100)   NOT NULL,
	cep                  VARCHAR(100)   NOT NULL,
	numero               VARCHAR(100)   NOT NULL,
	id_bairro            INTEGER   ,
	CONSTRAINT pk_endereco PRIMARY KEY ( id )
 );
 
 CREATE TABLE public.tipo_contato_cliente ( 
	id                   INTEGER   NOT NULL,
	descricao            VARCHAR(100)   NOT NULL,
	id_tipo_contato      INTEGER   ,
	id_cliente           INTEGER   ,
	CONSTRAINT pk_tipo_contrato_cliente PRIMARY KEY ( id )
 );
 
 CREATE TABLE public.tipo_contato ( 
	id                   INTEGER   NOT NULL,
	nome                 VARCHAR(100)   NOT NULL,
	CONSTRAINT pk_tipo_contato PRIMARY KEY ( id )
 );
 
 CREATE TABLE public.bairro ( 
	id                   INTEGER   NOT NULL,
	nome                 VARCHAR(100)   NOT NULL,
	id_cidade            INTEGER   ,
	CONSTRAINT pk_bairro PRIMARY KEY ( id )
 );

CREATE TABLE public.cidade ( 
	id                   INTEGER   NOT NULL,
	nome                 VARCHAR(100)   NOT NULL,
	id_estado            INTEGER   ,
	CONSTRAINT pk_cidade PRIMARY KEY ( id )
 );

CREATE TABLE public.estado ( 
	id                   INTEGER   NOT NULL,
	nome                 VARCHAR(100)   NOT NULL,
	CONSTRAINT pk_estado PRIMARY KEY ( id )
 );

 
ALTER TABLE public.cliente ADD CONSTRAINT fk_cliente_genero FOREIGN KEY ( id_genero ) REFERENCES public.genero( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.cliente ADD CONSTRAINT fk_cliente_endereco FOREIGN KEY ( id_endereco ) REFERENCES public.endereco( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.loja_cliente ADD CONSTRAINT fk_loja_cliente_cliente FOREIGN KEY ( id_cliente ) REFERENCES public.cliente( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.loja_cliente ADD CONSTRAINT fk_loja_cliente_loja FOREIGN KEY ( id_loja ) REFERENCES public.loja( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.loja ADD CONSTRAINT fk_loja_endereco FOREIGN KEY ( id_endereco ) REFERENCES public.endereco( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.endereco ADD CONSTRAINT fk_endereco_bairro FOREIGN KEY ( id_bairro ) REFERENCES public.bairro( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.tipo_contato_cliente ADD CONSTRAINT fk_tipo_contato_cliente_tipo_contato FOREIGN KEY ( id_tipo_contato ) REFERENCES public.tipo_contato( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.tipo_contato_cliente ADD CONSTRAINT fk_tipo_contato_cliente_cliente FOREIGN KEY ( id_cliente ) REFERENCES public.cliente( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.bairro ADD CONSTRAINT fk_bairro_cidade FOREIGN KEY ( id_cidade ) REFERENCES public.cidade( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE public.cidade ADD CONSTRAINT fk_cidade_estado FOREIGN KEY ( id_estado ) REFERENCES public.estado( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

