-- Consultas SQL Avançadas -----

USE db_quitanda;

SELECT * FROM tb_produtos ORDER BY nome ASC; -- Busca em ordem alfabética ou DESC (decrescente)

SELECT * FROM tb_produtos WHERE preco BETWEEN 3.00 AND 12.00; -- Busca itens que tem o preco entre 3 e 12 (busca por intervalos)

SELECT * FROM tb_produtos WHERE preco IN (5.99, 10.00, 15.00); -- retornar todos os produtos cujo preço seja igual ao que está no parenteses

SELECT * FROM tb_produtos WHERE nome LIKE "%ja%"; -- %texto(final) texto%(começo) %texto%(qualquer ponto)

SELECT @@collation_database; -- saber se o bd diferencia letras maiusculas ou minusculas (case sensitive) ou ci

-- Selecionando Dados com Funções matemáticas

SELECT AVG(Preco) AS Media FROM tb_produtos; -- calcula a media dos valores de um atributo - as(cria apelido para o resultado)

-- Relacionamento entre Tabelas 

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(255) NOT NULL
);

INSERT INTO tb_categorias (descricao)
VALUES ("Frutas"),
 ("Verduras"),
("Legumes"),
("Temperos"),
 ("Ovos"),
('Outros');

SELECT * FROM tb_categorias;
-- Criando relacionamento
ALTER TABLE tb_produtos ADD categoriaid BIGINT; -- adiciona nova coluna na produtos - alter table (altera estrutura tabela)

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias  -- adiciona uma restrição (da nome a ela) FK , indicando que a categoriaid será a FK na tabela produtos
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id); -- e relaciona a FK catagoriaid com o id da tabela produtos


-- Adicionando categoria nos produtos 
SELECT * FROM tb_produtos;

UPDATE tb_produtos SET categoriaid = 1 WHERE id = 2;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 3;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 4;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 5;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 6;

-- Associações entre tabelas --- 

--  A cláusula JOIN é usada para combinar dados provenientes de duas ou mais tabelas do banco de dados, baseado em um relacionamento entre as colunas das duas tabelas.
--  em uma busca, o usuário não é obrigado a saber qual categoria o código representa. Para criar uma consulta que mostre a relação entre as tabelas

-- INNER JOIN ----- 
-- se tiver categoria sem produto, não trás, se tiver produto sem categoria, não trás - trás apenas aquilo que tem ligações

SELECT nome, quantidade, preco, tb_categorias.descricao -- quer selecionar essas colunas da tabela rpodutos
FROM tb_produtos INNER JOIN tb_categorias -- relacionada na tabela categoria
ON tb_produtos.categoriaid = tb_categorias.id;-- verificação da existencia da relação entre elas

-- LEFT JOIN

SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos LEFT JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;

-- RIGHT JOIN
SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos RIGHT JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;
