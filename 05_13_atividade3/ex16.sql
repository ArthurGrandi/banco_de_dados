-- BD-I-ARTHUR-GRANDI-EX016-SQL-DDL.sql
--016.UNIVERSIDADE- ARTHUR GRANDI E KENZO-RÁ

-- Tabela para armazenar informações sobre os alunos
CREATE TABLE Alunos (
    matricula SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    identidade VARCHAR(20) UNIQUE NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    telefone VARCHAR(20),
    data_nascimento DATE NOT NULL,
    sexo CHAR(1) NOT NULL,
    PRIMARY KEY (matricula)
);

-- Tabela para armazenar informações sobre os cursos
CREATE TABLE Cursos (
    codigo_curso SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    horas_aula_semestrais INT NOT NULL,
    departamento_responsavel VARCHAR(100) NOT NULL
);

-- Tabela para armazenar informações sobre as disciplinas
CREATE TABLE Disciplinas (
    codigo_disciplina SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    horas_aula_semanais INT NOT NULL,
    curso_codigo INT NOT NULL,
    FOREIGN KEY (curso_codigo) REFERENCES Cursos(codigo_curso)
);

-- Tabela para armazenar informações sobre as turmas
CREATE TABLE Turmas (
    codigo_turma SERIAL PRIMARY KEY,
    ano INT NOT NULL,
    semestre INT NOT NULL,
    disciplina_codigo INT NOT NULL,
    professor_responsavel VARCHAR(100) NOT NULL,
    sala VARCHAR(50) NOT NULL,
    FOREIGN KEY (disciplina_codigo) REFERENCES Disciplinas(codigo_disciplina)
);

-- Tabela para armazenar informações sobre os funcionários
CREATE TABLE Funcionarios (
    matricula_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    identidade VARCHAR(20) UNIQUE NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    telefone VARCHAR(20),
    data_nascimento DATE NOT NULL,
    sexo CHAR(1) NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    data_admissao DATE NOT NULL
);

-- Tabela para armazenar informações sobre os professores
CREATE TABLE Professores (
    matricula_professor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    departamento_responsavel VARCHAR(100) NOT NULL,
    capacidade TEXT,
    FOREIGN KEY (departamento_responsavel) REFERENCES Cursos(departamento_responsavel)
);

-- Tabela para armazenar as notas dos alunos por turma
CREATE TABLE Notas (
    matricula_aluno INT NOT NULL,
    codigo_turma INT NOT NULL,
    nota DECIMAL(5, 2),
    PRIMARY KEY (matricula_aluno, codigo_turma),
    FOREIGN KEY (matricula_aluno) REFERENCES Alunos(matricula),
    FOREIGN KEY (codigo_turma) REFERENCES Turmas(codigo_turma)
);

-- Tabela para armazenar o histórico escolar dos alunos
CREATE TABLE HistoricoEscolar (
    matricula_aluno INT NOT NULL,
    codigo_disciplina INT NOT NULL,
    ano INT NOT NULL,
    semestre INT NOT NULL,
    resultado_final VARCHAR(20),
    PRIMARY KEY (matricula_aluno, codigo_disciplina),
    FOREIGN KEY (matricula_aluno) REFERENCES Alunos(matricula),
    FOREIGN KEY (codigo_disciplina) REFERENCES Disciplinas(codigo_disciplina)
);