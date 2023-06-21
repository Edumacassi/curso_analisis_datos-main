
import datetime

# modelos de datos
# MVC: Modelo Vista Controlador
# La clase es como una tabla de base de datos
# Un objeto sería una fila de datos de una tabla
# Modelo Relacional
# Modelo de objetos de Programación Orientada a Objetos
# https://es.quora.com/Cu%C3%A1l-es-la-diferencia-entre-el-modelo-E-R-o-el-modelo-orientado-a-objetos?share=1


# PARTE 1: CREAR CLASE USUARIO Clase usuario User: id, nif, birthday, email, phone, password ##########################
class User:

    # método constructor
    def __init__(self, id, nif, birthday, email, phone, address, password="admin"):
        self.id = id
        self.nif = nif
        self.birthday = birthday
        self.email = email
        self.phone = phone
        self.address = address # Asociación con un objeto de otra clase. One To One
        self.password = password


# user1 = User(1, '6543268Y', datetime.date(1995, 1, 23), 'user1@gmail.com', '543243342')
# user2 = User(2, '4543534T', datetime.date.fromisoformat("1995-01-03"), 'user2@gmail.com', '555444333')  # YYYY-MM-dd

# print(user1.id, user1.nif, user1.email, user1.birthday)
# print(f"{user1.id} {user1.nif} {user1.birthday} {user1.phone} {user1.password}")




# PARTE 2: Clase dirección Address: id, street, city, postal_code, country

class Address:
    def __init__(self, id, street, postal_code, city, country):
        self.id = id
        self.street = street
        
        if (len(postal_code) == 5): # omprueba que la longitud del código postal es 5
            self.postal_code = postal_code
        else:
            self.postal_code = "28002"
            
        self.city = city
        self.country = country
        #self.num_piso = num_piso
        #self.puerta = puerta


address1 = Address(1, "calle falsa 123", "33021", "Gijón", "Spain")
address2 = Address(2, "calle verdadera 456", "789789789", "Madrid", "Spain")
address3 = Address(3, "calle 3 456", "789789789", "Madrid", "Spain")





# PARTE 3: Asociación One To One entre User y Address #######################################
user3 = User(3, '54345643T', datetime.date(2000, 1, 1), 'user3@gmail.com', '34343', address1)
print(user3.address.city, user3.address.country)

# Cambio de casa
user3.address = address3
print(user3.address.city, user3.address.country)

# Cambio de casa
user3.address = Address(4, "calle 3 456", "789789789", "Madrid", "Spain")
print(user3.address.city, user3.address.country)


user4 = User(4, '324234R', datetime.date(2005, 1, 1), 'user4@gmail.com', '34343', address2)
print(user4.address.city)
print(user4.address.country)




corazon_maria = Address(9, 'Calle corazón maria 67', '28002', 'Madrid', 'España')
pepito = User(465, '3432434T', datetime.date(1990, 1, 1), 'alan@gmail.com', '34343', corazon_maria)

print(pepito.address.street, pepito.address.city)
print(pepito.nif, pepito.address.city)





direccion1 = Address(1, 'Calle corazón maría 67, 1 B', '28002', 'Madrid', 'España')
direccion1.street = 'Calle corazón maría 67, 2 B'
direccion1.postal_code = '28003'







# Clase User
# Clase Address

# direccion = Address('nombre de la calle', )
# usuario = User(........., direccion)




















