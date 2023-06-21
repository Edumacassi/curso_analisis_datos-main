
# import offer
# offer.JobOffer(1, 'Analista Python', 'Empresa 1', 40000, 'remoto', 2)

# as permite asignar alias para acortar el nombre del nombre al usarlo
import offer as of

# utilizar un objeto llamado offer1 que está en el módulo offer
print(of.offer1.company)

offer2 = of.JobOffer(2, 'Dev Java', 'Empresa 2', 40000, 'remoto', 2)