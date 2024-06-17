/* 1_modeloLógico_BD1: */

CREATE TABLE CLINICAS (
    idClinica INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    cnpj CHAR(14)
);

CREATE TABLE PACIENTES (
    cpf CHAR(11) UNIQUE,
    idPaciente INTEGER,
    nome VARCHAR(40),
    rg VARCHAR(15),
    telefone 1 VARCHAR(15),
    telefone 2 VARCHAR(15),
    telefone 3 VARCHAR(15),
    data de nascimento DATE,
    logradouro VARCHAR(50),
    numero SMALLINT,
    complemento VARCHAR(20),
    bairro VARCHAR(30),
    cep CHAR(8),
    cidade VARCHAR(50),
    estado CHAR(2),
    horaVisita TIME,
    crmResponsavel INTEGER
);
 
PRIMARY KEY (idPaciente)

CREATE TABLE QUARTOS (
    andar INTEGER,
    numero DATE PRIMARY KEY
);

CREATE TABLE MEDICOS (
    nome VARCHAR(40),
    crm INTEGER PRIMARY KEY,
    especializacao VARCHAR(20),
    salario NUMERIC(15,2)
);

CREATE TABLE Internacao (
    dataEntrada DATE,
    dataSaida DATE,
    idPaciente INTEGER,
    numeroQuarto INTEGER,
    PRIMARY KEY (dataEntrada, dataSaida)
);

CREATE TABLE Tratamento (
    crm INTEGER,
    idPaciente INTEGER,
    PRIMARY KEY (crm, idPaciente)
);
 
ALTER TABLE PACIENTES ADD CONSTRAINT FK_PACIENTES_3
    FOREIGN KEY (crmResponsavel???)
    REFERENCES ??? (???);
 
ALTER TABLE QUARTOS ADD CONSTRAINT FK_QUARTOS_2
    FOREIGN KEY (numero, ???)
    REFERENCES Internacao (dataSaida, ???);
 
ALTER TABLE Internacao ADD CONSTRAINT FK_Internacao_2
    FOREIGN KEY (idPaciente???, numeroQuarto???)
    REFERENCES ??? (???);
 
ALTER TABLE Tratamento ADD CONSTRAINT FK_Tratamento_1
    FOREIGN KEY (crm???, idPaciente???)
    REFERENCES ??? (???);