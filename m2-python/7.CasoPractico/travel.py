
class Travel:
    def __init__(self, id, city_from, city_to, passengers, price):
        self.id = id
        self.city_from = city_from
        self.city_to = city_to
        self.passengers = passengers
        self.price = price

    #para imprimir un objeto
    def __str__(self):
        return f"{self.id} {self.city_from} {self.city_to} {self.price}"
    # REpresentacion Formal: para imprimir una la lista de objetos
    def __repr__(self):
       return f"{self.id} {self.city_from} {self.city_to} {self.price}"

