import streamlit as st
from PIL import Image

image = Image.open("assets/ratings-en1.png")

st.markdown(
    '<div style="font-size:45px; font-weight:bold;text-align:center">\
            Report on wine market analysis based on data gathered from users of the Vivino app</div>',
    unsafe_allow_html=True,
)


left_col, center_col, right_col = st.columns([0.1, 0.8, 0.1])

left_col.write("")

center_col.image(image, width=500)

right_col.write("")
