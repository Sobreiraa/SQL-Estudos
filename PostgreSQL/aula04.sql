-- Calculando:
-- Quantos produtos únicos dentro do mesmo pedido;
-- Quantidade de peças vendidas por pedido;
-- Valor total vendido por pedido.
SELECT 
	order_id,
	COUNT(DISTINCT product_id) AS produtos_unicos,
	SUM(quantity) AS total_de_produtos,
	SUM(quantity * unit_price) AS total_pago
FROM order_details
GROUP BY order_id
ORDER BY order_id;

-- Windows Function
SELECT 
	DISTINCT order_id,
	COUNT(order_id) OVER (PARTITION BY order_id) AS produtos_unicos,
	SUM(quantity)  OVER (PARTITION BY order_id) AS total_de_produtos,
	SUM(quantity * unit_price) OVER (PARTITION BY order_id) AS total_pago
FROM order_details
ORDER BY order_id;



-- Selecionando os valores mínimo, máximo e médio de frete pago por cada cliente
SELECT 
	customer_id,
	AVG(freight),
	AVG(freight),
	MAX(freight)
FROM orders
GROUP BY customer_id
ORDER BY customer_id;

-- Windows Function
SELECT 
	DISTINCT(customer_id),
	AVG(freight) OVER (PARTITION BY customer_id),
	AVG(freight) OVER (PARTITION BY customer_id),
	MAX(freight) OVER (PARTITION BY customer_id)
FROM orders
ORDER BY customer_id;



-- Classificando os produtos mais venvidos POR order ID
SELECT p.product_id,
	   p.product_name,
	   SUM(o.unit_price * o.quantity) AS total_de_vendas
FROM 
	   order_details AS o
INNER JOIN 
	   products p ON p.product_id = o.product_id
GROUP BY 
	   p.product_id, p.product_name
ORDER BY 
       SUM(o.unit_price * o.quantity) DESC;

-- Windows Function 
SELECT  
	  o.order_id, 
	  p.product_name, 
	  (o.unit_price * o.quantity) AS total_de_vendas,
	  ROW_NUMBER() OVER (ORDER BY (o.unit_price * o.quantity) DESC) AS order_rn, 
	  RANK() OVER (ORDER BY (o.unit_price * o.quantity) DESC) AS order_rank, 
	  DENSE_RANK() OVER (ORDER BY (o.unit_price * o.quantity) DESC) AS order_dense
FROM  
  	  order_details o
JOIN 
  	  products p ON p.product_id = o.product_id;













