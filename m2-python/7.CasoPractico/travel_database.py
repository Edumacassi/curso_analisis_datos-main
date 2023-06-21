
class TravelDatabase:
    def __init__(self):
        # TODO crear travels ficticios para tener datos iniciales
        self.travels = []
    
    # SELECT * FROM travels
    def find_all(self): 
        return self.travels.copy()
        # return list(self.travels)
        
     # travel_database.find_by_id(8)
     # SELECT * FROM travels WHERE id = 23
    def find_by_id(self, id):
        # iterar sobre los viajes
        for travel in self.travels:
            if travel.id == id:
                return travel
            
        return None
    
    # SELECT * FROM travels
    # WHERE city_from = "" AND city_to = ""
    def find_all_by_city(self, city_from, city_to):
        filtered_travels = [] # lista
        
        for travel in self.travels:
            if travel.city_from == city_from and travel.city_to == city_to:
                filtered_travels.append(travel)
                
        return filtered_travels
    
    
    # travel_database.save(travel2)
    def save(self, travel):
        # buscar en travels cuál es el id más alto
        id_maximo = 0
        for current_travel in self.travels:
            if current_travel.id > id_maximo:
                id_maximo = current_travel.id
        
        # generar el nuevo id sumando 1 al id más alto
        travel.id = id_maximo + 1
        
        # guardar en la lista
        self.travels.append(travel)
            
    def update(self, travel):
        # encontrar el travel a actualizar
        for current_travel in self.travels:
            if current_travel.id == travel.id:
                current_travel.city_from = travel.city_from
                current_travel.city_to = travel.city_to
                current_travel.passengers = travel.passengers
                current_travel.price = travel.price
                return True

        return False
    
    # DELETE FROM travels WHERE id = 1
    def delete_by_id(self, id):
        for travel in self.travels:
            if travel.id == id:
                self.travels.remove(travel)
                break
                
    def delete_all(self): 
        self.travels = []
        