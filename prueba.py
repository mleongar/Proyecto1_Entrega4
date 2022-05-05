from flask import Flask, render_template, request, redirect, flash, redirect, url_for
from werkzeug.security import generate_password_hash, check_password_hash
import administrador
import locutor
import concurso
import propuesta

app = Flask(__name__, static_folder= 'static')

"""
Definición de rutas    
"""

@app.route("/")
def index():
    return render_template("index.html")

# Iniciar el servidor
if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
