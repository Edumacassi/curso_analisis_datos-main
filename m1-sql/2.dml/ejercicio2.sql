
-- Actualizar correo
-- Actualizar el correo electrónico de un cliente en la tabla 'customer' utilizando su ID:

select * from sakila.customer;

UPDATE sakila.customer 
SET email = 'nuevo_email@prueba.com' 
WHERE customer_id = 3;
