CREATE DATABASE universidade;
USE universidade;
 
CREATE TABLE professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    departamento VARCHAR(100),
    data_contratacao DATE
);
 
ALTER TABLE professores
ADD COLUMN salario DECIMAL(10, 2);
 
ALTER TABLE professores
DROP COLUMN departamento;
 
CREATE TABLE disciplinas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES professores(id)
);
 
ALTER TABLE disciplinas
ADD COLUMN descricao VARCHAR(255);
 
DROP TABLE disciplinas;
 
CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    bloco VARCHAR(50),
    data_criacao DATE
);
 
CREATE TABLE empregados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_admissao DATE,
    salario DECIMAL(10, 2),
    departamento VARCHAR(100) -- Referência ao nome do departamento
);
 
CREATE TABLE editora (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100)
);
 
CREATE TABLE autor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);
 
CREATE TABLE biblioteca_Livro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    ano_publicacao INT,
    categoria VARCHAR(100),
    isbn VARCHAR(20),
    editora VARCHAR(100),
    FOREIGN KEY (editora) REFERENCES editora(nome) 
);
 
CREATE TABLE emprestimo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_livro INT, 
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (id_livro) REFERENCES biblioteca_Livro(id)
);
 
INSERT INTO departamentos (nome, bloco, data_criacao) 
VALUES 
('Engenharia', 'Bloco E', '2005-03-15'),
('Administração', 'Bloco F', '2010-06-20');
 
INSERT INTO empregados (nome, data_admissao, salario, departamento)
VALUES ('Lucas Fernandes', '2022-09-01', 7500.00, 'Tecnologia da Informação');
 
INSERT INTO biblioteca_Livro (nome, ano_publicacao, categoria, isbn, editora)
VALUES ('Banco de Dados Avançado', 2021, 'Banco de Dados', '123456789', 'Novatec');
 
UPDATE empregados 
SET salario = 5500.00 
WHERE nome = 'Carlos Júnior';
 
UPDATE editora 
SET cidade = 'Brasília' 
WHERE nome = 'Intrinseca';
 
DELETE FROM empregados 
WHERE nome = 'Mariana Barbosa';
 
DELETE FROM biblioteca_Livro 
WHERE ano_publicacao < 2015;
 
SELECT * FROM empregados 
ORDER BY salario DESC;
 
SELECT * FROM empregados 
WHERE salario > 5000.00 AND data_admissao < '2020-01-01';
 
SELECT departamento, COUNT(*) AS quantidade_empregados 
FROM empregados 
GROUP BY departamento;
 
SELECT departamento, SUM(salario) AS total_salarios 
FROM empregados 
GROUP BY departamento;
 
SELECT MAX(salario) AS maior_salario 
FROM empregados;
 
SELECT livro.nome AS livro_nome, editora.nome AS editora_nome
FROM biblioteca_Livro livro
JOIN editora ON livro.editora = editora.nome;
 
SELECT aluno.nome AS aluno_nome, emprestimo.data_devolucao 
FROM emprestimo
JOIN aluno ON emprestimo.id_aluno = aluno.id
WHERE emprestimo.data_devolucao IS NOT NULL;
 
SELECT livro.nome AS livro_nome, aluno.nome AS aluno_nome
FROM emprestimo
JOIN livro ON emprestimo.id_livro = livro.id
JOIN aluno ON emprestimo.id_aluno = aluno.id
WHERE emprestimo.data_devolucao IS NULL;
 
SELECT departamento, AVG(salario) AS media_salarial
FROM empregados 
GROUP BY departamento;
 
SELECT DISTINCT autor.nome 
FROM biblioteca_Livro livro
JOIN autor ON livro.id_autor = autor.id
WHERE livro.editora = 'Novatec';
