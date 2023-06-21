
# PASO 1 : Crear una clase
class Ordenador:

    def __init__(self, fabricante, modelo, anio, precio):
        # estado: atributos o propiedades
        self.fabricante = fabricante
        self.modelo = modelo
        self.anio = anio
        self.precio = precio
        self.estado = False

    # comportamiento: métodos, cambian el estado
    def encender(self):
        self.estado = True
        
    def aplicar_descuento(self, descuento):
        if (descuento > 0 and descuento < 0.9):
            self.precio = self.precio - self.precio * descuento

# PASO 2: creación de objetos / instancias

ordenador1 = Ordenador("ASUS", "A55A", 2008, 495)
ordenador1.precio *= 0.9

ordenador2 = Ordenador("MSI", "Modern 15", 2021, 935)  # apagado
# Recomendable usar métodos en lugar de los atributos directamente
ordenador2.encender()
ordenador2.aplicar_descuento(0.10) # Sí se aplica
ordenador2.aplicar_descuento(-0.4) # No se aplica
