SELECT * FROM corporativo.lotacao

SELECT * FROM corporativo.departamento

SELECT * FROM corporativo.funcionario

SELECT * FROM corporativo.cargo

SELECT nome, pretensao_salarial
FROM corporativo.funcionario

SELECT nome
FROM corporativo.funcionario
ORDER BY nome ASC

SELECT nome, pretensao_salarial
FROM corporativo.funcionario
ORDER BY pretensao_salarial DESC

SELECT * 
FROM corporativo.funcionario 
WHERE pcd

SELECT * FROM corporativo.funcionariO

SELECT nome, pretensao_salarial
FROM corporativo.funcionario
WHERE pretensao_salarial > 3000

SELECT nome, pretensao_salarial, pcd
FROM corporativo.funcionario
WHERE pretensao_salarial >= 5000 AND pcd

SELECT MAX (pretensao_salarial)
FROM corporativo.funcionario

SELECT nome
FROM corporativo.funcionario
WHERE pretensao_salarial = (
    SELECT MAX(pretensao_salarial)
    FROM corporativo.funcionario
)

SELECT DISTINCT funcionario.nome, cargo.nome, lotacao.salario
FROM corporativo.lotacao
INNER JOIN corporativo.cargo ON cargo.id = lotacao.id_cargo
INNER JOIN corporativo.funcionario ON funcionario.id = lotacao.id_funcionario

SELECT DISTINCT funcionario.nome, cargo.nome, departamento.nome
FROM corporativo.lotacao
INNER JOIN corporativo.cargo ON cargo.id = lotacao.id_cargo
INNER JOIN corporativo.funcionario ON funcionario.id = lotacao.id_funcionario
INNER JOIN corporativo.departamento ON departamento.id = lotacao.id_departamento

SELECT funcionario.nome, lotacao.salario
FROM corporativo.funcionario
INNER JOIN corporativo.lotacao ON funcionario.id = lotacao.id_funcionario
INNER JOIN corporativo.cargo ON lotacao.id_cargo = cargo.id
WHERE cargo.nome = 'Analista de Dados'
OR cargo.nome = 'Analista Contábil'

