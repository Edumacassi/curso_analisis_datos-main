
# Crear una clase Offer que represente oferta trabajo
# title, company, salary, workmode, exp_years

class JobOffer:
    def __init__(self, id, title, company, salary, workmode, exp_years):
        self.id = id
        self.title = title
        self.company = company
        self.salary = salary
        self.workmode = workmode
        self.exp_years = exp_years
    
    def __str__(self):
        return f"{self.id} {self.title}"
    
offer1 = JobOffer(1, 'Analista Python', 'Empresa 1', 40000, 'remoto', 2)