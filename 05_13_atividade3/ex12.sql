-- BD-I-ARTHUR-GRANDI-EX012-SQL-DDL.sql
--012.CLUBE DE DANÇAS DE SALÃO- ARTHUR GRANDI E KENZO-RÁ

-- Tabela para armazenar informações sobre os instrutores
CREATE TABLE Instrutores (
    instrutor_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(20) NOT NULL -- Tipo de instrutor: "integral" ou "parcial"
);

-- Tabela para armazenar informações sobre os estudantes
CREATE TABLE Estudantes (
    estudante_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela para armazenar informações sobre as aulas
CREATE TABLE Aulas (
    aula_id SERIAL PRIMARY KEY,
    instrutor_id INT NOT NULL,
    tipo VARCHAR(20) NOT NULL, -- Tipo de aula: individual ou em grupo
    data DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    FOREIGN KEY (instrutor_id) REFERENCES Instrutores(instrutor_id)
);

-- Tabela para armazenar informações sobre a participação dos estudantes nas aulas
CREATE TABLE Participacao (
    participacao_id SERIAL PRIMARY KEY,
    estudante_id INT NOT NULL,
    aula_id INT NOT NULL,
    FOREIGN KEY (estudante_id) REFERENCES Estudantes(estudante_id),
    FOREIGN KEY (aula_id) REFERENCES Aulas(aula_id)
);