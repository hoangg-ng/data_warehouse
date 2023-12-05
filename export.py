import pyodbc
import pandas as pd
from pathlib import Path
import matplotlib.pyplot as plt

server = 'HOANGCS' 
database = 'CompanyX' 
username = 'hoangcs' 
password = 'hoangcs02'


cnxn = pyodbc.connect('DRIVER={SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = cnxn.cursor()

query = """
SELECT [ProductID],[Name],[ProductSubcategoryID],[Quantity] FROM dbo.fact_table
"""
df = pd.read_sql(query, cnxn)
# df.to_csv('Product_details.csv')
