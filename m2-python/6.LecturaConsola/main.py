import datetime
# Por defecto input lee string 
# nombre = input("Introduzca su nombre\n") # <class 'str'>

# edad = int(input("Introduce edad\n")) # <class 'int'>

# salary = float(input("Introduce salario\n"))

# apto = bool(int(input("0 es NO apto y 1 SI es apto\n")))

# fecha_nacimiento_str = input("Introduce fecha nacimiento (YYYY-MM-dd) (1990-11-03) \n")
# fecha_nacimiento = datetime.date.fromisoformat(fecha_nacimiento_str)

fecha_nacimiento_str = input("Introduce fecha nacimiento (dd/MM/YYYY) (03/11/1991) \n")
fecha_array = fecha_nacimiento_str.split("/")
year = int(fecha_array[2])
month = int(fecha_array[1])
day = int(fecha_array[0])
fecha_final = datetime.date(year, month, day)

print("fin")