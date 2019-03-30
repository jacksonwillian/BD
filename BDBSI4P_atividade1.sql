
create table projeto (numero int, nome varchar(50),localizacao varchar(50));
create table empregado (rg varchar(10), nome varchar(50), cpf char(11), depto varchar(20), rg_supervisor varchar(10), salario float(6), dat_init_sal date);			
create table departamento (numero int, nome varchar(50), rg_gerente varchar(10));																   
create table dependente (codigo int, rg_responsavel varchar(10), nome_dependente varchar(20), nascimento date, relacao varchar(20), sexo char(1));
create table empregado_projeto (codigo int, rg_empregado varchar(10), numero_projeto int, horas time );
create table departamento_projeto (codigo int, numero_depto int, numero_projeto int);
create table historico_salario (rg varchar(10), dat_ini_sal date, dat_fim_sal date, salario float(6));

alter table projeto drop localizacao;
alter table projeto add localidade varchar(50);	
alter table projeto add logico bool;																								 

alter table empregado add funcao varchar(30);																								  
alter table empregado rename column nome to nome_completo;																								  
alter table empregado drop dat_init_sal;																								  
									
alter table departamento add descricao_departamento varchar(50);	
alter table departamento add data_criacao date;
alter table departamento rename column nome to nome_departamento;																								  
alter table departamento drop data_criacao;																								  

create table aluno (codigo int, nome varchar(50));	
alter table aluno alter column codigo type float(6), alter column nome type varchar(30);
drop table aluno;

alter table historico_salario drop dat_ini_sal;
alter table historico_salario add salario_total_anual float(2);
alter table historico_salario rename column salario to salario_mensal;										 
		
alter table empregado_projeto add funcao varchar(30);
alter table empregado_projeto add data_inicio date;
alter table empregado_projeto add data_fim date;

alter table departamento_projeto add demanda_de_funcionarios varchar(50);									 
alter table departamento_projeto add horas_destinadas time;	
alter table departamento_projeto rename column codigo to numero;
				
alter table empregado_projeto drop horas; 
alter table empregado_projeto add horas int;
insert into empregado_projeto (codigo, rg_empregado, numero_projeto, horas) 
	values (1, '2020', 5, 10), (2, '2020', 10, 25), (3, '3030', 5, 35), (4, '4040', 20, 50), (5, '5050', 20,35), (6, '8080', 5, 70), (7, '7070', 12, 35), (8, '1010', 12, 12);

alter table historico_salario add dat_ini_sal date;										 
insert into historico_salario (rg, dat_ini_sal, dat_fim_sal, salario_mensal)
	values ('1010', '01/01/2010','30/11/2010', 2000.00), ('1010', '01/12/2010','30/04/2011',4000.00), ('2020', '01/05/2007','31/12/2007', 2500.00), ('2020','01/01/2008','30/11/2010', 4000.00), ('4040','01/08/2008','31/10/2009',1500.00), ('4040','01/11/2009','30/09/2010',2500.00),('4040','01/10/2010','31/10/2012', 3500.00), ('7070','01/01/2008','31/07/2008',1000.00);
											
insert into dependente 	
values (1, '1010', 'Jorge', '1986-12-27', 'Filho','M'), (2, '1010', 'Luiz', '1979-11-18', 'Filho', 'M'), (3, '2020', 'Fernanda Carla','1969-02-14','Cônjuge','F'),(4, '2020', 'Ângelo', '1995-02-10', 'Filho', 'M'), (5,'3030','André', '1990-05-01', 'Filho', 'M'), (6,'8080','Ana Maria', '1980-06-30','Cônjuge', 'F'), (7, '8080', 'Karla Cristina', '1999-08-25', 'Filha', 'F');

