create database petshop;
use petshop;

create table cliente(
idCliente int auto_increment primary key,
Nomecliente varchar (45),
telcliente int,
celcliente int,
enderecocliente varchar(45)
);

insert into cliente value 
(null,'Wesley Monteiro',25130976,939386200,'Rua das Couves'),
(null,'Maria josé',25459846,936485920,'Paulista'),
(null,'Paulo Santos',26479384,946294857,'Patriarca'),
(null,'Maria Clara',34589182,937992746,'AV. São Miguel'),
(null,'Lucas Pedrozo',36495732,928475860,'AV. Flamingo'),
(null,'Lucas Moares',25134903,937445734,'Rosinha');

select * from cliente;


create table Pet(
idPet int auto_increment primary key,
nomePet varchar(45),
raca varchar(45),
datanascPet date,
precoPet decimal (10,2),
fk_cliente int,
foreign key (fk_cliente) references cliente (idCliente)
)auto_increment = 101;

insert into Pet values 
(null,'Craudio','Cahcorro',20060506,'28392.32',3),
(null,'Dog','Cahcorro',20030304,'23221.32',5),
(null,'Persa','Gato',20210430,'34554.32',4),
(null,'Marlei','Peixe',20171204,'58392.32',3),
(null,'Sino','Peixe',20121230,'98392.32',4),
(null,'Dragonite','gato',20110311,'32492.32',3),
(null,'Toto','Cachorro',20200517,'654692.32',6),
(null,'Toni','Passaro',20090904,'2342.32',2),
(null,'Thanos','Cachorro',2010311,'6548392.32',1),
(null,'Galho','Passaro',20101210,'100392.32',2);

select * from pet;
select * from cliente;

drop table pet;

select Cl.Nomecliente, P.nomePet, P.precopet
from  Pet p
join Cliente cl on Cl.idCliente = p.fk_cliente
where  nomePet like 'T%';

-- fazer a soma
select sum(precopet) from pet;
-- fazer a media
select avg(precopet) from pet;
-- Arredonda o valor
select round(precopet) from pet;
-- Mais barato
select min(precopet) from pet;
-- Mais caro
select max(precopet), raca, nomePet from pet;
-- Contagem 
select count(raca) from pet;
-- Define a quantidade de casas decimais
select truncate(precopet,5) from pet;
-- exemlo legal 
select avg(round(precopet,2)) as media_arredondada from pet;

create table agendamento (
idAgenda int primary key auto_increment,
nomeagenda varchar(50),
hora varchar(10),
dia date,
fk_cliente int,
foreign key (fk_cliente) references Cliente(idcliente)
);

insert into agendamento value
(null,'Consulta média','10H','20211001',1),
(null,'Consulta média','9H','20211001',2),
(null,'Banho','8H','20211001',1),
(null,'Banho & tosa','7H','20211001',2),
(null,'Banho','7:30H','20211001',3),
(null,'Consulta média','8:30H','20211001',3),
(null,'Cortar unha', '9:30H','20211001',5),
(null,'Toza','10:30H','20211001',6),
(null,'Consulta média','11H','20211001',6),
(null,'Consulta média','12H','20211001',5);

select * from agendamento;


select agendamento.*, Cliente.*, Pet.*
from Cliente 
join Pet  on Cliente.idCliente = Pet.fk_cliente
join agendamento on Cliente.idCliente = agendamento.fk_cliente; 

drop table agendamento;



