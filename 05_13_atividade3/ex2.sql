
- 02.BIBLIOTECA-

-- Tabela Livro
CREATE TABLE Livro (
    ID SERIAL PRIMARY KEY,
    Titulo VARCHAR(255),
    ISBN VARCHAR(13),
    Ano_Publicacao INTEGER,
    ID_Categoria INTEGER,
    ID_Autor INTEGER,
    ID_Editora INTEGER,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID),
    FOREIGN KEY (ID_Autor) REFERENCES Autor(ID),
    FOREIGN KEY (ID_Editora) REFERENCES Editora(ID)
);

-- Tabela Categoria
CREATE TABLE Categoria (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(100)
);

-- Tabela Estante
CREATE TABLE Estante (
    ID SERIAL PRIMARY KEY,
    Localizacao VARCHAR(100),
    Capacidade_Maxima INTEGER
);

-- Tabela Autor
CREATE TABLE Autor (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255)
);

-- Tabela Editora
CREATE TABLE Editora (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255)
);

-- Tabela Bibliotecária
CREATE TABLE Bibliotecaria (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    Cargo VARCHAR(100),
    ID_Estante INTEGER,
    FOREIGN KEY (ID_Estante) REFERENCES Estante(ID)
);

-- Tabela Cliente
CREATE TABLE Cliente (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Empréstimo INTEGER,
    FOREIGN KEY (ID_Empréstimo) REFERENCES Emprestimo(ID)
);

-- Tabela Empréstimo
CREATE TABLE Emprestimo (
    ID SERIAL PRIMARY KEY,
    ID_Livro INTEGER,
    ID_Cliente INTEGER,
    Data_Emprestimo DATE,
    Data_Devolucao DATE,
    Valor_Multa NUMERIC(10,2),
    ID_Bibliotecaria INTEGER,
    FOREIGN KEY (ID_Livro) REFERENCES Livro(ID),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID),
    FOREIGN KEY (ID_Bibliotecaria) REFERENCES Bibliotecaria(ID)
);

-- Tabela Estagiária
CREATE TABLE Estagiaria (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Bibliotecaria_Efetiva INTEGER,
    FOREIGN KEY (ID_Bibliotecaria_Efetiva) REFERENCES Bibliotecaria(ID)
);

-- Tabela Instituicao_Ensino
CREATE TABLE Instituicao_Ensino (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255)
);

