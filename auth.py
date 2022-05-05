from flask import Flask

app = Flask(__name__)

"""
Definición de rutas    
"""

@app.route("/")
def saludo():
    return 'Hola'

# Iniciar el servidor
if __name__ == '__main__':
    app.run(host='0.0.0.0')
