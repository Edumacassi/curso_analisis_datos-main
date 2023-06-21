-- Tabla películas favoritas
-- Crear una tabla para almacenar información de películas favoritas de los clientes.
-- La tabla debe llamarse customer_favorites.

CREATE TABLE IF NOT exists sakila.customer_film_favorites(
	film_id smallint unsigned NOT NULL,
    customer_id smallint unsigned NOT NULL,
    position INT NOT NULL,
    creation_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(film_id, customer_id),
    CONSTRAINT `fk_favorite_film` FOREIGN KEY (`film_id`) REFERENCES `sakila`.`film` (`film_id`),
    CONSTRAINT `fk_favorite_customer` FOREIGN KEY (`customer_id`) REFERENCES `sakila`.`customer`(`customer_id`)
);
SELECT * FROM sakila.customer_film_favorites;
SELECT * FROM sakila.customer_film_favorites;
INSERT INTO `sakila`.`customer_film_favorites` (`film_id`, `customer_id`, `position`) VALUES ('1', '1', '0');
