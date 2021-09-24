create database dizzer;
use dizzer;

create table autor(
id int auto_increment primary key,
nome varchar(50)
);

create table musica (
id int auto_increment primary key,
nome varchar(50),
fk_autor int,
foreign key (fk_autor) references autor (id)
);

insert into autor values
(null, 'Sidoka');

select * from musica;

insert into musica values 
(null,'Céu Azul',null);



select musica.nome, autor.nome 
from musica 
join autor on musica.fk_autor = autor.id;

select musica.nome, autor.nome 
from musica 
left join autor on musica.fk_autor = autor.id;

select musica.nome, autor.nome 
from musica 
right join autor on musica.fk_autor = autor.id;


