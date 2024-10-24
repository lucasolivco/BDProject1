--ALUNO: Lucas de Oliveira Costa

CREATE DATABASE IF NOT EXISTS bancoDB;

USE bancoDB;

CREATE TABLE Contas (
    id INT(11) NOT NULL AUTO_INCREMENT,
    idCliente INT(11) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    saldo DOUBLE NOT NULL,
    limite DOUBLE NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT Clientes_fk FOREIGN KEY(idCliente) REFERENCES Cliente(id)
);

-- Inserindo os dados de exemplo
INSERT INTO Contas (idCliente, tipo, limite, saldo) VALUES
(3, 'Corrente Comum', 1000, 3000),
(1, 'Poupança', 100, 2000),
(2, 'Corrente Especial', 1500, 2500);



-- Modificar o limite da conta corrente comum para 2000
UPDATE Contas
SET limite = 2000
WHERE tipo = 'Corrente Comum';

-- Modificar o saldo da conta poupança para 4000
UPDATE Contas
SET saldo = 4000
WHERE tipo = 'Poupança';

-- Assumindo que temos uma tabela 'cliente' com um campo 'nome'
-- Primeiro, vamos encontrar o ID do cliente Rosen
SET @id_rosen = (SELECT id FROM cliente WHERE nome = 'Rosen');

-- Agora, vamos atualizar a conta Corrente Especial para ter o idCliente do Rosen
UPDATE Contas
SET idCliente = @id_rosen
WHERE tipo = 'Corrente Especial';

-- Para verificar as mudanças, podemos usar:
SELECT c.id, cl.nome AS nome_cliente, c.tipo, c.limite, c.saldo
FROM Contas c
JOIN cliente cl ON c.idCliente = cl.id;

--Atualiza o limite da conta corrente comum para 200.
--Atualiza o saldo da conta poupança para 4000.
--Encontra o ID do cliente chamado Rosen na tabela cliente.
--Atualiza o idCliente da conta Corrente Especial para o ID do Rosen.
--Faz uma consulta para mostrar os resultados após as modificações.
--Este código assume que existe uma tabela cliente com campos id e nome.
--Também assume que existe um cliente chamado "Rosen" na tabela cliente.
--A última consulta (SELECT) junta as tabelas Contas e cliente para mostrar o nome do cliente junto com os detalhes da conta.


-- Criar a tabela instituicoes se ela não existir
CREATE TABLE instituicoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    uf CHAR(2)
);

-- Inserir os registros
INSERT INTO instituicoes (id, nome, email, uf) VALUES
(1, 'XPTO', 'xpto@email.com', 'BA'),
(2, 'House Software', 'housesoft@hack.mail.com', 'RJ'),
(3, 'Movies Studios', 'mv@films.org', 'RS'),
(4, 'Enhancements Worker', 'workerenhancements@mail.com', 'SP');

-- Verificar os registros inseridos
SELECT * FROM instituicoes;

-- Modificar a UF e o email da instituição XPTO
UPDATE instituicoes
SET uf = 'CE', email = 'xptoce@mail.net'
WHERE nome = 'XPTO';

-- Verificar a modificação
SELECT * FROM instituicoes WHERE nome = 'XPTO';

-- Mostrar todos os registros após as modificações
SELECT * FROM instituicoes;

--Cria a tabela instituicoes se ela ainda não existir.
--Insere os quatro registros fornecidos na tabela.
--Atualiza o registro da instituição XPTO, mudando a UF para CE e o email para xptoce@mail.net.
--Faz consultas para verificar as inserções e modificações.
--Após executar este código, a tabela instituicoes terá os seguintes dados:
--XPTO, xptoce@mail.net, CE
--House Software, housesoft@hack.mail.com, RJ
--Movies Studios, mv@films.org, RS
--Enhancements Worker, workerenhancements@mail.com, SP

-- Criar o banco de dados
CREATE DATABASE academico;

-- Usar o banco de dados
USE academico;

-- Criar a tabela instituicoes
CREATE TABLE instituicoes (
    ins_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ins_nome VARCHAR(45) NOT NULL,
    ins_telefone VARCHAR(14) NOT NULL
);

-- Criar a tabela cursos
CREATE TABLE cursos (
    cur_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cur_nome VARCHAR(45) NOT NULL,
    cur_instituicao INT NOT NULL,
    CONSTRAINT institu_fk FOREIGN KEY (cur_instituicao) REFERENCES instituicoes(ins_id)
);

