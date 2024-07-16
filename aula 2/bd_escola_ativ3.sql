CREATE DATABASE db_escola; 
USE db_escola;

CREATE TABLE tb_estudantes (
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    matricula BIGINT NOT NULL,
    idade INT NOT NULL,
    media DECIMAL (5,2) NOT NULL,
    aprovado BOOLEAN NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_estudantes(nome, matricula,idade, media, aprovado)
VALUES ("Claúdio", 123456 , 18, 70.00 , true),
("Maria", 223344 , 18, 85.00 , true),
("Arthur", 678934 , 17, 90.00 , true),
("Fernanda", 564372 , 17, 45.00 , false),
("Julia", 782118 , 17, 85.00 , true ),
("Clara", 567902 , 16, 100.00 , true),
("Felipe", 102033 , 17, 50.00 , false),
("Gabriella", 756821 , 16, 65.00 , false),
("Gabriel", 893214 , 17, 50.00 , true);

SELECT * FROM tb_estudantes WHERE media > 70.0;
SELECT * FROM tb_estudantes WHERE media < 70.0;

UPDATE tb_estudantes SET media = 70.00  WHERE id = 8;
UPDATE tb_estudantes SET aprovado = true  WHERE id = 8;

SELECT * FROM tb_estudantes;
