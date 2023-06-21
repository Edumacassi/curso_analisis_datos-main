from input_reader import read_int, read_float
from travel import Travel 
from travel_database import TravelDatabase

database = TravelDatabase() # CRUD sobre una lista en RAM


while True:

    print(""" App de viajes
          1 - Consultar viajes
          2 - Consultar un viaje por id
          3 - Consultar un viaje por ciudad
          4 - Crear un nuevo viaje
          5 - Actualizar un viaje existente 
          6 - Borrar un viaje por id
          7 - Borrar todos los viajes
          8 - Salir de la aplicación \n
          """)
    option = int(input("Introduce una opción\n"))
    
    if option == 1:
        
        for travel in database.find_all():
            print(travel)
            
    elif option == 2:
        id = read_int("id")
        travel = database.find_by_id(id)
        print(travel)
        
    elif option == 3:
        pass
    elif option == 4: 
        
        city_from = input("Introduce la ciudad origen")
        city_to = input("Introduce la ciudad origen")
        passengers = read_int("passengers")
        price = read_float("price")
        
        travel = Travel(None, city_from, city_to, passengers, price)
        
        database.save(travel)
        
        print("Viaje creado correctamente")
        
    elif option == 5:
        pass
    elif option == 6:
        pass
    elif option == 7:   
        pass
    else:
        print('Hasta la proxima')
        break