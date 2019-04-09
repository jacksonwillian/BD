/* Self Join */ 

select emp1.nome_completo as nome_funcionario, emp2.nome_completo as nome_gerente 
from empregado as emp1 inner join empregado as emp2 on (emp1.rg = emp2.rg_supervisor) order by emp1.nome_completo asc;

/* Views */

create view empregado_rg_e_nome_funcionario as select emp.rg as matricula, emp.nome_completo as nome_funcionario from empregado as emp where emp.salario >= 2000 and emp.salario <= 3500;
create view dependente_relacao_quantidade as select dep.relacao, count(dep.relacao) as quantidade from dependente as dep group by dep.relacao;
create view dependente_sexo_quantidade as select dep.sexo, count(dep.sexo) as quantidade from dependente as dep group by dep.sexo

