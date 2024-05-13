-06.DEPARTAMENTO DE VENDAS-

-- Tabela para armazenar informações sobre as regiões de venda
CREATE TABLE Regioes (
    regiao_id SERIAL PRIMARY KEY,
    codigo_regiao VARCHAR(10) UNIQUE NOT NULL
);

-- Tabela para armazenar informações sobre os pontos estratégicos das regiões
CREATE TABLE PontosEstrategicos (
    ponto_id SERIAL PRIMARY KEY,
    regiao_id INT NOT NULL,
    nome_ponto VARCHAR(100) NOT NULL,
    FOREIGN KEY (regiao_id) REFERENCES Regioes(regiao_id)
);

-- Tabela para armazenar informações sobre os vendedores
CREATE TABLE Vendedores (
    vendedor_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela para armazenar informações sobre os veículos
CREATE TABLE Veiculos (
    veiculo_id SERIAL PRIMARY KEY,
    placa VARCHAR(10) UNIQUE NOT NULL
);

-- Tabela para armazenar informações sobre os percursos dos vendedores
CREATE TABLE Percursos (
    percurso_id SERIAL PRIMARY KEY,
    regiao_id INT NOT NULL,
    ponto_id INT NOT NULL,
    vendedor_id INT NOT NULL,
    veiculo_id INT NOT NULL,
    data DATE NOT NULL,
    FOREIGN KEY (regiao_id) REFERENCES Regioes(regiao_id),
    FOREIGN KEY (ponto_id) REFERENCES PontosEstrategicos(ponto_id),
    FOREIGN KEY (vendedor_id) REFERENCES Vendedores(vendedor_id),
    FOREIGN KEY (veiculo_id) REFERENCES Veiculos(veiculo_id)
);

-- Tabela para armazenar informações sobre os produtos
CREATE TABLE Produtos (
    produto_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela para armazenar informações sobre as vendas
CREATE TABLE Vendas (
    venda_id SERIAL PRIMARY KEY,
    vendedor_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    cliente_identificacao VARCHAR(100) NOT NULL,
    nota_fiscal VARCHAR(100) NOT NULL,
    FOREIGN KEY (vendedor_id) REFERENCES Vendedores(vendedor_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);
