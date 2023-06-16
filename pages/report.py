"""
Streamlit app to showcase the report of our analysis of the wine market to Vivino
based on the data gathered from their users.
"""
import sqlite3
import streamlit as st
from matplotlib import pyplot as plt

# Function to execute a query from within a .sql file
def run_sql_file(file, cursor):
    with open(file, 'r') as sql_file:
        results = cursor.execute(sql_file.read())
    return results.fetchall()    

# Connect to database
db = sqlite3.connect('data/vivino_v2.db')
cursor = db.cursor()


# Get results from queries of all .sql files in queries folder
top_ten_wines = run_sql_file('queries/top_ten_wines.sql', cursor)
marketing_country = run_sql_file('queries/marketing_country.sql', cursor)
best_winery = run_sql_file('queries/best_winery.sql', cursor)
flavor_group = run_sql_file('queries/flavor_group_wines.sql', cursor)
top_three_grapes = run_sql_file('queries/top_three_grapes.sql', cursor)
average_wine_rating = run_sql_file('queries/average_wine_rating_per_country.sql', cursor)
average_vintage_rating = run_sql_file('queries/average_vintage_rating_per_country.sql', cursor)



# Set containers
main_container = st.container()
with main_container:
    table_container = st.container()
    graph_container = st.container() 



# Set sidebar with buttons
with st.sidebar:
    st.header("Click on buttons to display analysis results.")
    if st.button('Top ten wines'):
       table_container.subheader("Top ten wines based on average rating of at least 4.6 and number of ratings.")
       table_container.dataframe(top_ten_wines, width=1000, column_config={1 : 'Wine', 2 :  'Number of ratings', 3 : 'Ratings average'}) 
    if st.button("Prefered country for marketing"):
        table_container.subheader("The choice of the prefered country for our marketing campaign based on the number of users")
        table_container.dataframe(marketing_country, width=400, column_config={ 1 : 'Country', 2 : 'Number of users'}) 
    if st.button("Best winery"):
        table_container.subheader("Best winery based on total number of ratings")
        table_container.dataframe(best_winery, width=600, column_config={1 : 'Winery', 2 : 'Total number of ratings'}) 
    if st.button("Wine flavors"):
        table_container.subheader("Wines filtered based on these specific flavors: Coffee, Toast, Green apple, Cream and Citrus (975 results).")
        table_container.dataframe(flavor_group, width=1000, column_config={1 : 'Wine', 2 : 'Keywords', 3 : 'Flavor group'}) 
    if st.button("Top three grapes"):
        table_container.subheader("Top three grapes based on the number of wines per grape")
        table_container.dataframe(top_three_grapes, width=1000, column_config={1 : 'Grape', 2 : 'Number of wines'}) 
    if st.button("Average rating for wines"):
        table_container.subheader("Average rating for wines per country")
        table_container.dataframe(average_wine_rating, width=1000, height=250, column_config={1 : 'Country', 2 : 'Average wine rating'}) 
        wine_country, wine_rating = zip(*average_wine_rating) # set data to plot bar chart
        fig, ax = plt.subplots()
        ax.barh(wine_country, wine_rating)
        ax.set_title("Average wine rating per country")
        ax.set_xlabel("Average wine rating")
        ax.set_ylabel("Country")
        graph_container.pyplot(fig)
    if st.button("Average rating for vintages"):
        table_container.subheader("Average rating for vintages per country")
        table_container.dataframe(average_vintage_rating, width=1000, height=250, column_config={1 : 'Country', 2 : 'Average vintage rating'}) 
        vintage_country, vintage_rating = zip(*average_vintage_rating) # set data to plot bar chart
        fig, ax = plt.subplots()
        ax.barh(vintage_country, vintage_rating)
        ax.set_title("Average vintage rating per country")
        ax.set_xlabel("Average vintage rating")
        ax.set_ylabel("Country")
        graph_container.pyplot(fig)



