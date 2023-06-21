/*
Tabla reseña de película
Crear una tabla para almacenar reseñas de películas:

*/

USE sakila;
SELECT * FROM sakila.film;
SELECT * from sakila.customer;
select * from sakila.film_reviews;
CREATE TABLE film_reviews (
	id INT AUTO_INCREMENT PRIMARY KEY,
    film_id smallint unsigned NOT NULL,
    customer_id smallint unsigned NOT NULL,
	content TEXT,
    rating INT,
    creation_datetime datetime,
    foreign key (film_id) references film (film_id),
    foreign key (customer_id) references customer (customer_id)
);

