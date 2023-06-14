import sqlite3
import streamlit as st

conn = sqlite3.connect('vivino_v2.db')
c = conn.cursor()

# Open, read and close sql file
f = open('top_ten_wines.sql', 'r')
sql_file = f.read()
f.close()
