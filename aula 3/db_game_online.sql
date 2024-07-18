CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classes ( 
	id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL, -- guerreiro, mago, etc -- será a FK
	descricao VARCHAR(255),
	PRIMARY KEY (id)
);

INSERT INTO tb_classes (nome, descricao)
VALUES ("Guerreiro ","Especializado em força bruta e durabilidade."),
 ("Bárbaro","Feroz e raivoso"),
("Paladino","Habilidades de combate com um forte senso de justiça. "),
("Mago","Magias ofensivas e defensivas."),
 ("Druida","Magias relacionadas a plantas, animais e os elementos");


CREATE TABLE tb_personagens(
	id BIGINT AUTO_INCREMENT,
    nome_personagem VARCHAR(255) NOT NULL,
    nivel INT NOT NULL,
    ouro DECIMAL NOT NULL,
    ataque INT NOT NULL,
    defesa INT NOT NULL,
    PRIMARY KEY (id)

);

ALTER TABLE tb_personagens ADD classeid BIGINT;

ALTER TABLE tb_personagens ADD CONSTRAINT fk_personagens_classes 
FOREIGN KEY (classeid) REFERENCES tb_classes (id); 

INSERT INTO tb_personagens (nome_personagem,nivel, ouro, ataque, defesa, classeid)
VALUES ("MatadorPorco ", 3, 2000.00 ,3500, 3000,1),
 ("ConeFeliz", 2, 5000.00 ,2000, 2000, 3 ),
("Paladins",6, 6000.00 ,4000, 2500,3),
("ReiMago",4, 4000.00,2500, 4000, 4 ),
 ("Druidinha",7, 3000.00,1900, 4500, 5 ),
 ("LoiroBarbaro ",5, 7000.00 ,1800, 2000,2),
 ("PatoMago",10, 20000.00 ,6000, 5000, 4),
("Atrix",9, 12000.00 ,5000,4000, 1 );

SELECT * FROM tb_personagens WHERE ataque > 2000;
SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;
SELECT * FROM tb_personagens WHERE nome_personagem LIKE "%c%";

SELECT nome_personagem, nivel, ataque, defesa, tb_classes.nome
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classeid = tb_classes.id;


SELECT nome_personagem, nivel, ataque, defesa, tb_classes.nome
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classeid = tb_classes.id
WHERE tb_classes.nome LIKE "%Guerreiro%";









