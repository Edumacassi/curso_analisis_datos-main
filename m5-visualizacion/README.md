
# Visualización de datos

## Pandas

* Líneas: df['column1'].plot()
* Barras: df['column1'].plot(kind='bar')
* Histograma: df.hist()

## Matplotlib

### Gráficos

* Líneas: plt.plot()
* Barras: plt.bar() y plt.barh()
* Histograma: plt.hist()
* Dispersión o puntos: plt.scatter()
* Tarta: plt.pie()
* Caja: plt.boxplot()
* Violín: plt.violinplot()
* Mapa de calor, imágenes, correlación: plt.imshow()

### Personalización

* plt.title()
* plt.xlabel()
* plt.ylabel()
* plt.grid()
* plt.figure()
* plt.rcParams()
* plt.style.use()
* plt.legend()
* plt.colorbar()

### Acciones

Mostrar gráfico:
* plt.show()

Guardar gráfico:
* plt.savefig('example1.png', dpi=300)
* plt.savefig('example1.pdf')
* plt.savefig('example1.svg')
* plt.savefig('example1.webp')


## Seaborn

Carga de datos:

* sns.get_dataset_names()
* sns.load_dataset()

Gráficos:


* sns.displot(): 
    * kde=True: muestra las barras con una curva
    * hue: colorea los datos en base a una columna
    * col: separa datos en columnas
    * kind="kde": muestra solo la curva
    * x, y
    * CUIDADO: no confundir con distplot()

* sns.jointplot(): compara dos variables al mismo tiempo con puntos (scatter) junto con sus distribuciones

* sns.kdeplot()

* sns.pairplot(): scatter pero con todas las combinaciones de columnas.
    * CUIDADO: puede tardar en ejecutar si tenemos muchos datos. Utilizar df.sample()

* sns.relplot():
    * hue
    * col
    * row
    * size
    * palette
* sns.scatterplot()



Personalizaciones de seaborn:

* ax.bar_label

## Plotly

https://plotly.com/python/getting-started/

pip install plotly


## Datasets

* diamonds
* titanic
* avocado prices: https://www.kaggle.com/datasets/neuromusic/avocado-prices
* Netflix shows: https://www.kaggle.com/datasets/shivamb/netflix-shows
* Uber: https://www.kaggle.com/datasets/yasserh/uber-fares-dataset


