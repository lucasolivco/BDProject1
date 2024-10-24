CREATE DATABASE bancodb3;

USE bancodb3;

CREATE TABLE Cliente (
    id INT(11) NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE contas (
    id INT(11) NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(20) NOT NULL,
    saldo DOUBLE NOT NULL,
    limite DOUBLE NOT NULL,
    idCliente INT(11) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT Clientes_fk FOREIGN KEY(idCliente) REFERENCES Cliente(id)
    
);

INSERT INTO contas(id, idCliente, tipo, limite, saldo) VALUES(1, 3, 'corrente comum', 1000, 3000);

UPDATE contas SET limite=2000 WHERE id=1;  

UPDATE contas SET saldo=4000 WHERE id=2;