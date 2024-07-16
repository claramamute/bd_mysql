CREATE DATABASE db_ecommerce;
USE db_ecommerce;

CREATE TABLE tb_produtos (
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    categoria VARCHAR(255) NOT NULL,
    preco DECIMAL (6,2) NOT NULL,
    marca VARCHAR(255),
    estoque BOOLEAN NOT NULL,
    PRIMARY KEY (id)
);

DESCRIBE tb_produtos;

INSERT INTO tb_produtos(nome, categoria , preco, marca, estoque)
VALUES ("Escova", "Cosmético" , 25.00, "Vult" , true),
("Batom", "Cosmético" ,  45.00 , "Vult", true),
("Rivotril", "Medicamento" ,  36.00 , "" , false),
("Simeticona", "Medicamento" , 38.00 , "", true),
("Dipirona", "Medicamento" ,  40.00 , "", true),
("Condicionador", "Cosmético" , 49.00 , "Salon Line", false),
("Sabonete", "Cosmético" ,  10.90 , "Natura", true),
("Risperidona", "Medicamento" ,  55.00, "" , true);

INSERT INTO tb_produtos(nome, categoria , preco, marca, estoque)
VALUES ("Oleo", "Cosmético" , 550.00, "Keraste" , false);
INSERT INTO tb_produtos(nome, categoria , preco, marca, estoque)
VALUES ("Creme", "Cosmético" , 600.00, "Loreal" , true);

SELECT * FROM tb_produtos WHERE preco > 500.00;
SELECT * FROM tb_produtos WHERE preco < 500.00;

UPDATE tb_produtos SET estoque = true WHERE id =9;











