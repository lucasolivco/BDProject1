CREATE DATABASE bancoDB;

USE bancoDB;

CREATE TABLE Contas (
    id int(11) NOT NULL AUTO_INCREMENT,
    idCliente int(11) NOT NULL,
    tipo varchar(20) NOT NULL,
    saldo DOUBLE NOT NULL,
    limite DOUBLE not null,
    primary key (id),
    CONSTRAINT Clientes_fk FOREIGN KEY(idCliente) REFERENCES Cliente(id)

);

-- Inserindo os dados de exemplo
INSERT INTO Contas (id, idCliente, tipo, saldo, limite) 
VALUES (1, 3, 'corrente comum', 3000, 1000),
(2, 1, 'poupança', 2000, 100),
(3, 2, 'corrente especial', 2500, 1500);

-- Modificar o limite da conta corrente comum para 2000
UPDATE Contas SET limite=2000 WHERE id=1;

-- Modificar o saldo da conta poupança para 4000
UPDATE Contas SET saldo=4000 WHERE id=2;

-- Assumindo que temos uma tabela 'cliente' com um campo 'nome'
-- Primeiro, vamos encontrar o ID do cliente Rosen
SET @id_rosen = (SELECT id FROM cliente WHERE nome = 'Rosen');

-- Agora, vamos atualizar a conta Corrente Especial para ter o idCliente do Rosen
UPDATE Contas
SET idCliente = @id_rosen
WHERE tipo = 'Corrente Especial';

ALTER TABLE Turma 
ADD COLUMN tur_email VARCHAR(100);

ALTER TABLE aluno
ADD COLUMN alu_whatsapp VARCHAR(14),
ADD COLUMN alu_email VARCHAR(100);

SELECT nome, email FROM Clientes  WHERE uf='RJ';

SELECT num, idCliente, saldo, limite FROM Contas WHERE saldo<=limite;


