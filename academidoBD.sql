CREATE DATABASE academicoBD;

use academicoBD;

CREATE TABLE instituicoes(
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) not null,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT inst_email_uq UNIQUE (email),
    PRIMARY KEY (id)
);

ALTER TABLE instituicoes
ADD uf char(2) DEFAULT 'RJ';

CREATE TABLE professores(
    prof_matr INT(6),
    prof_nome VARCHAR(100) NOT NULL,
    prof_email VARCHAR(150) NOT NULL,
    CONSTRAINT prof_email_uq UNIQUE (prof_email),
    prof_salario, int(18,2),
    CONSTRAINT prof_sql_ck CHECK (prof_salario > 700.00),
    PRIMARY KEY (prof_matr)  
);

ALTER TABLE professores
ADD dia INT,
ADD mesAniver INT;

DESCRIBE professores;

ALTER TABLE professores
ADD CONSTRAINT prof_chk CHECK (dia >= 1 AND dia <= 31 AND mesAniver >=1 AND <=13);

ALTER TABLE professores
ADD prof_cep VARCHAR(9);

