
DROP TABLE categoria CASCADE CONSTRAINTS;

DROP TABLE cidade CASCADE CONSTRAINTS;

DROP TABLE cliente CASCADE CONSTRAINTS;

DROP TABLE consumo CASCADE CONSTRAINTS;

DROP TABLE consumo_item CASCADE CONSTRAINTS;

DROP TABLE hospedagem CASCADE CONSTRAINTS;

DROP TABLE prod_serv CASCADE CONSTRAINTS;

DROP TABLE quarto CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE categoria (
    cat_cod          NUMBER(10) NOT NULL,
    cat_nome         VARCHAR2(30) NOT NULL,
    cat_valor_diaria NUMBER(12, 2) NOT NULL
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( cat_cod );

CREATE TABLE cidade (
    cid_cod  NUMBER(10) NOT NULL,
    cid_nome VARCHAR2(120) NOT NULL,
    cid_uf   VARCHAR2(2) NOT NULL
);

ALTER TABLE cidade ADD CONSTRAINT cidade_pk PRIMARY KEY ( cid_cod );

CREATE TABLE cliente (
    cli_cod       NUMBER(10) NOT NULL,
    cli_cpf       VARCHAR2(11) NOT NULL,
    cli_rg        VARCHAR2(25),
    cli_data_nasc DATE NOT NULL,
    cli_nome      VARCHAR2(120) NOT NULL,
    cli_endereco  VARCHAR2(120),
    cli_cep       VARCHAR2(8),
    cli_bairro    VARCHAR2(30),
    cli_compl     VARCHAR2(30),
    cid_cod       NUMBER(10) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( cli_cod );

CREATE TABLE consumo (
    con_cod  NUMBER(10) NOT NULL,
    con_data DATE,
    hosp_cod NUMBER(10) NOT NULL
);

ALTER TABLE consumo ADD CONSTRAINT consumo_pk PRIMARY KEY ( con_cod );
