-- escolher um jogo, criar no minimo 3 tabelas e no maximo 5;
-- tabela tem que se relacionar;
-- sera contabilizada como tabela tabelas associativa;

create database Mine;
use Mine;
slk
create table Bloco(
idbloco int primary key auto_increment,
nomebloco varchar(45) not null,
tipobloco varchar(45) not null,
);

create table Mob(
idMob int primary key auto_increment
);
