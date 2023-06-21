
-- Funciones fechas

-- GROUP BY de payment amount por Año
select * from payment;

select EXTRACT(YEAR FROM payment_date) as fiscal_year, sum(amount) as total_sales
from sakila.payment 
GROUP BY EXTRACT(YEAR FROM payment_date);

-- GROUP BY de payment amount por mes
select EXTRACT(MONTH FROM payment_date) as fiscal_month, sum(amount) as total_sales
from sakila.payment 
GROUP BY EXTRACT(MONTH FROM payment_date) ORDER BY total_sales DESC;