-- Criar a tabela turmas
CREATE TABLE turmas (
    tur_cod INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tur_identificacao VARCHAR(10) NOT NULL,
    tur_ano INT NOT NULL,
    tur_semestre INT NOT NULL,
    tur_curso INT NOT NULL,
    CONSTRAINT curso_fk FOREIGN KEY (tur_curso) REFERENCES cursos(cur_id)
);

-- Criar a tabela alunos
CREATE TABLE alunos (
    alu_id INT PRIMARY KEY AUTO_INCREMENT,
    alu_nome VARCHAR(45) NOT NULL,
    alu_numero INT NOT NULL,
    alu_matricula INT NOT NULL
);

-- Criar a tabela matricula
CREATE TABLE matricula (
    mat_ano INT NOT NULL,
    mat_semestre INT NOT NULL,
    mat_aluno INT,
    mat_turma INT,
    PRIMARY KEY (mat_ano, mat_semestre),
    CONSTRAINT alunoMat_fk FOREIGN KEY (mat_aluno) REFERENCES alunos(alu_id),
    CONSTRAINT turmaMat_fk FOREIGN KEY (mat_turma) REFERENCES turmas(tur_cod)
);

--Cria o banco de dados "academico"
--Seleciona o banco de dados "academico" para uso.
--Cria a tabela "instituicoes" com os campos especificados.
--Cria a tabela "cursos" com uma chave estrangeira referenciando "instituicoes".
--Cria a tabela "turmas" com uma chave estrangeira referenciando "cursos".
--Cria a tabela "alunos" com os campos especificados.
--Cria a tabela "matricula" como uma tabela de junção entre "alunos" e "turmas", com chaves estrangeiras apropriadas.
--As chaves primárias foram definidas de acordo com o diagrama (campos marcados com chave amarela).

USE academico;

-- Adicionar campo email à tabela turmas
ALTER TABLE turmas
ADD COLUMN tur_email VARCHAR(100);

-- Adicionar campos whatsapp e email à tabela alunos
ALTER TABLE alunos
ADD COLUMN alu_whatsapp VARCHAR(14),
ADD COLUMN alu_email VARCHAR(100);

-- Modificar o campo semestre em turmas e matricula para aceitar apenas 1, 2 ou 3
ALTER TABLE turmas
MODIFY COLUMN tur_semestre ENUM('1', '2', '3') COMMENT '1: primeiro semestre, 2: segundo semestre, 3: anual';

ALTER TABLE matricula
MODIFY COLUMN mat_semestre ENUM('1', '2', '3') COMMENT '1: primeiro semestre, 2: segundo semestre, 3: anual';

-- Inserir dados de exemplo (assumindo que já temos instituições e cursos cadastrados)

-- Inserir instituições de exemplo
INSERT INTO instituicoes (ins_id, ins_nome, ins_telefone) VALUES
(1, 'Minha Instituição', '1234567890'),
(2, 'Outra Instituição', '9876543210');

-- Inserir cursos de exemplo
INSERT INTO cursos (cur_id, cur_nome, cur_instituicao) VALUES
(1, 'Meu Curso', 1),
(2, 'Outro Curso', 1),
(3, 'Curso de Outra Instituição', 2);

-- Inserir turmas de exemplo
INSERT INTO turmas (tur_cod, tur_identificacao, tur_ano, tur_semestre, tur_curso, tur_email) VALUES
(1, 'Turma A', 2024, '1', 1, 'turmaA@email.com'),
(2, 'Turma B', 2024, '1', 2, 'turmaB@email.com'),
(3, 'Turma C', 2024, '1', 3, 'turmaC@email.com');

-- Inserir alunos
INSERT INTO alunos (alu_id, alu_nome, alu_numero, alu_matricula, alu_whatsapp, alu_email) VALUES
-- Dois alunos da minha turma
(1, 'João da Silva', 1001, 20240001, '11987654321', 'joao@email.com'),
(2, 'Maria Souza', 1002, 20240002, '11976543210', 'maria@email.com'),
-- Dois alunos de uma turma diferente da minha, mas da mesma instituição
(3, 'Pedro Santos', 2001, 20240003, '11965432109', 'pedro@email.com'),
(4, 'Ana Oliveira', 2002, 20240004, '11954321098', 'ana@email.com'),
-- Dois alunos de uma instituição diferente
(5, 'Carlos Ferreira', 3001, 20240005, '11943210987', 'carlos@email.com'),
(6, 'Beatriz Lima', 3002, 20240006, '11932109876', 'beatriz@email.com');

