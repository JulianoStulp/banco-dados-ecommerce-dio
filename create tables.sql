-- CRIANDO DATABASE
DROP DATABASE ECOMMERCE;
CREATE DATABASE ECOMMERCE;
USE ECOMMERCE;

-- CRIACAO DE TABELA CLIENTE
CREATE TABLE CLIENTE(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NOME VARCHAR(20) NOT NULL,
SOBRENOME VARCHAR(20) NOT NULL,
CPF CHAR(11) NOT NULL,
ENDERECO VARCHAR(45),
DATA_NASCIMENTO DATE,
CONSTRAINT CLIENTE_UK UNIQUE (CPF)
);
ALTER TABLE CLIENTE AUTO_INCREMENT = 1;

-- CRIACAO DE TABELA PRODUTO
CREATE TABLE PRODUTO(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
DESCRICAO VARCHAR(250),
PRECO_UNITARIO FLOAT NOT NULL,
CATEGORIA ENUM('ELETRONICO','MOVEIS','ROUPAS') NOT NULL
);
ALTER TABLE PRODUTO AUTO_INCREMENT = 1;

-- CRIACAO DE TABELA PEDIDO
CREATE TABLE PEDIDO(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
CLIENTE_ID INT NOT NULL,
DESCRICAO VARCHAR(250) NOT NULL,
STATUS ENUM('EM ANDAMENTO', 'EM PROCESSAMENTO', 'FATURADO') DEFAULT 'EM PROCESSAMENTO',
VALOR_TOTAL FLOAT NOT NULL DEFAULT 0,
FRETE VARCHAR(10),
CONSTRAINT PEDIDO_FK0 FOREIGN KEY (CLIENTE_ID) REFERENCES CLIENTE(ID)
);
ALTER TABLE PEDIDO AUTO_INCREMENT = 1;

-- CRIACAO DE TABELA PEDIDO ITEM
CREATE TABLE PEDIDO_ITEM(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
PEDIDO_ID INT NOT NULL,
PRODUTO_ID INT NOT NULL,
QUANTIDADE FLOAT NOT NULL,
CONSTRAINT PEDIDO_ITEM_FK0 FOREIGN KEY (PEDIDO_ID) REFERENCES PEDIDO(ID),
CONSTRAINT PEDIDO_ITEM_FK1 FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTO(ID)
);
ALTER TABLE PEDIDO_ITEM AUTO_INCREMENT = 1;

-- CRIACAO DE TABELA ESTOQUE
CREATE TABLE ESTOQUE(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
DESCRICAO VARCHAR(250) NOT NULL
);
ALTER TABLE ESTOQUE AUTO_INCREMENT = 1;

-- CRIACAO DE TABELA ESTOQUE PRODUTO 
CREATE TABLE PRODUTO_ESTOQUE(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ESTOQUE_ID INT NOT NULL,
PRODUTO_ID INT NOT NULL,
QUANTIDADE FLOAT NOT NULL,
CONSTRAINT PRODUTO_ESTOQUE_FK0 FOREIGN KEY (ESTOQUE_ID) REFERENCES ESTOQUE(ID),
CONSTRAINT PRODUTO_ESTOQUE_FK1 FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTO(ID)
);
ALTER TABLE PRODUTO_ESTOQUE AUTO_INCREMENT = 1;

-- CRIACAO DE TABELA FORNECEDOR
CREATE TABLE FORNECEDOR(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
DESCRICAO VARCHAR(250) NOT NULL,
CNPJ CHAR(15) NOT NULL,
CONSTRAINT FORNECEDOR_UK UNIQUE (CNPJ)
);
ALTER TABLE FORNECEDOR AUTO_INCREMENT = 1;

-- CRIACAO DE TABELA VENDEDOR
CREATE TABLE VENDEDOR(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
DESCRICAO VARCHAR(250) NOT NULL,
ENDERECO VARCHAR(250),
COMISSAO FLOAT
);
ALTER TABLE VENDEDOR AUTO_INCREMENT = 1;

-- CRIACAO DE TABELA PRODUTO VENDEDOR
CREATE TABLE PRODUTO_VENDEDOR(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
PRODUTO_ID INT NOT NULL,
VENDEDOR_ID INT NOT NULL,
QUANTIDADE FLOAT NOT NULL,
CONSTRAINT PRODUTO_VENDEDOR_FK0 FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTO(ID),
CONSTRAINT PRODUTO_VENDEDOR_FK1 FOREIGN KEY (VENDEDOR_ID) REFERENCES VENDEDOR(ID)
);
ALTER TABLE PRODUTO_VENDEDOR AUTO_INCREMENT = 1;

-- CRIACAO DE TABELA PRODUTO FORNCEDOR
CREATE TABLE PRODUTO_FORNECEDOR(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
PRODUTO_ID INT NOT NULL,
FORNECEDOR_ID INT NOT NULL,
QUANTIDADE FLOAT NOT NULL,
CONSTRAINT PRODUTO_FORNECEDOR_FK0 FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTO(ID),
CONSTRAINT PRODUTO_FORNECEDOR_FK1 FOREIGN KEY (FORNECEDOR_ID) REFERENCES FORNECEDOR(ID)
);
ALTER TABLE PRODUTO_FORNECEDOR AUTO_INCREMENT = 1;