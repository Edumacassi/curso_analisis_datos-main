def calc_missing(df):
    """
    Calcular porcentaje de nulos en cada columna
    """
    missing_columns = [col for col in df.columns if df[col].isnull().sum() > 0]

    # for col in df.columns:
    #    if df[col].isnull().sum() > 0:
    #       missing_columns.append(col)

    for col in missing_columns:
        null_count = df[col].isnull().sum()
        total_count = df.shape[0]
        null_percent = (null_count / total_count) * 100
        
        print(f"{col} {null_count} / {total_count} {null_percent:.2f} %")