-- Inserir matrículas
INSERT INTO matricula (mat_ano, mat_semestre, mat_aluno, mat_turma) VALUES
(2024, '1', 1, 1),
(2024, '1', 2, 1),
(2024, '1', 3, 2),
(2024, '1', 4, 2),
(2024, '1', 5, 3),
(2024, '1', 6, 3);


--Listar o nome e o email de todos os clientes que residem no estado do Rio de Janeiro:
SELECT nome, email
FROM clientes
WHERE estado = 'RJ';

--Listar o número da conta, o cliente, o saldo e o limite de todas as contas cujo saldo seja menor ou igual ao limite:
SELECT c.id AS numero_conta, cl.nome AS cliente, c.saldo, c.limite
FROM Contas c
JOIN clientes cl ON c.idCliente = cl.id
WHERE c.saldo <= c.limite;

--Listar o nome e o email de todos os clientes que fazem aniversário no primeiro semestre do ano:
SELECT nome, email
FROM clientes
WHERE MONTH(data_nascimento) BETWEEN 1 AND 6;

--Listar o nome da agência e o número do banco de todas as agências que possuam a letra A em seu nome:
SELECT nome_agencia, numero_banco
FROM agencias
WHERE nome_agencia LIKE '%A%';

--Listar o nome, o telefone e o banco de todas as agências cujo DDD esteja entre 21 e 29:
SELECT nome_agencia, telefone, numero_banco
FROM agencias
WHERE SUBSTRING(telefone, 2, 2) BETWEEN '21' AND '29';

--Para a consulta 1, assumimos que existe uma tabela clientes com colunas nome, email e estado.
--Para a consulta 2, usamos a tabela Contas que sabemos que existe, e assumimos uma junção com uma tabela clientes.
--Para a consulta 3, assumimos que existe uma coluna data_nascimento na tabela clientes.
--Para as consultas 4 e 5, assumimos que existe uma tabela agencias com as colunas necessárias.
--Na consulta 5, a função SUBSTRING é usada para extrair o DDD do número de telefone, assumindo que o telefone está no formato (XX)XXXX-XXXX.

--Listar o nome do cliente e o valor de todas as transações realizadas por ele:
SELECT c.nome AS nome_cliente, t.valor
FROM clientes c
JOIN Contas co ON c.id = co.idCliente
JOIN transacoes t ON co.id = t.id_conta;

--Listar o nome do cliente, o nome da transação, a data da transação e o valor de cada transação:
SELECT c.nome AS nome_cliente, tt.nome AS nome_transacao, t.data, t.valor
FROM clientes c
JOIN Contas co ON c.id = co.idCliente
JOIN transacoes t ON co.id = t.id_conta
JOIN tipos_transacao tt ON t.id_tipo = tt.id;

--Listar a data, o valor e o nome do tipo de cada transação realizada no mês de setembro de 2019:
SELECT t.data, t.valor, tt.nome AS tipo_transacao
FROM transacoes t
JOIN tipos_transacao tt ON t.id_tipo = tt.id
WHERE YEAR(t.data) = 2019 AND MONTH(t.data) = 9;

--Listar o nome do cliente, o tipo de sua conta, o valor das transações e o nome do tipo de cada transação, considerando apenas os clientes do estado no Rio de Janeiro e cujo saldo seja superior ao limite:
SELECT c.nome AS nome_cliente, co.tipo AS tipo_conta, t.valor, tt.nome AS tipo_transacao
FROM clientes c
JOIN Contas co ON c.id = co.idCliente
JOIN transacoes t ON co.id = t.id_conta
JOIN tipos_transacao tt ON t.id_tipo = tt.id
WHERE c.estado = 'RJ' AND co.saldo > co.limite;

--Estas consultas assumem a existência das seguintes tabelas:
--clientes: com colunas como id, nome, estado
--Contas: com colunas como id, idCliente, tipo, saldo, limite
--transacoes: com colunas como id, id_conta, id_tipo, data, valor
--tipos_transacao: com colunas como id, nome
