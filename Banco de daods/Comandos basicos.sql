create database Escola;
use Escola; 

create table tb_professor
(
prof_id int primary key,
nome_prof varchar(50),
prof_disp varchar(30)
);

alter table tb_professor rename to superprofessores;
select * from superprofessores;
drop table tb_professor;
insert into tb_professor values (prof_id, nome_prof, prof_disp), (1,'Kaline','socio');
insert into superprofessores values 
(4,'isabela','socio'),
(5,'Freza','Algoritimo'),
(6,'Brandão','P.I'), 
(7,'Alex','Banco');



delete from superprofessores where prof_id =1;

select * from superprofessores where prof_id= 2;

update superprofessores
set nome_prof = 'João'
where prof_id= 4; 

select * from superprofessores where nome_prof like '_r%';

select * from superprofessores where nome_prof like 'J%';

alter table superprofessores add column prof_sex char(1);

update superprofessores 
set prof_sex = 'M'
where prof_id in (3, 4,5);







