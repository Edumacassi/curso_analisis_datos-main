
# Microsoft Power BI Desktop

Desde Microsoft Store instalar Power BI Desktop

ETL

* Extract: extraer datos de fuentes de datos, sql, csv, excel, json

* Transform: transformaciones sobre datos

* Load: carga en una base de datos con una estructura analítica: estrella o copo de nieve

## MySQL

Debe usarse una versión compatible de MySQL, ver aquí: 

https://learn.microsoft.com/es-es/power-query/connectors/mysql-database

Requisito tope: 8.0.26, versiones superiores puede dar problemas.


## Datasets para Power BI:

* Cargar datos demo, opción incorporada en el propio Power BI
* https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand


## Cargar datos


Obtener datos > Texto o CSV > Elegir archivo CSV.

Transformar datos y comprobar que estén todos bien.

Para ver los datos completos será necesario activar la opción:

Generación de perfiles de columnas en función del conjunto de datos completo.

## Reemplazar errores

Si hay errores se puede hacer lo siguiente:

* Clic derecho sobre la columna que tenga error y Reemplazar errores o eliminar errores.

En el panel de pasos aplicados aparecerá la transformación. Se puede modificar su nombre.


## Mostrar distribuciones y calidad de las columnas

En el menú Vista se puede marcar las opciones: 

* Distribución de columnas
* Calidad de columnas
* Perfil de columna

NOTA: si hay muchos datos puede tardar en cargar.

## Operación sobre una columna

Seleccionar una columna numérica, y en el menú transformar permite aplicar una operación arimética, como una multiplicación.

## Operaciones entre varias columnas

Seleccionar con Control + Clic las columnas deseadas

Pulsamos menú Agregar columna

Pulsar la opción estándar: operación Agregar.

Nota: si la opción estándar está deshabilitada puede ser por haber seleccionado columna texto.

## Ocultar una columna o tabla

Desde la Vista de datos o Vista de modelo se pueden ocultar columnas o tablas. Eso sirve para que no aparezcan en la Vista de Informe.

## Gráficos de barras

En el eje X o Y donde esté la variable categórica por la que agrupar, si esta es un número Power BI puede representarla de forma continua, por ejemplo números 1 a 52 las semanas del año.

Dar formato a su objeto visual

Eje X > Tipo categórico

## Ordenación

Al seleccionar un gráfico salen los 3 puntos de menú de opciones, una de esas opciones es ordenar, se puede ordenar ascendente o descendente en base a los datos del gráfico.

## Etiquetas de datos

Dar formato a su objeto visual

Seleccionar la opción Etiquetas de datos.

Esto muestra los números encima de cada barra.

## Colores

https://coolors.co/

En gráficas de barras:

Dar formato a su objeto visual > Columnas > Color

## Medidas DAX

Seleccionar: Nueva medida y rellenar con una fórmula DAX.

Ejemplos: 

* num_reservas = COUNTROWS(hotel_bookings)
* sum_is_canceled = SUM(hotel_bookings[is_canceled])
* % cancelations = DIVIDE([sum_is_canceled], [num_reservas])

Para que los datos se muestren correctamente en una tarjeta, es posible necesitar cambiar formatos, en el menú de arriba es posible seleccionar opciones: 

* Permite mostrar los valores de esta columna usando la coma como separadores de miles.
* Permite mostrar los valores de esta columna en porcentajes.

## Crear tabla para medidas DAX

En la Vista de modelo, en el menú superior hay una opción Nueva tabla.

Podemos llamar Medidas a la nueva tabla.

Se genera con una columna por defecto que podemos ocultar del modelo.

En la vista de informe, al seleccionar una medida, permite cambiar la tabla a la que pertenece.

Es común crear una tabla Medidas para agrupar/ordenar todas las medidas que se van creando en un dashboard de power bi.

## Jerarquías de fechas

Si una columna tiene formato de fecha, entonces en la Vista de informe aparece como una jerarquía que se puede desglosar y es posible elegir partes de la fecha como el Año, mes, día.

Como el mes forma parte de la fecha es capaz de detectar el orden correcto de los meses.

## Crear nueva columna

Seleccionar la tabla deseada.

Clic derecho > Nueva columna.

Con una expresión DAX, se puede crear una nueva columna, ejemplo:

arrival_date_month_number = SWITCH(hotel_bookings[arrival_date_month], "January", 1, "February", 2, "March", 3, "April", 4, "May", 5, "June", 6, "July", 7, "August", 8, "September", 9, "October", 10, "November", 11, "December", 12)

Con esta nueva columna, se puede utilizar junto con arrival_date_month ambas como eje X de un gráfico de barras. Al ordenar habrá que seleccionar ascendente por arrival_date_month_number arrival_date_month.

En el eje X tiene que estar primero arrival_date_month_number para que pueda ordenar bien.


## Filtros

Filtro básico: permite seleccionar elementros concretos.

Filtro avanzado: filtrar por lógica booleana y comparaciones

Filtro Top N: sacar los 5 valores más altos o más bajos
