import datetime

class Travel:
    
    def __init__(self, city_from, city_to, date_from, date_to):
        self.city_from = city_from
        self.city_to = city_to
        self.date_from = date_from
        self.date_to = date_to
        
        
date_from = datetime.date.today()
date_to = datetime.date.today()
travel1 = Travel("Madrid", "Praga", date_from, date_to)
print(f"Día de salida {travel1.date_from} y día de regreso {travel1.date_to}")

travel2 = Travel("Barcelona", 
                 "Budapest", 
                 datetime.date(2023, 1, 15), 
                 datetime.date(2023, 1, 16))
print(f"Día de salida {travel2.date_from} y día de regreso {travel2.date_to}")


travel3 = Travel("Asturias", "Viena", datetime.datetime.today(), datetime.datetime(2023, 5, 13, 10, 30))
print(f'Día de salida {travel3.date_from} y día de regreso {travel3.date_to}')

