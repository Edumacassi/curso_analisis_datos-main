
def read_int(name):
    
    while True:
        try:
            result = int(input(f"Introduce {name}"))
            return result
        except ValueError:
            print("Valor erróneo")
            
            
def read_float(name):
    
    while True:
        try:
            result = float(input(f"Introduce {name}"))
            return round(result, 2)
        except ValueError:
            print("Valor erróneo")