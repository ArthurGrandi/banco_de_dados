-04.CONTROLE DE EMPRESTIMOS DE CDs-

-- Tabela para armazenar informações sobre os artistas
CREATE TABLE Artistas (
    artista_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ano_origem INT,
    local_origem VARCHAR(100),
    genero VARCHAR(50),
    descricao TEXT
);

-- Tabela para armazenar informações sobre os músicos de influência
CREATE TABLE MusicosInfluencia (
    musico_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES Artistas(artista_id)
);

-- Tabela para armazenar informações sobre os CDs
CREATE TABLE CDs (
    cd_id SERIAL PRIMARY KEY,
    artista_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    num_cds INT,
    categoria VARCHAR(50),
    FOREIGN KEY (artista_id) REFERENCES Artistas(artista_id)
);

-- Tabela para armazenar informações sobre as músicas
CREATE TABLE Musicas (
    musica_id SERIAL PRIMARY KEY,
    cd_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    gravacao_ao_vivo BOOLEAN,
    artista_coletanea_id INT,
    FOREIGN KEY (cd_id) REFERENCES CDs(cd_id),
    FOREIGN KEY (artista_coletanea_id) REFERENCES Artistas(artista_id)
);

-- Tabela para armazenar informações sobre os empréstimos de CDs
CREATE TABLE Emprestimos (
    emprestimo_id SERIAL PRIMARY KEY,
    cd_id INT NOT NULL,
    pessoa_retirou VARCHAR(100) NOT NULL,
    data_retirada DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (cd_id) REFERENCES CDs(cd_id)
);

