-- BANCO DE DADOS DA PIZZARIA

-- DOMAINS
CREATE DOMAIN d_nomeProprio VARCHAR (40);
CREATE DOMAIN d_moeda DECIMAL (15,2);
CREATE DOMAIN d_telefone VARCHAR (15);

-- TABELAS PRIMARIAS (

CREATE TABLE ingredientes (
    idIngredientes SERIAL PRIMARY KEY NOT NULL,
    unidadeMedia VARCHAR(10) NOT NULL,
    ingrediente VARCHAR(20) NOT NULL
);

CREATE TABLE pizzarias(
    idPizzaria SERIAL PRIMARY KEY NOT NULL,
    nome d_nomeProprio NOT NULL,
    telefone d_telefone NOT NULL,
    endereço VARCHAR(50) NOT NULL
);

CREATE TABLE pizza(
    idpizza SERIAL PRIMARY KEY NOT NULL,
    nome_pizza VARCHAR(20) NOT NULL,
    preco_peq DECIMAL(5,2) NOT NULL,
    preco_med DECIMAL(5,2) NOT NULL,
    preco_grd DECIMAL(5,2) NOT NULL
);

-- )

-- funcionarios

-- TABELAS SECUNDARIAS (

CREATE TABLE cardapios(
    idCardapio SERIAL PRIMARY KEY NOT NULL,
    descricao VARCHAR(15) NOT NULL,
    idPizzaria INTEGER NOT NULL,
        FOREIGN KEY(idPizzaria)REFERENCES pizzarias(idPizzaria)
);

CREATE TABLE bairros(
    idBairro SERIAL PRIMARY KEY NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    ciadade VARCHAR(30) NOT NULL,
    tempoEspera TIME NOT NULL
);

-- )

-- TABELA DE RELACIONAMENTO (

CREATE TABLE ingredientesPizza (
    idPizza INTEGER NOT NULL,
    idIngrediente INTEGER NOT NULL,
    quantidade DECIMAL ( 15,2 ) NOT NULL,
    PRIMARY KEY ( idPizza, idIngrediente ),
    FOREIGN KEY ( idPizza ) REFERENCES pizza ( idPizza ),
    FOREIGN KEY ( idIngrediente ) REFERENCES ingredientes ( idIngredientes )
);

-- )

INSERT INTO pizzarias (nome, endereço, telefone)
    VALUES ('kenzo HAHAHA', 'Monte Bonete 232', '47 99202-7666');
	
SELECT * FROM pizzarias;

-- ALTER pizzarias SET endereco = 'rua principal, 200', telefone = '47 33334444'
--     WHERE idPizzaria = 3;

-- DELETE pizzarias
--     WHERE idPizzaria = 4;

-- UPDATE tabela SET campo_1 = 'valor_novo',... campo_n = 'valor_novo'
-- WHERE campo_chave = valor;

-- DELETE FROM tabela
--      WHERE campo_chave = valor;

-- SELECT * FROM TABLE;