

names = ['persona1', 'persona2', 'persona3', 'persona4']

# for name in names:
#     print(name)
    
print(f"ANTES: {names}")

terminar_en_punto = lambda name: name + '.'

nombres_terminados_en_punto = list(map(terminar_en_punto, names))

print(f"DESPUES: {nombres_terminados_en_punto}")


