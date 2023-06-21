

-- Funciones matemáticas

-- ROUND
select rating, avg(length) as duracion_media from sakila.film GROUP BY rating;
select rating, round( avg(length), 2 ) as duracion_media from sakila.film GROUP BY rating;
select rating, round( avg(length), 0 ) as duracion_media from sakila.film GROUP BY rating;
