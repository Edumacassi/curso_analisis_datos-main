
# 1. Sin alias
# import saludos
# saludos.saludo1()
# saludos.saludo2()
# saludos.saludo3()

# 2. Con alias
# import saludos as sa
# sa.saludo1()
# sa.saludo2()

# 3. Importar partes específicas
from saludos import saludo3
from saludos import saludo1, saludo2
saludo2()
saludo3()