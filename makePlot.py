# Import libraries
import sqlite3
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
# Connect to the db we made previously
con = sqlite3.connect("mtcars.sqlite3")
df = pd.read_sql("select * from mtcars", con)
# Make the plot using seaborn
g = sns.FacetGrid(df, col="cyl")
g.map(sns.scatterplot,"wt","mpg")
# Save plot to file
plt.savefig('mtcars.png')