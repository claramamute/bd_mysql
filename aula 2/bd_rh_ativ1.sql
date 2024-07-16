CREATE DATABASE db_rh;
USE db_rh;

CREATE TABLE tb_colaboradores (
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    matricula BIGINT NOT NULL,
    sexo CHAR(1),
    salario DECIMAL(8,2) NOT NULL,
    profissao VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

DESCRIBE tb_colaboradores;

INSERT INTO tb_colaboradores(nome, matricula,sexo, salario, profissao)
VALUES ("Claúdio", 123456 , "M", 5000.00 , "Engenheiro"),
("Maria", 223344 , "F", 4500.00 , "Contadora"),
("Arthur", 678934 , "M", 900.00 , "Jovem Aprendiz"),
("Fernanda", 564372 , "F", 7000.00 , "Analista"),
("Ana", 782118 , "F", 5000.00 , "Engenheira");

SELECT * FROM tb_colaboradores;

SELECT * FROM tb_colaboradores WHERE salario > 2000.00;
SELECT * FROM tb_colaboradores WHERE salario < 2000.00;

UPDATE tb_colaboradores SET profissao = "Gerente" WHERE id = 5;
