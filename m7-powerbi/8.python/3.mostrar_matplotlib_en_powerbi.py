# En PowerBI, dentro de un objeto visual Python
# El código siguiente, que crea un dataframe y quita las filas duplicadas, siempre se ejecuta y actúa como un preámbulo del script: 

# dataset = pandas.DataFrame(YearsExperience, Salary, Salary_preds)
# dataset = dataset.drop_duplicates()

# Pegue o escriba aquí el código de script:
import matplotlib.pyplot as plt
import seaborn as sns
ax = plt.gca()
line1 = dataset.plot('YearsExperience','Salary', ax=ax)
line2 = dataset.plot('YearsExperience','Salary_preds', ax=ax)
plt.show()