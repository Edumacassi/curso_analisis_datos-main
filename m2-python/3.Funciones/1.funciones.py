
# FUNCIÓN CON UN PARÁMETRO DE ENTRADA, NO DEVUELVE NADA
def print_is_adult(age):
    print('Es mayor de edad') if age >= 18 else print('Es menor de edad')


print_is_adult(17)
print_is_adult(18)
print_is_adult(19)
print_is_adult(20)

# FUNCIÓN CON UN PARÁMETRO DE ENTRADA Y QUE DEVUELVE BOOL: True o False

def es_mayor_edad(age):
    return age >= 18


print(es_mayor_edad(20)) # True
print(es_mayor_edad(15)) # False

