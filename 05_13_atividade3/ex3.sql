-03.RESERVA DE PASSAGENS AÉREAS-

-- Tabela para armazenar informações sobre os passageiros
CREATE TABLE Passageiros (
    passageiro_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela para armazenar informações sobre os aeroportos
CREATE TABLE Aeroportos (
    aeroporto_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela para armazenar informações sobre os voos
CREATE TABLE Voos (
    voo_id SERIAL PRIMARY KEY,
    codigo VARCHAR(10) UNIQUE NOT NULL,
    origem_id INT NOT NULL,
    destino_id INT NOT NULL,
    FOREIGN KEY (origem_id) REFERENCES Aeroportos(aeroporto_id),
    FOREIGN KEY (destino_id) REFERENCES Aeroportos(aeroporto_id)
);

-- Tabela para armazenar informações sobre as escalas intermediárias dos voos
CREATE TABLE Escalas (
    escala_id SERIAL PRIMARY KEY,
    voo_id INT NOT NULL,
    aeroporto_id INT NOT NULL,
    FOREIGN KEY (voo_id) REFERENCES Voos(voo_id),
    FOREIGN KEY (aeroporto_id) REFERENCES Aeroportos(aeroporto_id)
);

-- Tabela para armazenar informações sobre os trechos dos voos
CREATE TABLE Trechos (
    trecho_id SERIAL PRIMARY KEY,
    voo_id INT NOT NULL,
    classe VARCHAR(20) NOT NULL,
    FOREIGN KEY (voo_id) REFERENCES Voos(voo_id)
);

-- Tabela para armazenar informações sobre as reservas
CREATE TABLE Reservas (
    reserva_id SERIAL PRIMARY KEY,
    passageiro_id INT NOT NULL,
    prazo_validade TIMESTAMP NOT NULL,
    FOREIGN KEY (passageiro_id) REFERENCES Passageiros(passageiro_id)
);

-- Tabela para armazenar informações sobre os assentos reservados
CREATE TABLE Assentos (
    assento_id SERIAL PRIMARY KEY,
    reserva_id INT NOT NULL,
    trecho_id INT NOT NULL,
    FOREIGN KEY (reserva_id) REFERENCES Reservas(reserva_id),
    FOREIGN KEY (trecho_id) REFERENCES Trechos(trecho_id)
);


