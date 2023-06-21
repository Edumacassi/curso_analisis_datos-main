
-- Añadir una columna 'last_update' sobre una tabla 
-- para almacenar la fecha y hora de la última actualización del registro:

-- agregar columna last_update

ALTER TABLE sakila.customer_film_favorites
ADD COLUMN last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

SELECT * FROM sakila.customer_film_favorites;