-- Filtrando todos os clientes e suas vendas.
SELECT * 
FROM orders AS o
INNER JOIN customers AS c
ON o.customer_id = c.customer_id;

-- Filtrando todos os clientes e suas vendas no ano de 1996.
SELECT * 
FROM orders AS o
INNER JOIN customers AS c
ON o.customer_id = c.customer_id
WHERE EXTRACT(YEAR FROM o.order_date) = 1996;

-- Filtrando todos os funcionários, junto com os clientes que moram na mesma cidade.
SELECT e.employee_id, e.last_name, c.contact_name, e.city, c.city
FROM employees AS e
LEFT JOIN customers AS c
ON e.city = c.city
ORDER BY e.employee_id;

-- Filtrando o número de funcionários e clientes de cada cidade que tem funcionários.
SELECT e.city,
	COUNT(DISTINCT(e.employee_id)) AS quantidade_funcionarios,
	COUNT(DISTINCT(c.customer_id)) AS quantidade_clientes
FROM employees AS e
LEFT JOIN customers AS c ON e.city = c.city
GROUP BY e.city
ORDER BY e.city;

-- Filtrando todas as cidades com funcionários e/ou clientes, junto com a quantidade de cada um em cada cidade.
SELECT COALESCE(e.city, c.city),
	COUNT(DISTINCT(e.employee_id)) AS quantidade_funcionarios,
	COUNT(DISTINCT(c.customer_id)) AS quantidade_clientes
FROM employees AS e
FULL JOIN customers AS c ON e.city = c.city
GROUP BY e.city, c.city
ORDER BY e.city;

















