CREATE TABLE CLIENTES (
    IdCliente INTEGER PRIMARY KEY,
    Nome VARCHAR(50),
    Telefone VARCHAR(15),
    Logradouro VARCHAR(50),
    Numero VARCHAR(5),
    Cidade VARCHAR(50),
    Bairro VARCHAR(50),
    Complemento VARCHAR(50),
    Estado VARCHAR(50)
);

CREATE TABLE FUNCIONÁRIOS (
    IdFuncionario INTEGER PRIMARY KEY,
    Nome VARCHAR(50),
    Cargo VARCHAR(50),
    Departamento VARCHAR(50)
);

CREATE TABLE PEDIDOS (
    IdPedido INTEGER PRIMARY KEY,
    Data DATE,
    Cliente INTEGER,
    Status VARCHAR(15),
    IdFuncionario INTEGER,
    FOREIGN KEY (IdFuncionario) REFERENCES FUNCIONÁRIOS(IdFuncionario) ON DELETE CASCADE,
    FOREIGN KEY (Cliente) REFERENCES CLIENTES(IdCliente) ON DELETE CASCADE
);

CREATE TABLE FORNECEDORES (
    IdFornecedor INTEGER PRIMARY KEY,
    Nome VARCHAR(50),
    Telefone VARCHAR(50),
    Produto_fornecido VARCHAR(50)
);

CREATE TABLE PRODUTOS (
    IdProduto INTEGER PRIMARY KEY,
    Nome VARCHAR(50),
    Descricao VARCHAR(50), -- Corrigido de "Descrição" para "Descricao"
    Preco DECIMAL,
    Estoque VARCHAR(100),
    IdItemPedido INTEGER,
    FOREIGN KEY (IdItemPedido) REFERENCES ITENS_PEDIDOS(IdItemPedido) ON DELETE SET NULL
);

CREATE TABLE TRANSPORTADORAS (
    IdTransportadoras INTEGER PRIMARY KEY,
    Telefone VARCHAR(15),
    Cnpj VARCHAR(14),
    Nome VARCHAR(50),
    Logradouro VARCHAR(50),
    Numero VARCHAR(5),
    Cidade VARCHAR(50),
    Bairro VARCHAR(50),
    Complemento VARCHAR(50),
    Estado VARCHAR(50)
);

CREATE TABLE ITENS_PEDIDOS (
    Tamanho VARCHAR(15),
    Quantidade DECIMAL,
    IdItemPedido INTEGER PRIMARY KEY,
    IdPedido INTEGER,
    IdProduto INTEGER,
    FOREIGN KEY (IdPedido) REFERENCES PEDIDOS(IdPedido) ON DELETE CASCADE,
    FOREIGN KEY (IdProduto) REFERENCES PRODUTOS(IdProduto) ON DELETE CASCADE
);

CREATE TABLE fornecem (
    IdFornecedor INTEGER,
    IdProduto INTEGER,
    PRIMARY KEY (IdFornecedor, IdProduto),
    FOREIGN KEY (IdFornecedor) REFERENCES FORNECEDORES(IdFornecedor) ON DELETE RESTRICT,
    FOREIGN KEY (IdProduto) REFERENCES PRODUTOS(IdProduto) ON DELETE SET NULL
);

CREATE TABLE entregam (
    IdPedido INTEGER,
    IdTransportadoras INTEGER,
    PRIMARY KEY (IdPedido, IdTransportadoras),
    FOREIGN KEY (IdPedido) REFERENCES PEDIDOS(IdPedido) ON DELETE SET NULL,
    FOREIGN KEY (IdTransportadoras) REFERENCES TRANSPORTADORAS(IdTransportadoras) ON DELETE SET NULL
);

-- CLIENTES
INSERT INTO CLIENTES (Nome, Telefone, Logradouro, Numero, Cidade, Bairro, Complemento, Estado)
VALUES
    ('Maria Silva', '31987654321', 'Rua das Flores', '123', 'Belo Horizonte', 'Centro', 'Apto 101', 'MG'),
    ('João Santos', '11987654321', 'Avenida Brasil', '456', 'São Paulo', 'Vila Madalena', 'Casa 2', 'SP'),
    ('Ana Oliveira', '21987654321', 'Rua da Praia', '789', 'Rio de Janeiro', 'Copacabana', 'Sala 3', 'RJ'),
    ('Pedro Almeida', '31987654322', 'Rua das Palmeiras', '456', 'Salvador', 'Barra', 'Apto 501', 'BA'),
    ('Carla Ferreira', '21987654323', 'Avenida das Américas', '987', 'Niterói', 'Icaraí', 'Casa 1', 'RJ'),
    ('Lucas Oliveira', '41987654324', 'Rua das Mangueiras', '321', 'Brasília', 'Asa Sul', 'Apto 201', 'DF');

-- FUNCIONÁRIOS
INSERT INTO FUNCIONÁRIOS (Nome, Cargo, Departamento)
VALUES
    ('Paula Lima', 'Gerente', 'Administração'),
    ('Marcos Santos', 'Vendedor', 'Vendas'),
    ('Fernanda Oliveira', 'Analista', 'TI'),
    ('Rafael Souza', 'Atendente', 'Atendimento'),
    ('Juliana Silva', 'Supervisor', 'Produção'),
    ('Rodrigo Mendes', 'Coordenador', 'Logística');

-- FORNECEDORES
INSERT INTO FORNECEDORES (Nome, Telefone, Produto_fornecido)
VALUES
    ('Fornecedor A', '11987654321', 'Produtos A'),
    ('Fornecedor B', '21987654321', 'Produtos B'),
    ('Fornecedor C', '31987654321', 'Produtos C'),
    ('Fornecedor D', '41987654321', 'Produtos D'),
    ('Fornecedor E', '51987654321', 'Produtos E'),
    ('Fornecedor F', '61987654321', 'Produtos F');

-- TRANSPORTADORAS
INSERT INTO TRANSPORTADORAS (Telefone, Cnpj, Nome, Logradouro, Numero, Cidade, Bairro, Complemento, Estado)
VALUES
    ('21987654321', '01234567890123', 'Transportadora X', 'Rua das Árvores', '123', 'São Paulo', 'Centro', 'Sala 101', 'SP'),
    ('31987654321', '98765432109876', 'Transportadora Y', 'Avenida das Flores', '456', 'Rio de Janeiro', 'Copacabana', 'Apto 202', 'RJ'),
    ('41987654321', '76543210987654', 'Transportadora Z', 'Rua dos Santos', '789', 'Belo Horizonte', 'Barreiro', 'Casa 3', 'MG'),
    ('51987654321', '54321098765432', 'Transportadora W', 'Avenida das Palmeiras', '987', 'Salvador', 'Pituba', 'Apto 401', 'BA'),
    ('61987654321', '32109876543210', 'Transportadora V', 'Rua dos Coqueiros', '234', 'Brasília', 'Asa Norte', 'Apto 102', 'DF'),
    ('71987654321', '10987654321098', 'Transportadora U', 'Avenida dos Lírios', '567', 'Curitiba', 'Centro', 'Casa 2', 'PR');

SELECT * FROM Clientes;