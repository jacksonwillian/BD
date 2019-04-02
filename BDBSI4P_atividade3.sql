

/* PARTE 1 */
select relacao from dependente group by relacao;
select sexo from dependente group by sexo;
select count(sexo), sexo from dependente group by sexo;
select 	max(salario) from empregado;	
select min(salario) from empregado;
select sum(salario) from empregado;
select depto, sum(salario) from empregado group by depto;
select avg(salario), sum(salario),max(salario), min(salario),stddev(salario) from empregado;

/* PARTE 2 */

select empregado.nome_completo, count(dependente.rg_responsavel) from empregado inner join dependente on (dependente.rg_responsavel = empregado.rg) group by dependente.rg_responsavel, empregado.nome_completo;

