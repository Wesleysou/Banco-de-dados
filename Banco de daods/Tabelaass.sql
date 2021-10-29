create database Escola;
use Escola;

create table Curso (
IdCurso int primary key auto_increment,
NomeCurso varchar(45),
Cordenadorcurso varchar(45)
);

insert into Curso values 
(null,'Inglês', 'Wesley'),
(null,'Espanhol', 'Marcos'),
(null,'Russo', 'João');

select * from curso;

create table Aluno (
RA int primary key auto_increment,
Nomealuno varchar(50),
bairro varchar(50)
) auto_increment = 100;

insert into Aluno values
(null,'Gustavo','São Miguel'),
(null,'Matheus','São Lugar'),
(null,'Lucas','Palmares'),
(null,'PAulo','Paulista'),
(null,'Cezar','São Matheus'),
(null,'Gabriel','Curuca');

select * from Aluno;

create table Tb_global(
NivelAlu decimal(10,2),
datainicio date,
MediaCurso char(1), check (MediaCurso = 6),
fk_aluno int,
fk_curso int,
foreign key (fk_aluno) references Aluno (RA),
foreign key (fk_Curso) references Curso (IdCurso)
);

select * from Tb_global;
insert into Tb_global values
(9,'20201009','6',100,2),
(10,'20201010','6',101,1),
(9.9,'20200418','6',102,3),
(7.20,'20201009','6',103,2),
(5.50,'20200418','6',104,3),
(8.30,'20201010','6',105,1);

-- Exibir os dados de cada tabela separadamente
select * from Aluno;
select * from Curso;
select * from Tb_global;

-- Exibir os dados dos alunos e dos curso correspondentes
select Aluno.*, NomeCurso
from Tb_global 
join Aluno on RA = Fk_aluno
join Curso on IdCurso = Fk_curso; 

-- Exibir os dados dos alunos, mas somente de um cruso
select Nomealuno, NomeCurso
from Tb_global 
join Aluno on RA = Fk_aluno
join Curso on IdCurso = Fk_curso
where  NomeCurso = "Espanhol"; 

-- Exibit os dados de um alunoe os dados dos cursos desse aluno

select Nomealuno, Curso. *
from Tb_global 
join Aluno on RA = Fk_aluno
join Curso on IdCurso = Fk_curso
where  RA = 1;
 
-- Exibir a soma das médias e a média das médias
select sum(Nivelalu) from tb_global;
select avg(Nivelalu) from tb_global;

-- Exibir a maior e a menos média
select min(Nivelalu) from tb_global;
select max(Nivelalu) from tb_global;

-- exibir a maior e a menor média agrupada por curso
select min(Nivelalu)as Média,Nomecurso from Curso
join Tb_global on idcurso = Fk_Curso

group by NomeCurso;select max(Nivelalu)as Média,Nomecurso from Curso
join Tb_global on idcurso = Fk_Curso
group by NomeCurso;

-- exibir a maior e a menor média agrupada por aluno
select max(Nivelalu)as Média,Nomealuno from Aluno
join Tb_global on RA = Fk_aluno
group by NomeAluno;

select min(Nivelalu)as Média,Nomealuno from Aluno
join Tb_global on RA = Fk_aluno
group by NomeAluno;

-- exibir apenas as médias das tabelas alunocurso
select avg(Nivelalu) from tb_global
join Aluno on RA = Fk_aluno
join Curso on IdCurso = Fk_curso;


-- exibir apenas as distintas da tabela AlunoCurso
select distinct(Nivelalu)as Média,Nomealuno from Aluno
join Tb_global on RA = Fk_aluno
group by NomeAluno;

-- Exibir a quantidade de médias da tabela AlunoCurso
select avg(Nivelalu)as Média,Nomealuno from Aluno
join Tb_global on RA = Fk_aluno
group by NomeAluno;

-- Médias distintas
select distinct(avg(Nivelalu)) from Tb_global
join Aluno on RA = Fk_aluno
join Curso on IdCurso = Fk_curso
group by NomeAluno;

 


