-- CTE 
-- Funcionários com salário maior do que 21900 e que foram contratados no dia 10

-- Com CTE
WITH funcionarios_salarios_mais_altos AS (
	SELECT nome, salario, data_contratacao
	FROM cap03.funcionarios
	WHERE salario > 21900
)
SELECT * 
FROM funcionarios_salarios_mais_altos
WHERE EXTRACT (DAY FROM data_contratacao) = 10;


-- Sem CTE
SELECT nome, salario, data_contratacao
FROM cap03.funcionarios
WHERE salario > 21900 AND EXTRACT (DAY FROM data_contratacao) = 10;

------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SUBCONSULTA 
-- Considerando os funcionários contratados em Janeiro, retorne nome e departamento de quem tem o maior salário

-- Com Subconsulta
SELECT nome, departamento, salario
FROM cap03.funcionarios 
WHERE salario = (SELECT MAX(salario) FROM cap03.funcionarios WHERE EXTRACT(MONTH FROM data_contratacao) = 1)


-- Sem subconsulta
SELECT nome, departamento, MAX(salario)
FROM cap03.funcionarios 
WHERE EXTRACT (MONTH FROM data_contratacao) = 01
GROUP BY nome, departamento
ORDER BY MAX(salario) DESC
LIMIT 1;




