create database wesley;
use wesley;

create table Autor (
idAutor int auto_increment primary key,
nomeAutor varchar(40),
idade int
);

 insert into Autor values
(null,'Wesley','18'),
(null,'Eleven','20'),
(null,'Salas','34'),
(null,'Balad','65');

 select * from Autor;
 
create table Musica(
idMusica int auto_increment primary key,
titulo varchar(40) not null,
duracao varchar(20),
fkAutor int,
foreign key (fkAutor) references Autor (idAutor)
);insert into Musica value
(null,'E você se foi','4 minutos',1),
(null,'Stranger thigs','7 minutos',4),
(null,'Acriment','3 minutos',1),
(null,'Sun Flower','5 minutos',4),
(null,'Rei Lacoste','2 minutos',3),
(null,'Goods plans','4 minutos',3),
(null,'Old town road','5 minutos',2);

select * from Musica;

select Musica.*, Autor.*
from Musica
INNER JOIN Autor on Autor.idAutor=Musica.fkAutor;
      
create table Banda(
idBanda int auto_increment primary key,
nomeBanda varchar(40),
integrates int
);

insert into banda values 
(NULL,'Senicos',2),
(NULL,'PALAS',2);

alter table Musica add fkBanda int;
alter table Musica add foreign key(fkBanda) references Banda (idBanda);

update Musica 
set  fkBanda = 1
where idMusica in (1,2,3);

update Musica
set fkBanda = 2
where idMusica in (4,5,6);

select * from Autor;

create table genero(
idgenero int auto_increment primary key,
nomegenero varchar(40)
);

insert into genero value
(null,'Rock'),(null,'Eletronica');

alter table Banda add fkgenero int;
alter table Banda add foreign key (fkgenero) references genero (idgenero); 

update Banda 
set fkgenero = 1
where idbanda = 2;

update banda
set fkgenero = 2
where idbanda =1;

select * from banda;

create table pais (
idpais int auto_increment primary key,
nomepais varchar(30)
);

insert into pais values 
(null,'Brasil'),
(null,'Estados Unidos');

alter table banda add fkpais int;
alter table banda add foreign key (fkpais) references pais (idpais);

update banda 
set fkpais = 2
where idbanda = 1;

select musica.*, banda.*, autor.*
from musica 
join banda on banda.idbanda = musca.fkBanda 
join autor on autor.idAutor = musica.fkAutor;


 
