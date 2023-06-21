
# Primera letra en mayúscula
class Person:
    
    # método constructor
    def __init__(self, id, first_name, last_name):
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        
        
person1 = Person(1, 'person1', 'apellido1') # invoca al constructor

print(f"Persona tiene atributos: {person1.id}, {person1.first_name}, {person1.last_name}")

person2 = Person(2, 'fulanito', 'goteras')


