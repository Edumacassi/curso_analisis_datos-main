

# En JavaScript: console.log(`Hola ${name}`)

name = 'Juan'
age = 30

print(f"Hola soy {name} con edad {age}")
print("Hola soy " + name + ", con edad " + str(age))
print("Hola soy", name, "con edad", age)


def saludar(name, age):
    return f"Hola soy {name} con edad {age}"

saludo = saludar("Mike", 35)
print(saludo)