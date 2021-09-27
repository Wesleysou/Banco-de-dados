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
fk_cliente int,
foreign key (fk_cliente) references cliente (idCliente)
)auto_increment = 101;

insert into Pet values 
(null,'Craudio','Cahcorro',08/05/2006,3),
(null,'Dog','Cahcorro',04/03/2003,5),
(null,'Persa','Gato',30/04/2021,4),
(null,'Marlei','Peixe',04/12/2017,3),
(null,'Sino','Peixe',30/12/2012,4),
(null,'Dragonite','gato',11/03/2011,3),
(null,'Toto','Cachorro',17/05/2020,6),
(null,'Toni','Passaro',04/09/2009,2),
(null,'Thanos','Cachorro',11/13/2010,1),
(null,'Galho','Passaro'12/12/2010,2);

select * from Pet;
select * from cliente;

