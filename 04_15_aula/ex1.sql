CREATE DOMAIN d_nomeProprio VARCHAR(40);
CREATE DOMAIN d_telefone VARCHAR(15);
CREATE DOMAIN d_moedas DECIMAL(15,2);


CREATE TABLE ingredientes(
    idIngrediente SERIAL PRIMARY KEY NOT NULL,
    unidadeMedida VARCHAR (10) NOT NULL,
    ingrediente VARCHAR (20) NOT NULL
    );


CREATE TABLE pizzarias(
    idPizzaria SERIAL PRIMARY KEY NOT NULL,
    nome d_nomeProprio NOT NULL,
    telefone d_telefone NOT NULL,
    endereco VARCHAR (50) NOT NULL
);



CREATE TABLE bairros (
    idBairro SERIAL  PRIMARY key not null,
    bairro VARCHAR(30) NOT NULL
    cidade VARCHAR (30) NOT NULL
    tempoEspera TIME    
);

CREATE TABLE pizzas (
    idPizza SERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR (40) NOT NULL
    endereco VARCHAR (100) NOT NULL,
    preco_peq DECIMAL NOT NULL,
    preco_med DECIMAL NOT NULL,
    preco_grd DECIMAL NOT NULL,
);

CREATE TABLE funcionarios(
    idFuncionarios SERIAL PRIMARY KEY NOT NULL,
    funcionario VARCHAR (40) NOT NULL,
    endereco VARCHAR (100) NOT NULL,
    cargo VARCHAR (15) NOT NULL,
    celular VARCHAR (15)
);
-- tabelas secundarias, possui atritubutos normais porém tem um relacionamento de dependencia com outra tabela, 

CREATE TABLE cardapios(
    idCardapio SERIAL PRIMARY KEY NOT NULL,
    descricao VARCHAR(15) NOT NULL,
    idPizzaria INTEGER NOT NULL, --FK
    FOREIGN KEY (idPizzaria) REFERENCES pizzarias(idPizzaria)
);

CREATE TABLE clientes(
    idCliente SERIAL PRIMARY KEY NOT NULL,
    cliente VARCHAR (40) NOT NULL,
    telefone_res VARCHAR(15),
    telefone_cml VARCHAR(15) ,
    telefone_cel VARCHAR (15) ,    
    logradouro VARCHAR (50),
    numero INTEGER,
    cep VARCHAR (8),
    complemento VARCHAR (40),
    idBairro INTEGER NOT NULL REFERENCES bairros
                                        (idBairro)
);

CREATE TABLE pedidos (
    idPedido SERIAL PRIMARY KEY NOT NULL,
    dataEmissao VARCHAR(15) NOT NULL,
    observacoes VARCHAR (100),
    idCliente INTEGER NOT NULL REFERENCES clientes
                                                (idCliente),
    idEmitente INTEGER NOT NULL REFERENCES funcionarios
                                                (idFuncionarios),
    idEntregador INTEGER NOT NULL REFERENCES funcionarios
                                                (idFuncionarios)
);

CREATE TABLE itens_pedidos(
    idItemPedido SERIAL PRIMARY KEY NOT NULL,
    tamanho INTEGER NOT NULL,
    quantidade NUMERIC (15,2)
    idPedido INTEGER NOT NULL REFERENCES pedidos
                                            (idPedidos)
    idPizza INTEGER NOT NULL REFERENCES pizzas
                                            (idPizza)

);