alter table empregado add dat_ini_sal date;	
alter table empregado drop depto;
alter table empregado add depto int;										 
insert into empregado (rg, nome_completo, cpf, depto, rg_supervisor, salario, dat_ini_sal)
	values ('1010', 'João Luiz', '11111', 1,null, 6000.00, '2011-05-01'), ('2020', 'Fernanda', '22222', 1, '1010', 5500.00, '2008-12-01'), ('3030', 'Ricardo', '33333',2, '2020', 2300.00, '2010-10-01'), ('4040', 'Jorge', '44444', 2, '3030', 3200.00, '2010-10-01'), ('5050', 'Renata', '55555', 2,'3030', 1300.00, '2012-02-01'), ('6060', 'Luiz Renato', '66666', 3,'2020', 3000.00, '2012-05-01'), ('7070', 'Luiz Fernando', '77777', 3,'6060', 2000.00, '2008-08-01'), ('8080', 'João Antonio', '88888', 1,'2020', 3950.00, '2010-07-01'); 										

											 
insert into departamento (numero, nome_departamento, rg_gerente)
	values (1, 'Contabilidade','1010'), (2, 'Engenharia Civil', '3030'), (3, 'Engenharia Mecânica','2020'), (4, 'Industrial',null);

insert into departamento_projeto (numero, numero_depto, numero_projeto)										 
	values (1,2, 5), (2,3, 10), (3,2,20);	

insert into projeto (numero, nome, localidade)
	values (5,'Financeiro', 'São Paulo'), (10, 'Motor', 'Rio Claro'), (20, 'Prédio Central', 'Campinas'), (25, 'Águas Limpas', 'Vitória');

select nome, localidade, numero from projeto;
select * from projeto where localidade = 'Vitória';									 
select nome, numero from projeto where localidade = 'Vitória';	
select * from projeto where numero > 10;
select * from empregado where salario > 3000;
select * from empregado where rg_supervisor = '1010';
select * from empregado where rg = '4040';		
select * from historico_salario where rg = '4040';		
select * from empregado where rg_supervisor < '2020';
select * from projeto where numero >= 10;
select * from empregado  where rg_supervisor <= '2020';
select * from empregado where rg_supervisor is null;										 
select * from empregado where rg_supervisor is not null;										 
select * from empregado where depto <> 2;						
select nome_completo, cpf, depto from empregado where depto = 2;
select rg, nome_completo from empregado where depto = 1;										 
select nome_completo from empregado where salario > 5500.00;										
select nome_completo from empregado where salario >= 5500.00;	
select * from empregado where dat_ini_sal > '01/02/2012';						 
select * from empregado where dat_ini_sal > '01/05/2012';						 
select nome_completo from empregado where dat_ini_sal >= '01/05/2012';	
select cpf from empregado where dat_ini_sal >= '01/05/2012';	


											 
create table departamento_projeto2 as select * from departamento_projeto;
create table projeto2 as select * from projeto;
create table empregado2 as select * from empregado;
create table departamento2 as select * from departamento;
											 
insert into projeto (numero, nome, localidade)
 	values (50, 'Ginásio de Esporte', 'Serra'),(51, 'Teatro','Vitória');
											 
update projeto set nome = 'Águas Claras' where  numero = 25;
											 
update projeto set nome = 'Águas Limpas' where  numero = 25;
						 
update projeto set localidade = 'Serra' where numero = 10;									 

delete from departamento_projeto;
delete from projeto;
											 
insert into departamento_projeto (numero, numero_depto, numero_projeto)										 
	values (1,2, 5), (2,3, 10), (3,2,20);	
											 
drop table projeto2;
drop table departamento_projeto2;
drop table empregado2;
drop table departamento2;	
											 
alter table projeto add primary key (numero); /* O ideial é colocar o número que identifica aquele projeto*/
alter table empregado add primary key (cpf);
alter table departamento add primary key (numero);
alter table dependente add primary key (codigo);
alter table departamento_projeto add primary key (codigo);
alter table empregado_projeto add primary key (codigo);										 
	
											 
alter table empregado drop constraint empregado_pkey;											 
alter table empregado add primary key (rg);
											 
											 
											 