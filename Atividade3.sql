-- Criação do Banco de Dados
CREATE DATABASE Biblioteca;
USE Biblioteca;

-- Tabela Livro
CREATE TABLE Livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    ano_publicacao INT,
    id_editora_fk INT,
    FOREIGN KEY (id_editora_fk) REFERENCES Editora(id_editora)
);

-- Tabela Autor
CREATE TABLE Autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(255)
);

-- Tabela Editora
CREATE TABLE Editora (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome_editora VARCHAR(255)
);

-- Tabela Usuário
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(255)
);

-- Tabela Empréstimo (Um para Muitos entre Usuário e Empréstimo)
CREATE TABLE Emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATE,
    data_devolucao DATE,
    id_usuario_fk INT,
    FOREIGN KEY (id_usuario_fk) REFERENCES Usuario(id_usuario)
);

-- Tabela Reserva (Muitos para Muitos entre Usuário e Livro)
CREATE TABLE Reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    data_reserva DATE,
    id_usuario_fk INT,
    id_livro_fk INT,
    FOREIGN KEY (id_usuario_fk) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_livro_fk) REFERENCES Livro(id_livro)
);

-- Tabela intermediária Livro_Autor (Muitos para Muitos entre Livro e Autor)
CREATE TABLE Livro_Autor (
    id_livro_fk INT,
    id_autor_fk INT,
    FOREIGN KEY (id_livro_fk) REFERENCES Livro(id_livro),
    FOREIGN KEY (id_autor_fk) REFERENCES Autor(id_autor),
    PRIMARY KEY (id_livro_fk, id_autor_fk)
);
