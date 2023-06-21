
""" 
Para hacer en clase: Base de datos de viajes
1. travel.py:
clase Travel
    id, city_from, city_to

2. traveldatabase.py:
clase TravelDatabase 
    []
    def findAll
    def findById
    def findByCityFromAndCityTo
    def insert
    def update
    def delete

3. app.py:
    pruebe todas las operaciones de TravelDatabase
    leer de input los datos para crear objetos Travel


Para entregar: Base de datos de incendios

1. fire.py
class Fire
    id, street, province, level, date_from, date_to, active, cause
    

2. firedatabase.py
class FireDatabase
    []
    def findAll
    def findById
    def findByActiveTrue
    def findByCause(cause)
    def insert(fire)
    def update(fire)
    def delete(fire)

3. app.py
imprimir un menú que permita por consola ejecutar los métodos de FireDatabase
leer de consola leer datos para crear incendios, filtar, etc.
que el app inserte datos demo en el arranque

* save
* find_all
* find_by_id
* find_all_by_city
* update
* delete_by_id
* delete_all
"""


# Crear 1 objeto TravelDatabase
from travel_database import TravelDatabase
travel_database = TravelDatabase()

# Crear 5 objetos Travel utilizando el constructor
from travel import Travel
travel1 = Travel(id=None, city_from='Madrid', city_to="Barcelona", price=123.21, passengers=2)
travel2 = Travel(id=None, city_from='Asturias', city_to="Malaga", price=223.21, passengers=2)

# Insertar los objetos Travel en TravelDatabase utilizando save()
travel_database.save(travel1)
travel_database.save(travel2)

# Probar métodos find
# print("====================== FIND ALL ===================")
travels = travel_database.find_all()
print(travels)
# print(f"Longitud {len(travels)}")
# print(f"Viaje 1: {travels[0]}") # 1
# print(f"Viaje 2: {travels[1]}") # 2

# print("====================== FIND BY ID ===================")
# travel2 = travel_database.find_by_id(2)
# print(f"Viaje 2: {travel2}") # 2

# travel9 = travel_database.find_by_id(9)
# print(f"Viaje 9: {travel9}")

# print("====================== FIND BY CITY ===================")
# travels = travel_database.find_all_by_city('Asturias', 'Malaga')
# print(f"Longitud {len(travels)}") # 1
# print(f"Viaje 2: {travels[0]}") # 2

# # ejemplo de como capturar un error
# travels = travel_database.find_all_by_city('Asturias', 'Barcelona')
# try:
#     print(f"Viaje 2: {travels[0]}") # IndexError: list index out of range
# # except IndexError:
# #     print("No hay elementos")
# except Exception:
#     print("No hay elementos")
    
    
# print("fin")

# Probar método update
# print("====================== UPDATE ===================")
# print(f"Antes de actualizar: {travel_database.find_by_id(1)}")

# travel1 = Travel(1, "Madrid", "Lisboa", 2, 150.0)
# travel_database.update(travel1)

# print(f"Después de actualizar: {travel_database.find_by_id(1)}")

# Probar delete y deleteall
# print("====================== DELETE BY ID ===================")
# print(f"Antes de borrar: {len(travel_database.find_all())}")
# travel_database.delete_by_id(1)
# print(f"Después de borrar: {len(travel_database.find_all())}")
# # No borra porque ya se borró anteriormente
# travel_database.delete_by_id(1)
# print(f"Después de borrar: {len(travel_database.find_all())}")

# print("====================== DELETE ALL ===================")
# print(f"Antes de borrar: {len(travel_database.find_all())}")
# travel_database.delete_all()
# print(f"Después de borrar: {len(travel_database.find_all())}")
# # No borra porque ya se borró anteriormente
# travel_database.delete_all()
# print(f"Después de borrar: {len(travel_database.find_all())}")
