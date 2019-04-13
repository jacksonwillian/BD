/* Self Join */ 
select emp1.nome_completo as nome_funcionario, emp2.nome_completo as nome_gerente 
from empregado as emp1 inner join empregado as emp2 on (emp1.rg = emp2.rg_supervisor) order by emp1.nome_completo asc;

/* Views */
create view empregado_rg_e_nome_funcionario as select emp.rg as matricula, emp.nome_completo as nome_funcionario from empregado as emp where emp.salario >= 2000 and emp.salario <= 3500;
create view agrupamento_dependente_relacao as select dep.relacao, count(dep.relacao) as quantidade from dependente as dep group by dep.relacao;
create view agrupamento_dependente_sexo as select dep.sexo, count(dep.sexo) as quantidade from dependente as dep group by dep.sexo;
create view agrupamento_empregado_projetos as select emp.nome_completo as nome_funcionario, count(empproj.rg_empregado) as quantidade_projetos from empregado as emp inner join empregado_projeto as empproj on (emp.rg = empproj.rg_empregado) group by emp.nome_completo, empproj.rg_empregado;
create view soma_salario_empregados as select sum(empregado.salario) from empregado;
create view tres_primeiros_empregados as select * from empregado order by empregado.salario desc limit 3;
create view empregados_sem_supervisor as select emp.rg, emp.cpf,emp.rg_supervisor,emp.nome_completo from empregado as emp where emp.rg_supervisor is null;
create view empregados_com_historico_Salario as select distinct emp.nome_completo from empregado as emp inner join historico_salario as histsal on (histsal.rg = emp.rg);
create view juncao_depproj_proj as select * from departamento_projeto as depproj right outer join projeto as proj on (proj.numero = depproj.numero_projeto);
