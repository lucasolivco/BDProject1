create database bancodb;

use bancodb;

create table Bancos(
     numero int NOT NULL AUTO_ICCREMENT,
     nome varchar(100)

);

CREATE TABLE Agencias(
     numero varchar(100) NOT NULL AUTO_INCREMENT,
     nome varchar(100),
     telefone int,
     primary key (numero)
);

CREATE TABLE Clientes(
    id INT(11) NOT NULL AUTO_INCREMENT,
    nome varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    PRIMARY KEY (id)
   
);

'lista as tabelas'
show tables;

'lista estrutura da tabela'
describe Clientes;

'lista conteudo da tabela'
SELECT * FROM Clientes;

'ADICIONAR NOVA COLUNA uf A TABELA CLIENTES com valor padrão RJ '
ALTER TABLE Clientes
ADD uf char(2) default 'RJ';

ALTER TABLE Clientes
ADD dia char(2),
ADD mes char(2);

ALTER TABLE Clientes
MODIFY dia INT,
MODIFY mes INT;

DESCRIBE Clientes;
'CREATE' TABLE Clientes(
    id INT(11) NOT NULL AUTO_INCREMENT,
    nome varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    dia char(2),
    mes char(2),
    PRIMARY KEY (id)
    
);

'adicionar regra nas colunas que quiser'
ALTER TABLE Clientes
ADD CONSTRAINT CHK_Clientes CHECK (dia >=1 AND dia <=31 AND mes >=1 AND mes <=12);

'mudar nome da coluna'
ALTER TABLE Clientes
CHANGE nome nameee varchar(100);

'apagar coluna'
ALTER TABLE Clientes
DROP email;

ALTER TABLE Clientes
RENAME parceiros;

'apaga tabela'
DROP TABLE Clientes;

ALTER TABLE PRODUTOS
MODIFY UNIDADES VARCHAR(255) DEFAULT 'unidades';













