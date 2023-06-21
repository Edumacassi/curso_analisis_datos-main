SELECT * FROM sakila.film;

-- Funciones agregación

-- COUNT
select count(film_id) from sakila.film;
select count(*) from sakila.film; -- todas las películas
select count(*) from sakila.film where length <= 70; -- todas las películas de menos 70 minutos
select count(*) as num_peliculas_cortas from sakila.film where length <= 70; 


-- SUM
select * from payment;
-- total vendido
select sum(amount) from payment;
select sum(amount) as gross_income from payment;
select sum(amount) as gross_income from payment WHERE staff_id = 1; -- 33489
select sum(amount) as gross_income from payment WHERE staff_id = 2; -- 33927


-- AVG
select * from payment;
-- dinero medio gastado en cada alquiler
select avg(amount) from payment;

-- GROUP BY
select * from sakila.film;
-- calcular la duracion media de las peliculas
select avg(length) from sakila.film;

-- calcular la duracion media de las peliculas agrupadas por rating
select rating, avg(length) from sakila.film GROUP BY rating;
select rating, avg(length) as duracion_media from sakila.film GROUP BY rating;
select rating, avg(length) as duracion_media from sakila.film GROUP BY rating ORDER BY duracion_media DESC;

-- contar clientes por país
select * from customer;

SELECT country.country, count(*) as num_clientes
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
GROUP BY country.country ORDER BY num_clientes DESC;



