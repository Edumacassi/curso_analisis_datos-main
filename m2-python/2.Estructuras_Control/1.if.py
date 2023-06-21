'''
Las estructuras de control condicional permiten crear bifurcaciones en la ejecución del programa

'''


edad = 17

# if else normal
if edad >= 18:
    print('Es mayor de edad')
else:
    print('Es menor de edad')

# if else operador ternario
print('Es mayor de edad') if edad >= 18 else print('Es menor de edad')



# if elif else: para múltiples casos, mejor optar por un efoque de Programación Orientada a Objetos
altura = 180

if altura >= 160 and altura <= 170:
    print('grupo1')
elif altura > 170 and altura <= 180:
    print('grupo2')
else:
    print('grupo3')

