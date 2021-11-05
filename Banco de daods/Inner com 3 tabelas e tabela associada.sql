create database sala;
use sala;

create table projeto(
identifica int primary key auto_increment,
Nomeprojeto varchar(45),
descricao varchar(45)
);
insert into projeto (Nomeprojeto, descricao) value 
('Shopping','projeto com sensor de movimento'),
('Elevador','Elevador mais rápido'),
('cidade','cidade limpa');

create table aluno(
idAluno int primary key auto_increment,
NomeAluno varchar(45),
Telaluno int,
fk_projeto int,
foreign key (fk_projeto) references projeto(identifica)
) auto_increment = 100;

insert into aluno (NomeAluno, Telaluno, fk_projeto) values 
('Wesley',930386200,2),
('Gustavo',937483928,1),
('Marcos',928374758,2),
('Zulos',938273648,3),
('Matheus',984952788,1);


create table acompanhante(
identacom int primary key auto_increment,
Nomeacom varchar(45),
Tiporela varchar(45),
fk_aluacom int,
foreign key (fk_aluacom) references aluno (idAluno)
) auto_increment = 1000;

insert into acompanhante (Nomeacom, Tiporela, fk_aluacom) value 
('Mirela','Irmã',100),
('Raquel','Mãe',101),
('Aline','Tia',100),
('Samuel','Irmão',102),
('Idor','Amigo',102),
('Paula','Mãe',103);

create table representante (
fk_representa int,
fk_alunoras int,
foreign key (fk_representa) references aluno (Idaluno),
foreign key (fk_alunoras) references aluno (Idaluno),
motivo varchar(100)
);

insert into representante (fk_representa, fk_alunoras, motivo) values 
(100,101,'Briga'),
(100,102,'Falar em sala'),
(100,103,'interromper o professor'),
(100,104,'xingar o amigo');

-- WESLEY MONTEIRO 01212094

-- - Exibir todos os dados de cada tabela criada, separadamente.
select  * from projeto;
select  * from aluno;
select  * from acompanhante;
select  * from representante;


-- Exibir os dados dos alunos e dos projetos correspondentes.
select * 
from aluno 
join projeto on fk_projeto = identifica;

-- Exibir os dados dos alunos e dos seus acompanhantes.
select *
from aluno
join acompanhante on fk_aluacom = Idaluno;

-- Exibir os dados dos alunos e dos seus representantes.
select * 
from aluno 
join representante on fk_representa = Idaluno;

-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente de
-- um determinado projeto (indicar o nome do projeto na consulta).
select * 
from aluno 
join projeto on fk_projeto = identifica
where Nomeprojeto = 'shopping';

-- - Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes
select * 
from aluno 
join projeto on fk_projeto = identifica
join acompanhante on fk_aluacom = Idaluno;