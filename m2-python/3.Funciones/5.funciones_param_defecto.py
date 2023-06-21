
# Es muy común que las librerías paquetes de python utilicen parámetros con valores predeterminados

def saludar1(nombre, edad):
    pass

def saludar2(nombre='Juan', edad=30):
    print(f" hola soy {nombre} con edad {edad}")
    

# saludar1() # TypeError: saludar1() missing 2 required positional arguments: 'nombre' and 'edad'



saludar2()
saludar2("Antonio")
saludar2("Albert", 40)
