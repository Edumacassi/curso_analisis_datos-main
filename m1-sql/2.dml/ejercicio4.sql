



select * from sakila.customer; -- el cliente tiene un address_id
select * from sakila.address; -- el address tiene un city_id
SELECT * FROM sakila.city; -- el city tiene un country_id
SELECT * FROM sakila.country; -- el country

use sakila;

-- DML: CONSULTA SELECT para traer datos de 4 tablas distintas en la misma consulta: 
-- customer, address, city, country


-- Caso 1. JOIN de customer con address ( 2 tablas )
SELECT *
FROM customer JOIN address ON customer.address_id = address.address_id;

-- Optimización: en vez de * utilizamos proyecciones para traer solo las columnas necesarias
SELECT first_name, last_name, address, district
FROM customer JOIN address ON customer.address_id = address.address_id;





-- Caso 2: JOIN de customer, address, city ( 3 tablas ) 
SELECT *
FROM customer 
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id;

SELECT customer.email, address.address, city
FROM customer 
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id;


-- Caso 3: JOIN de customer, address, city, country ( 4 tablas)
SELECT *
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;


SELECT email, address, city, country
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

-- FROM tabla1
-- JOIN tabla2 ON tabla1.columna_clave_foranea = tabla2.columna_clave_primaria

-- Filtrar sobre los datos
SELECT email, address, city, country
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Argentina';


SELECT email, address, city, country
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country_id = 1;