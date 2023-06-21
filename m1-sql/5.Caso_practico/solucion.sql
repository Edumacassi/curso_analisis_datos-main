
-- 1. Crear base de datos
DROP schema IF exists `m1_caso_practico`;
CREATE SCHEMA `m1_caso_practico`;
USE `m1_caso_practico`;

-- Opción 1: clientes, productos, pedidos, detalles_pedidos
-- Opción 2: autores, libros, clientes, prestamos

CREATE TABLE autores (
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellidos VARCHAR(100),
    fecha_nacimiento DATE
);

CREATE TABLE libros (
	id_libro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(250),
    editorial VARCHAR (100),
    category VARCHAR (50),
    num_paginas INT,
    precio DECIMAL(12, 2), 
    id_autor INT, -- crear columna
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor) -- añadir fk a columna id_autor de libros
);
-- https://dev.mysql.com/doc/refman/8.0/en/integer-types.html
CREATE TABLE usuarios (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nif VARCHAR(9),
    email VARCHAR(50) UNIQUE,
    fecha_alta DATE,
    codigo_postal VARCHAR(5),
    UNIQUE KEY `usuarios_nif_unique` (`nif`)
);

CREATE TABLE prestamos (
	id_prestamo INT PRIMARY KEY AUTO_INCREMENT, 
    id_libro INT,
    id_usuario INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    recargo DECIMAL(12, 2) DEFAULT 0.0,
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
/*
CREATE TABLE prestamos (
    id_libro INT,
    id_usuario INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    recargo DECIMAL(12, 2) DEFAULT 0.0,
    PRIMARY KEY(id_libro, id_usuario, fecha_inicio), -- explorar clave primaria compuesta usando fecha inicio para que un usuario no pueda reservar un mismo libro dos veces  en el mismo día
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
*/
select * from autores;
select * from libros;
select * from usuarios;
select * from prestamos;


-- Many To One desde Book hacia Author
-- One To Many desde Author hacia Book

-- INSERTAR 
INSERT INTO autores (nombre, apellidos, fecha_nacimiento) VALUES 
('author1', 'apellido1', '1980-01-01'),
('author2', 'apellido2', '1980-01-01'),
('author3', 'apellido3', '1980-01-01'),
('author4', 'apellido4', '1983-01-01'),
('author5', 'apellido5', '1983-01-01'),
('author6', 'apellido6', '1985-01-01'),
('author7', 'apellido6', '1985-01-01'),
('author8', 'apellido6', '1985-01-01')
;

INSERT INTO libros (titulo, editorial, category, num_paginas, precio, id_autor) VALUES
('Ejemplo libro antiguo', 'Planeta', 'Novela', 250, 19.99, 1),
('Ejemplo libro moderno', 'Anaya', 'Tecnico', 500, 39.99, 1),
('Ensayos varios', 'Planeta', 'Ensayo', 432, 9.99, 2),
('Poemas', 'Planeta', 'Novela', 250, 19.99, 3),
('Periodico semanal', 'Planeta', 'Novela', 250, 19.99, 3),
('Ejemplo libro antiguo', 'Planeta', 'Novela', 250, 19.99, 3)
;

INSERT INTO usuarios (nif, email, fecha_alta, codigo_postal) VALUES
('1111111A', 'user1@gmail.com', '2015-01-01', '28003'),
('2222222B', 'user2@gmail.com', '2016-01-01', '28002'),
('3333333C', 'user3@gmail.com', '2015-02-01', '44500'),
('4444444D', 'user4@gmail.com', '2015-03-01', '24001'),
('5555555E', 'user5@gmail.com', '2015-04-01', '33020')
;
-- sin recargo
INSERT INTO prestamos (id_libro, id_usuario, fecha_inicio, fecha_fin) VALUES 
(1, 2, '2023-04-10', '2023-04-18')
;


-- con recargo
INSERT INTO prestamos (id_libro, id_usuario, fecha_inicio, fecha_fin, recargo) VALUES 
(1, 2, '2023-04-10', '2023-04-18', 0.0),
(2, 3, '2023-04-10', '2023-04-18', 2.34),
(3, 4, '2023-04-11', '2023-04-19', 0.0),
(2, 5, '2023-04-14', '2023-04-23', 3.0)
;


-- CONSULTAS
select * from autores;
select * from libros;
select * from usuarios;
select * from prestamos;

-- 1. Tabla autores
-- select por nombre like
-- select count por año de nacimiento
select 
EXTRACT(YEAR FROM fecha_nacimiento) as birth_year, 
count(*) as total_authors
from autores 
GROUP BY EXTRACT(YEAR FROM fecha_nacimiento);

-- 2. tabla libros
select * from libros;
-- select por titulo like
-- count por editorial o por category
select count(*) from libros;
select editorial, count(*) as count_books from libros GROUP BY editorial;
select category, count(*) as count_books from libros GROUP BY category;

-- sum de precio por editorial
select editorial, sum(precio) as precio_total from libros GROUP BY editorial;
select editorial, round(avg(precio), 2) as precio_medio from libros GROUP BY editorial;

-- avg de precio por nombre de autor
select * 
from libros
JOIN autores ON libros.id_autor = autores.id_autor;

select autores.nombre, sum(precio), avg(precio), sum(num_paginas), avg(num_paginas)
from libros
JOIN autores ON libros.id_autor = autores.id_autor GROUP BY autores.nombre;

-- max o avg por num_paginas

-- qué autor tiene más libros: max count por autor
select autores.nombre as nombre_autor, count(*) as count_libros
from libros
JOIN autores ON libros.id_autor = autores.id_autor GROUP BY autores.nombre;

select nombre_autor, max(count_libros) from 
(
select autores.nombre as nombre_autor, count(*) as count_libros
from libros
JOIN autores ON libros.id_autor = autores.id_autor GROUP BY autores.nombre
) 
as result;

SELECT autores.nombre AS nombre_autor, COUNT(*) AS count_libros
FROM libros
JOIN autores ON libros.id_autor = autores.id_autor
GROUP BY autores.nombre
HAVING COUNT(*) = (
    SELECT MAX(count_libros)
    FROM (
        SELECT id_autor, COUNT(*) AS count_libros
        FROM libros
        GROUP BY id_autor
    ) AS max_count
);

SELECT autores.nombre AS nombre_autor, COUNT(*) AS count_libros
FROM libros
JOIN autores ON libros.id_autor = autores.id_autor
GROUP BY autores.nombre
HAVING count_libros = (
    SELECT MAX(count_libros)
    FROM (
        SELECT id_autor, COUNT(*) AS count_libros
        FROM libros
        GROUP BY id_autor
    ) AS max_count
);

-- Utilizando una CTE Common Table Expression
WITH conteo_libros AS (
    SELECT autores.nombre AS nombre_autor, COUNT(*) AS count_libros
    FROM libros
    JOIN autores ON libros.id_autor = autores.id_autor
    GROUP BY autores.nombre
)
-- Funciones ventana
SELECT nombre_autor, count_libros
FROM (
    SELECT autores.nombre AS nombre_autor, COUNT(*) AS count_libros, RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking
    FROM libros
    JOIN autores ON libros.id_autor = autores.id_autor
    GROUP BY autores.nombre
) AS conteo_ranking
WHERE ranking = 1;

SELECT nombre_autor, count_libros
FROM conteo_libros
WHERE count_libros = (SELECT MAX(count_libros) FROM conteo_libros);


select id_autor, count(*) as count_libros
from libros GROUP BY id_autor;
-- TODO: probar a traer en dos subconsultas


-- 3. tabla usuarios
-- count de altas por mes
-- count por código postal

-- 4. tabla prestamos
select * from prestamos;

-- count por mes
-- sum recargo
-- max sum recargos group by user
select sum(recargo) from prestamos;
select id_usuario, sum(recargo) as recargo_euros  from prestamos GROUP BY id_usuario;
select id_usuario, sum(recargo) as recargo_euros  from prestamos GROUP BY id_usuario HAVING recargo_euros > 0;


-- avg (count por usuario) group by year
-- count por autor
-- max count libro





