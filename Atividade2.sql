-- 1. Criação da tabela Vendas
CREATE TABLE Vendas (
    id_venda INT,
    produto VARCHAR(50),
    categoria VARCHAR(50),
    quantidade INT,
    preco_unidade DECIMAL(10, 2),
    data_venda DATE
);

-- 2. Inserção dos dados
INSERT INTO Vendas (id_venda, produto, categoria, quantidade, preco_unidade, data_venda)
VALUES
(1, 'Arroz', 'Alimentos', 5, 10.00, '2024-09-01'),
(2, 'Feijão', 'Alimentos', 3, 7.50, '2024-09-02'),
(3, 'Sabão', 'Limpeza', 2, 12.00, '2024-09-02'),
(4, 'Café', 'Alimentos', 6, 8.00, '2024-09-03'),
(5, 'Detergente', 'Limpeza', 4, 5.00, '2024-09-03'),
(6, 'Leite', 'Alimentos', 10, 4.50, '2024-09-04'),
(7, 'Sabonete', 'Higiene', 6, 3.00, '2024-09-04'),
(8, 'Pão', 'Alimentos', 15, 1.50, '2024-09-05'),
(9, 'Shampoo', 'Higiene', 1, 15.00, '2024-09-05'),
(10, 'Creme dental', 'Higiene', 3, 8.00, '2024-09-06');

-- 3. Perguntas e respostas

-- 3.1. Quantas vendas foram realizadas na categoria "Alimentos"?
SELECT COUNT(*) AS total_vendas_alimentos
FROM Vendas
WHERE categoria = 'Alimentos';

-- 3.2. Quantas vendas foram realizadas no total?
SELECT COUNT(*) AS total_vendas
FROM Vendas;

-- 3.3. Qual é o preço médio por unidade dos produtos vendidos?
SELECT AVG(preco_unidade) AS preco_medio
FROM Vendas;

-- 3.4. Qual é a quantidade média de produtos vendidos por venda?
SELECT AVG(quantidade) AS quantidade_media
FROM Vendas;

-- 3.5. Qual foi o menor preço por unidade vendido?
SELECT MIN(preco_unidade) AS menor_preco
FROM Vendas;

-- 3.6. Qual foi o maior preço por unidade vendido?
SELECT MAX(preco_unidade) AS maior_preco
FROM Vendas;

-- 3.7. Qual foi a menor e a maior quantidade de produtos vendidos em uma venda?
SELECT MIN(quantidade) AS menor_quantidade, MAX(quantidade) AS maior_quantidade
FROM Vendas;

-- 3.8. Qual foi o maior valor total de uma venda? (valor_total = quantidade * preco_unidade)
SELECT MAX(quantidade * preco_unidade) AS maior_valor_venda
FROM Vendas;

-- 3.9. Qual é a média de valor das vendas realizadas na categoria "Higiene"?
SELECT AVG(quantidade * preco_unidade) AS media_valor_higiene
FROM Vendas
WHERE categoria = 'Higiene';
