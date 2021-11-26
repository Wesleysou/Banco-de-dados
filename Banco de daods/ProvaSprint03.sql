create database Competição;
use Competição;

create table proprietario(
idProp int primary key auto_increment,
nomeProp varchar(45),
telProp int,
emailProp varchar(45),
fk_expert int,
foreign key (fk_expert) references proprietario(idProp)
)auto_increment = 1;
-- Wesley
insert into proprietario (nomeProp, telProp, emailProp, fk_expert) values 
("Wesley", 948374837, "Wesley@gmail.com",null),
("Marcos", 903948475, "Marcos@gmail.com",1),
("Paulo", 937485940, "Paulo@gmail.com",1);


create table competicao(
idComp int primary key auto_increment,
nomeComp varchar(45),
cidadeComp varchar(45),
premioComp decimal(10,2)
) auto_increment = 100;
-- Wesley
insert into competicao values
(null,"AstroWorld","Nova Iorque",1000000.00),
(null,"Donda","São Paulo",3000000.00),
(null,"Bayby","Africa do Sul",400000.00);


create table cavalo(
idCavalo int primary key auto_increment,
nomeCavalo varchar(45),
racaCavalo varchar(45),
nascCavalo date,
fk_proprietario int,
foreign key (fk_Proprietario) references proprietario(idProp)
) auto_increment = 500;
-- Wesley
insert into cavalo values 
(null,"CityMon","Railander",'20001005',1),
(null,"SlowFast","Railander",'20021205',1),
(null,"TreeLife","Silco",'20030111',2),
(null,"SOooFast","Pinser",'20151110',3);

create table mundial(
idMundial int,
fk_Cavalo int,
fk_Competicao int,
dataMuncial date,
colocMundial varchar(45),
foreign key (fk_Cavalo) references cavalo (idCavalo),
foreign key (fk_Competicao) references competicao (idComp),
primary key(fk_Cavalo, fk_Competicao, idMundial) 
);
-- Wesley;
insert into mundial values 
(30,512,100,20201010,"Segundo"),
(31,512,101,20201201,"Primeiro"),
(32,512,102,20200105,"Segundo"),
(33,515,100,20201010,"Primeiro"),
(34,515,101,20201201,"Segundo"),
(35,514,100,20201010,"Terceiro"),
(36,514,102,20200105,"Primeiro"),
(37,513,101,20200105,"Terceiro"),
(38,513,100,20200105,"Quarto");

-- Wesley
select * from cavalo;
select * from mundial;
select * from competicao;
select * from proprietario;

 
-- 2) Altere a estrutura da tabela Cavalos com um campo que identifique sua
-- nacionalidade e atualize os cavalos inseridos com essa informação

-- Wesley

alter table cavalo add nascionalidade varchar(45);

update cavalo 
set nascionalidade = "Brasileiro"
where idCavalo in (512,514);

update cavalo 
set nascionalidade = "Alemão"
where idCavalo in (513,515);

-- 3) Exibir os dados dos cavalos e os dados de suas respectivas competições.
-- Wesley

select * from mundial as md 
join cavalo as cav on cav.idCavalo = md.fk_cavalo
join competicao as comp on comp.IdComp = md.fk_competicao;

-- 4) Exibir os dados de um determinado cavalo (informar o nome do cavalo na
-- consulta) e os dados de suas respectivas competições.
-- Wesley

select * from mundial as md 
join cavalo as cav on cav.idCavalo = md.fk_cavalo
join competicao as comp on comp.IdComp = md.fk_competicao
where nomeCavalo = "SOooFast";

-- 5) Exibir os dados dos proprietários novatos e os dados dos respectivos
-- proprietários orientadores.
-- Wesley

select * from proprietario as novato
join proprietario as expert on expert.idProp = novato.fk_expert;

-- 6) Exibir os dados dos proprietários novatos e os dados dos respectivos
-- proprietários orientadores, porém somente de um determinado proprietário
-- orientador (informar o nome do proprietário orientador na consulta).
-- Wesley

select * from proprietario as ex
join proprietario as nov on ex.idProp = nov.fk_expert
where ex.nomeProp = "Wesley";

-- 7) Exibir os dados dos proprietários novatos, os dados dos respectivos
-- proprietários orientadores, os dados dos respectivos cavalos dos proprietários e
-- das competições que cada cavalo participou.
-- Wesley

select * from mundial as md
join cavalo as cav on cav.idCavalo = md.fk_Cavalo
join competicao as comp on comp.idComp = md.fk_competicao
join proprietario as ex on ex.idProp = cav.fk_proprietario
join proprietario as nov on nov.idProp = cav.fk_proprietario;


-- 8) Exibir apenas o nome do proprietário, o nome do cavalo e a colocação que o
-- cavalo teve em uma determinada competição.
-- Wesley

select  nomeProp as "Nome do Proprietario", nomeCavalo as "Nome do cavalo", colocMundial as "Colocação" from mundial as md  
join cavalo as cav on cav.idCavalo = md.fk_Cavalo
join competicao as comp on comp.idComp = md.fk_competicao
join proprietario as pro on pro.idProp = cav.fk_proprietario;


-- 9) Exibir apenas o nome da competição, a raça do cavalo e a média do valor da
-- premiação agrupado pelo nome da competição.
-- Wesley

select avg(premioCOmp) as "Media Competição", racaCavalo as Raça, nomeComp as "Nome da competição" from mundial as md  
join cavalo as cav on cav.idCavalo = md.fk_Cavalo
join competicao as comp on comp.idComp = md.fk_competicao
group by nomeComp;

-- 10) Inserir dados de novo cavalo. Exibir os dados dos cavalos, das respectivas
-- competições, e os cavalos que não participam de nenhuma competição.
-- Wesley

insert into cavalo values 
(null,"Pédepano","Pinser",19991009,2,"Brasileiro");

select * from mundial as md
right join cavalo as cv on cv.idCavalo = md.fk_Cavalo
left join competicao as comp on comp.idComp = md.fk_competicao;















