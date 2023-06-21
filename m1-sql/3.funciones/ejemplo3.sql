
-- Funciones cadena

-- CONCAT sobre firstname y lastname de sakila.customer
select * from customer;
SELECT customer_id, CONCAT(first_name, ' ', last_name) as full_name, email 
FROM sakila.customer;
