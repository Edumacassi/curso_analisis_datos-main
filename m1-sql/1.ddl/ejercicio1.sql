
-- Crear una tabla employee

SELECT * FROM curso_analisis.employee;

CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `nif` varchar(9) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif_UNIQUE` (`nif`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

INSERT INTO `curso_analisis`.`employee` (`first_name`, `nif`, `email`, `birthday`) 
VALUES ('Alan', '666666G', 'alan@ejemplo.com', '2023-01-01');
INSERT INTO `curso_analisis`.`employee` (`first_name`, `nif`, `email`, `birthday`) VALUES ('Prueba', '343434Y', 'PRUEBA2@PRUEBA.COM', '2021-01-01');

SELECT * FROM sakila.film;
