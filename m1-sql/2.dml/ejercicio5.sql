SELECT * FROM sakila.film;

-- coincidencia exacta =
SELECT * FROM sakila.film WHERE description = 'Robot';
SELECT * FROM sakila.film WHERE title = 'ALASKA PHANTOM';
-- contiene texto LIKE
SELECT * FROM sakila.film WHERE `description` LIKE '%Robot%';

-- IN 
SELECT * from CUSTOMER WHERE customer_id IN (1, 4, 5);
SELECT * from CUSTOMER WHERE customer_id = 1 OR customer_id = 4 OR customer_id = 5 OR customer_id = 7;

-- ORDER BY - 10 registros más recientes
-- ASC por defecto, de menos a más
-- DESC, de más a menos 
SELECT * FROM rental ORDER BY rental_date DESC LIMIT 10;
SELECT * FROM rental LIMIT 10;
