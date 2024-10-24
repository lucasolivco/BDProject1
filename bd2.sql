CREATE TABLE persons (
    id INT NOT NULL,
    lastName varchar(255) NOT NULL,
    firstName varchar(255) NOT NULL,
    Age int,
    City varchar(255),
'ADICIONA REGRAS NAS COLUNAS QUE VOCE QUISER DA TABELA'
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

