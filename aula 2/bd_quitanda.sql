CREATE DATABASE db_quitanda;

USE db_quitanda;

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	quantidade INT,
    datavalidade DATE,
	preco DECIMAL NOT NULL,
     PRIMARY KEY (id)
);

describe tb_produtos; -- visualiza a estrutura da tabela 

INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco)
VALUES ("tomate",100, "2023-12-15", 8.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("maçã",20, "2023-12-15", 5.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("laranja",50, "2023-12-15", 10.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("banana",200, "2023-12-15", 12.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("uva",1200, "2023-12-15", 30.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("pêra",500, "2023-12-15", 2.99);

SELECT * FROM tb_produtos;

SELECT nome, quantidade FROM tb_produtos;

SELECT * FROM tb_produtos WHERE id in (2,4) ; -- trás os id do parenteses

SELECT * FROM tb_produtos WHERE preco = 5.00;

SELECT * FROM tb_produtos WHERE preco > 5 and quantidade < 100; -- buscas especificas com operadores logicos

-- ----------------------------- Modificando a Estrutura da Tabela - Adicionando Coluna

ALTER TABLE tb_produtos ADD descricao varchar(255); -- adiciona

ALTER TABLE tb_produtos MODIFY preco DECIMAL( 6,2); -- modifica 

-- ----------------------------- Atualizacao dados na tabela

SET SQL_SAFE_UPDATES = 1; -- modo seguro

UPDATE tb_produtos SET preco = 5.99 WHERE id =2;

-- ----------------------------- Modificacao estrutura tabela - exclusao coluna

ALTER TABLE tb_produtos DROP descricao; -- apagar coluna

DELETE FROM tb_produtos WHERE id =1; -- apagar dados da tabela , exclui produto cujo id é 1

-- ----------------------------- Modificacao estrutura tabela - alterando nome da coluna

ALTER TABLE tb_produtos CHANGE nome nome_produto VARCHAR(255); -- modifica nome da coluna


