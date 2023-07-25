
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

## Insertar texto e imágenes

En el menú Insertar > Permite agregar un cuadro de texto al informe.

En el menú Insertar > Permite agregar una imagen al informe.

## Treemap

Ejemplo de treemap en web: 

* https://finviz.com/map.ashx
* https://www.tradingview.com/heatmap/stock/?color=change&dataset=SPX500&group=sector&size=market_cap_basic


## Gráfico de líneas

en el Eje X colocar una fecha con jerarquía: Año > trimestre > mes > día.

En el gráfico aparece arriba a la derecha unas flechas que permiten activar "Modo profundidad".

Al activar el modo profundidad se quita el modo filtro y cuando se hace clic en un Año te abre sus trimestres, cuando se hace clic en trimestre te abre sus meses y así descendiendo hasta el final de la jerarquía.



## Gráfico en cascada

En Categoría se puede añadir un campo categórico como por ejemplo tipo de habitación.

Eje Y variable numérica que se intenta desglosar en forma de cascada por categorías. Ejemplo: num_reservas.

NOTA: probar columna con valores negativos.

## Gráfico de cintas

Gráfico de cintas o Ribbon chart, es una versión avanzada del gráfico de barras apiladas.

En personalizacion del gráfico:

* Activar etiquetas de datos y seleccionar la opción de Unidades ninguno.

* Control deslizante de Zoom equivale a xlim ylim de matplotlib, permite aplicar zoom al gráfico de forma interactiva.

## Gráfico de embudo

Coloca primero la categoría que más valores tiene y a partir de ella calcula porcentajes del resto de valores en otras categorías con respecto a la primera.

Tiene forma de embudo porque aparece primero la categoría que más valores tiene y termina con la que menos.

Ejemplos: campañas de marketing y embudos de ventas.


## Gráfico de jerarquía

* Analizar: aquí se utiliza una variable numérica a analizar
* Explicar por: normalmente se utiliza una jerarquía, como por ejemplo una jerarquía de fechas o ubicaciones ejemplos:
    * Fechas: año, trimestre, mes, día
    * Ubicación: región, país, comunidad, ciudad, código postal
    * Ventas holding empresarial: empresa, tienda, departamento, empleado

Puede ser interesante crear primero una jerarquía en caso de no tenerla. Esto se hace seleccionando un campo cualquiera y en opciones > Crear jerarquía. Luego en el resto de campos en opciones > Añadir jerarquía.


## Segmentación de datos

Crear filtros en el propio gráfico, por ejemplo para filtrar por año o trimestre.

Dar formato a su objeto visual > Configuración de la segmentación > Estilo permite cambiar entre desplegable o lista o slider. 

## Mapas

Archivo > Opciones y configuración > Opciones > Global > Seguridad

Activar visualizaciones de mapas.


## Tablas

Se añade una tabla. Se arrastran los diferentes campos al elemento "Columnas".

En personalizar Formato: 
* Elementos de celda
* Aplicar la configuración > Deja elegir una columna
* Elegir una o varias opciones:
    * Color de fondo
    * Barras de datos
    * Iconos


## Matrices

Similar a las tablas pivotantes de pandas.

Filas:
* Category
* Sub-category

Columnas:
* Año

Valores:
* Sales

## Gráfico de dispersión (scatterplot)

Ejemplo: 

* Valores: Customer Name
* Eje X: Quantity
* Eje Y: Sales

Sobre el gráfico pulsar "Más opciones" y "Buscar clústeres automáticamente" esto crea un nuevo grupo donde permite seleccionar número de clústeres. Si no se especifica el número de clústeres se detecta automáticamente el más óptimo.

Luego para personalizar un clúster o grupo, en Más opciones permite cambiar el nombre y número de clústeres.


## Preguntas y respuestas

Mostrar sugerencias.

Permite escribir en lenguaje natural en inglés la gráfica deseada y la genera.

Permite convertir a objeto visual una vez encontrada.

## Obtener más objetos visuales

Requiere cuenta profesional, se puede crear gratis.

* Radar Chart
* WordCloud
* Sankey (Flow)
* Heatmap


## Gráfico de líneas:

* Línea de constante
* Línea de tendencia
* Línea de Previsión 



## Power Query problemas

Posibles problema al leer un CSV con datos numéricos decimales. 

### Solución 1:

Implica transformar puntos por comas para que detecte la parte decimal:

= Table.ReplaceValue(#"Encabezados promovidos",".",",",Replacer.ReplaceText,{"Open", "High", "Low", "Close", "Adj Close"})

## Solución 2:

Clic derecho > Cambiar Tipo > Configuración regional: 

* Número decimal
* Inglés (Estados Unidos)

Ejemplo: 

= Table.TransformColumnTypes(#"Encabezados promovidos", {{"Open", type number}, {"High", type number}, {"Low", type number}, {"Close", type number}, {"Adj Close", type number}}, "en-US")


## Medidor

* Valor: variable numérica a mostrar en el medidor
* Valor mínimo: por defecto empieza en 0.
* Valor máximo: valor tope a mostrar
* Valor destino: valor al que se quiere llegar

Ejemplo:

* Valor: Profit
* Valor destino: 1000000. Se puede añadir creando una medida.

## KPI

Key Performance Indicator

* Valor: variable numérica a mostrar.
* Eje de tendencia: fecha, tendencia del kpi a lo largo del tiempo.
* Destino: valor deseado, se puede crear con una medida manual.

Depende del eje de tendencia, muestra el último valor o valor más reciente del eje de tendencia.



## Python

### Opción 1: cargar datos de predicciones python en power bi

Paso 1:

Se crea un CSV con los datos y las predicciones.

.to_csv de pandas podemos guardar un DataFrame que contenga predicciones ya hechas en una columna. 

Paso 2:

Se carga el CSV en Power BI como un CSV normal.

### 
