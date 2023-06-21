import numpy as np
import urllib

# Cargar el dataset desde la URL
url = "https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv"
response = urllib.request.urlopen(url)
data = np.genfromtxt(response, delimiter=";", skip_header=1)

# Estadísticas básicas
# Calcular la media, mediana y desviación estándar de la columna de alcohol (índice 10)
mean_alcohol = np.mean(data[:, 10])
median_alcohol = np.median(data[:, 10])
std_alcohol = np.std(data[:, 10])

print("Media de alcohol:", mean_alcohol)
print("Mediana de alcohol:", median_alcohol)
print("Desviación estándar de alcohol:", std_alcohol)

# Búsqueda
# Encontrar el índice de la calidad de vino más alta (índice 11)
max_quality_index = np.argmax(data[:, 11])
max_quality = data[max_quality_index, 11]
print("Índice de la calidad de vino más alta:", max_quality_index)
print("Calidad de vino más alta:", max_quality)

# Ordenación
# Ordenar los datos por la columna de densidad (índice 7)
sorted_data = data[data[:, 7].argsort()]

print("Datos ordenados por densidad:")
print(sorted_data)


# Correlación
# Calcular la correlación entre la columna de alcohol y la calidad del vino (índice 10 y 11)
correlation = np.corrcoef(data[:, 10], data[:, 11])[0, 1]
print("Correlación entre alcohol y calidad del vino:", correlation)

# Cuartiles
# Calcular los cuartiles de la columna de acidez volátil (índice 1)
q1_acidez_volatil, q3_acidez_volatil = np.percentile(data[:, 1], [25, 75])
print("Primer cuartil de acidez volátil:", q1_acidez_volatil)
print("Tercer cuartil de acidez volátil:", q3_acidez_volatil)

# Rango intercuartílico (IQR)
iqr_acidez_volatil = q3_acidez_volatil - q1_acidez_volatil
print("Rango intercuartílico de acidez volátil:", iqr_acidez_volatil)

# Valor mínimo y máximo
min_acidez_volatil = np.min(data[:, 1])
max_acidez_volatil = np.max(data[:, 1])
print("Valor mínimo de acidez volátil:", min_acidez_volatil)
print("Valor máximo de acidez volátil:", max_acidez_volatil)

# Frecuencia de valores únicos en la columna de calidad del vino (índice 11)
unique_qualities, counts = np.unique(data[:, 11], return_counts=True)
print("Frecuencia de valores únicos en la calidad del vino:")
for quality, count in zip(unique_qualities, counts):
    print(f"Calidad {quality}: {count} registros")