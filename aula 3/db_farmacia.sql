create database db_farmacia_bem_estar;
use db_farmacia_bem_estar;

create table tb_categorias(
	id bigint auto_increment,
    categoria varchar(255) not null,
    descricao varchar(255) ,
    primary key(id)
);

insert into tb_categorias (categoria, descricao)
values ("Cosmésticos","Itens voltados para realçar a beleza"),
("Higiene", "Produtos para cuidar do corpo"),
("Medicamentos","Produtos que auxiliam na manutenção da saúde"),
("Suplementos", " Opções para pessoas com necessidades alimentares específicas");

create table tb_produtos (
	id bigint auto_increment,
    nome_produto varchar(255) not null,
    preco decimal (6,2) not null,
    data_validade date not null,
	estoque boolean not null,
    primary key (id)
);
-- --------  Inserindo a coluna que será a FK   ----------
alter table tb_produtos add categoriaid bigint;

-- ---Transformando categoriaid com FK, criando relacionamento-------

alter table tb_produtos add constraint fk_produto_categoria
foreign key (categoriaid) references tb_categorias(id);

-- --------  Inserindo dados em produtos, junto com a FK   ----------
insert into tb_produtos (nome_produto,preco,data_validade,estoque, categoriaid)
VALUES ("Skala", 30.50 ,"2026-12-15", true,1),
 ("Rivotril",  35.00 ,"2025-12-15", true, 3 ),
("Simeticona", 55.00 ,"2025-03-08", true,3),
("Kerasté", 400.50,"2027-03-09", false, 1 ),
 ("Whey", 100.00,"2024-12-09", true, 4 ),
 ("Vitamina D", 40.00 ,"2025-03-09", false, 4),
 ("Sabone", 20.00 ,"2024-03-09", true, 2),
("Pasta de Dente", 25.00 ,"2024-03-09",true, 2 );

-- --------  Consultas avançadas   ----------
select * from tb_produtos where preco > 50.00;
select * from tb_produtos where preco between 5.00 and 60.00;
select * from tb_produtos where nome_produto like "%c%";

-- --------  Associação de tabelas   ----------
select nome_produto , preco, data_validade, estoque, tb_categorias.categoria
from tb_produtos inner join tb_categorias  
on tb_produtos.categoriaid = tb_categorias.id;

select nome_produto , preco, data_validade, estoque, tb_categorias.categoria
from tb_produtos inner join tb_categorias  
on tb_produtos.categoriaid = tb_categorias.id
where tb_categorias.categoria = "Suplementos";
