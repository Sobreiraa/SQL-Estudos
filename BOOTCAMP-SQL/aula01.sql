-- Quantidade de países diferentes
SELECT DISTINCT(country) FROM customers;

-- Filtrando resultados onde o país seja o México
SELECT * FROM customers 
WHERE country = 'Mexico';

-- Filtrando o país 'Germany' e a cidade 'Berlin'
SELECT * FROM customers
WHERE country = 'Germany' AND city = 'Berlin';

--  Filtrando os países que não são da Alemanha
SELECT * FROM customers 
WHERE country <> 'Germany';

-- Filtrando o país 'Germany' e a cidade 'Berlin' e 'Aachen'
SELECT * FROM customers 
WHERE country = 'Germany' AND (city='Berlin' OR city='Aachen');

-- Filtrando os produtos com preço menor que 20
SELECT * FROM products
WHERE unit_price < 20;

-- Filtrando os produtos com preço entre 50 e 100 reais
SELECT * FROM products
WHERE unit_price > 50 AND unit_price < 100;

-- Filtrando os clientes onde a região está com valores nulos
SELECT * FROM customers
WHERE region IS NULL;

-- Filtrando os clientes onde a região NÃO está com valores nulos
SELECT * FROM customers
WHERE region IS NOT NULL;

-- Filtrando os clientes que começam com a letra A
SELECT * FROM customers 
WHERE UPPER(contact_name) LIKE 'A%';

SELECT * FROM customers 
WHERE contact_name ILIKE 'A%';

-- Filtrando os clientes que terminam com a letra a
SELECT * FROM customers 
WHERE contact_name LIKE '%a';

-- Filtrando os clientes que tem 'or' entre seu nome
SELECT * FROM customers
WHERE contact_name ILIKE '%or%';

-- Filtrando os clientes que começa com A e termina com O
SELECT * FROM customers
WHERE contact_name ILIKE 'A%O%';

-- Filtrando clientes da Alemanha, Franca ou Reino Unido
SELECT * FROM customers
WHERE country IN ('Germany', 'France', 'UK');

-- Filtrando clientes que NÃO são da Alemanha, Franca ou Reino Unido
SELECT * FROM customers
WHERE country NOT IN ('Germany', 'France', 'UK');

-- Filtrando os produtos onde o valor fica entre 50 e 100;
SELECT * FROM products
WHERE unit_price BETWEEN  50 AND 100; 

-- Filtrando o produto com menor preço
SELECT product_name, MIN(unit_price) AS preco_minimo
FROM products
GROUP BY product_name
ORDER BY MIN(unit_price) ASC
LIMIT 1;

-- Filtrando o produto com maior preço
SELECT product_name, MAX(unit_price) AS preco_minimo
FROM products
GROUP BY product_name
ORDER BY MAX(unit_price) DESC
LIMIT 1;






