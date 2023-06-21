import numpy as np
import urllib

# Cargar el dataset desde la URL
url = "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
response = urllib.request.urlopen(url)
data = np.genfromtxt(response, delimiter=",", usecols=(0, 1, 2, 3))

# Estadísticas básicas
# Calcular la media, mediana y desviación estándar de la columna de longitud del pétalo (índice 2)
mean_petal_length = np.mean(data[:, 2])
median_petal_length = np.median(data[:, 2])
std_petal_length = np.std(data[:, 2])

print("Media de longitud del pétalo:", mean_petal_length)
print("Mediana de longitud del pétalo:", median_petal_length)
print("Desviación estándar de longitud del pétalo:", std_petal_length)

# Búsqueda
# Encontrar el índice de la flor con la longitud del pétalo más larga (índice 2)
max_petal_length_index = np.argmax(data[:, 2])
max_petal_length = data[max_petal_length_index, 2]
print("Índice de la longitud del pétalo más larga:", max_petal_length_index)
print("Longitud del pétalo más larga:", max_petal_length)

# Ordenación
# Ordenar los datos por la columna de longitud del sépalo (índice 0)
sorted_data = data[data[:, 0].argsort()]

print("Datos ordenados por longitud del sépalo:")
print(sorted_data)