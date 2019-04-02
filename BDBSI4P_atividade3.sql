

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
select empregado.nome_completo, count(empregado_projeto.rg_empregado) from empregado inner join empregado_projeto on (empregado_projeto.rg_empregado = empregado.rg) group by empregado.nome_completo, empregado_projeto.rg_empregado;
select empregado.nome_completo, empregado_projeto.rg_empregado, sum(empregado_projeto.horas) as horas_tranalhadas from empregado inner join empregado_projeto on (empregado_projeto.rg_empregado = empregado.rg) group by empregado.nome_completo,empregado_projeto.rg_empregado order by horas_tranalhadas desc;
select departamento.nome_departamento,  count(empregado.depto) as quant_funcionarios from departamento inner join empregado on (departamento.numero = empregado.depto) group by departamento.nome_departamento,  empregado.depto
select departamento.nome_departamento,  count(empregado.depto) as quant_funcionarios from departamento inner join empregado on (departamento.numero = empregado.depto) group by departamento.nome_departamento,  empregado.depto having  count(empregado.depto) >= 2
select departamento.nome_departamento, sum(empregado.salario) from departamento inner join empregado on (departamento.numero = empregado.depto) group by departamento.nome_departamento, empregado.depto having sum(empregado.salario) > 6000;

/* PARTE 3 */

select empregado.nome_completo from empregado where empregado.rg in ( select distinct departamento.rg_gerente from departamento where departamento.rg_gerente is not null);
select empregado.nome_completo from empregado where empregado.rg in (select distinct historico_salario.rg from historico_salario where historico_salario.rg is not null);
select empregado.nome_completo from empregado where empregado.rg not in (select distinct historico_salario.rg from historico_salario where historico_salario.rg is not null);
