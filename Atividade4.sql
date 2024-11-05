USE Biblioteca;

-- Desabilitar as verificações de chave estrangeira
SET FOREIGN_KEY_CHECKS = 0;

-- Limpar dados
TRUNCATE TABLE Livro_Autor;
TRUNCATE TABLE Reserva;
TRUNCATE TABLE Emprestimo;
TRUNCATE TABLE Livro;
TRUNCATE TABLE Usuario;
TRUNCATE TABLE Categoria;
TRUNCATE TABLE ISBN;
TRUNCATE TABLE Editora;
TRUNCATE TABLE Cidade_Editora;
TRUNCATE TABLE Autor;

-- Recriação das tabelas
DROP TABLE IF EXISTS Livro_Autor;
DROP TABLE IF EXISTS Reserva;
DROP TABLE IF EXISTS Emprestimo;
DROP TABLE IF EXISTS Livro;
DROP TABLE IF EXISTS Usuario;
DROP TABLE IF EXISTS Categoria;
DROP TABLE IF EXISTS ISBN;
DROP TABLE IF EXISTS Editora;
DROP TABLE IF EXISTS Cidade_Editora;
DROP TABLE IF EXISTS Autor;

-- Tabela Cidade_Editora
CREATE TABLE Cidade_Editora (
    id_cidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_cidade VARCHAR(255) NOT NULL
);

-- Tabela Editora
CREATE TABLE Editora (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome_editora VARCHAR(255) NOT NULL,
    id_cidade_fk INT,
    FOREIGN KEY (id_cidade_fk) REFERENCES Cidade_Editora(id_cidade) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Tabela Autor
CREATE TABLE Autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(255) NOT NULL
);

-- Tabela Categoria
CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(255) NOT NULL
);

-- Tabela ISBN
CREATE TABLE ISBN (
    id_isbn INT AUTO_INCREMENT PRIMARY KEY,
    codigo_isbn VARCHAR(30) NOT NULL UNIQUE
);

-- Tabela Livro
CREATE TABLE Livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    ano_publicacao INT,
    id_isbn_fk INT,
    id_editora_fk INT,
    id_categoria_fk INT,
    FOREIGN KEY (id_isbn_fk) REFERENCES ISBN(id_isbn) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (id_editora_fk) REFERENCES Editora(id_editora) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (id_categoria_fk) REFERENCES Categoria(id_categoria) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Tabela Usuário
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(255) NOT NULL
);

-- Tabela Empréstimo
CREATE TABLE Emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATE,
    data_devolucao DATE,
    id_usuario_fk INT,
    FOREIGN KEY (id_usuario_fk) REFERENCES Usuario(id_usuario) ON DELETE CASCADE
);

-- Tabela Reserva
CREATE TABLE Reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    data_reserva DATE,
    id_usuario_fk INT,
    id_livro_fk INT,
    FOREIGN KEY (id_usuario_fk) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_livro_fk) REFERENCES Livro(id_livro) ON DELETE CASCADE
);

-- Tabela intermediária Livro_Autor
CREATE TABLE Livro_Autor (
    id_livro_fk INT,
    id_autor_fk INT,
    PRIMARY KEY (id_livro_fk, id_autor_fk),
    FOREIGN KEY (id_livro_fk) REFERENCES Livro(id_livro) ON DELETE CASCADE,
    FOREIGN KEY (id_autor_fk) REFERENCES Autor(id_autor) ON DELETE CASCADE
);

-- Reabilitar as verificações de chave estrangeira
SET FOREIGN_KEY_CHECKS = 1;

-- Inserção de dados na tabela Cidade_Editora
INSERT INTO Cidade_Editora (nome_cidade) VALUES 
    ('São Paulo'),
    ('Rio de Janeiro'),
    ('Londres'),
    ('Nova York');

-- Inserção de dados na tabela Editora
INSERT INTO Editora (nome_editora, id_cidade_fk) VALUES 
    ('Companhia das Letras', 1),
    ('Rocco', 2),
    ('Penguin Books', 3),
    ('HarperCollins', 4);

-- Inserção de dados na tabela Autor
INSERT INTO Autor (nome_autor) VALUES 
    ('George Orwell'),
    ('J.K. Rowling'),
    ('F. Scott Fitzgerald'),
    ('Gabriel Garcia Marquez');

-- Inserção de dados na tabela Categoria
INSERT INTO Categoria (nome_categoria) VALUES 
    ('Ficção Científica'),
    ('Fantasia'),
    ('Clássico'),
    ('Realismo Mágico');

-- Inserção de dados na tabela ISBN
INSERT INTO ISBN (codigo_isbn) VALUES 
    ('9780451524935'), -- 1984
    ('9780747532743'), -- Harry Potter e a Pedra Filosofal
    ('9780743273565'), -- O Grande Gatsby
    ('9780060883287'); -- Cem Anos de Solidão

-- Inserção de dados na tabela Livro
INSERT INTO Livro (titulo, ano_publicacao, id_isbn_fk, id_editora_fk, id_categoria_fk) VALUES 
    ('1984', 1949, 1, 1, 1), -- Ficção Científica
    ('Harry Potter e a Pedra Filosofal', 1997, 2, 2, 2), -- Fantasia
    ('O Grande Gatsby', 1925, 3, 3, 3), -- Clássico
    ('Cem Anos de Solidão', 1967, 4, 4, 4); -- Realismo Mágico

-- Inserção de dados na tabela Usuario
INSERT INTO Usuario (nome_usuario) VALUES 
    ('Alice Martins'),
    ('Carlos Silva'),
    ('Beatriz Costa'),
    ('Diego Souza');

-- Inserção de dados na tabela Emprestimo
INSERT INTO Emprestimo (data_emprestimo, data_devolucao, id_usuario_fk) VALUES 
    ('2024-01-10', '2024-01-20', 1),
    ('2024-02-15', '2024-02-25', 2),
    ('2024-03-05', NULL, 3);

-- Inserção de dados na tabela Reserva
INSERT INTO Reserva (data_reserva, id_usuario_fk, id_livro_fk) VALUES 
    ('2024-02-01', 4, 1),
    ('2024-02-03', 1, 3),
    ('2024-02-05', 2, 4);

-- Inserção de dados na tabela Livro_Autor
INSERT INTO Livro_Autor (id_livro_fk, id_autor_fk) VALUES 
    (1, 1), -- 1984 por George Orwell
    (2, 2), -- Harry Potter por J.K. Rowling
    (3, 3), -- O Grande Gatsby por F. Scott Fitzgerald
    (4, 4); -- Cem Anos de Solidão por Gabriel Garcia Marquez
