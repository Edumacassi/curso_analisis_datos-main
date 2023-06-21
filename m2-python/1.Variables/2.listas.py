''' 
Tipos de datos compuestos: listas
'''

numero = 8
numeros = [1, 2, 3, 4, 5]

print(numero)
print(numeros)

nifs = ['74398745E', '11111111B', '222222C']
print(nifs)

validos = [True, False, True, False]
print(validos)

lista_heterogenea = [1, 'texto', True, 29.9]
print(lista_heterogenea)

precios = [9.99, 23.43, 54.56]
print(precios)


emails = ['user1@gmail.com', 'user2@gmail.com', 'user3@gmail.com']
#               0               1           2
telefonos = ['654321123', '678654567', '654345678']

contactos = [
    emails, # 0
    telefonos # 1
]

print(emails[0]) # user1@gmail.com
print(contactos)
print(contactos[0][0]) # user1@gmail.com
print(contactos[0][1]) # user2@gmail.com
print(contactos[0][2]) # user3@gmail.com

print(contactos[1][0]) # 654321123
print(contactos[1][1]) # 678654567
print(contactos[1][2]) # 654345678
