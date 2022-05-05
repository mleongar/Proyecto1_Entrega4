from flask import Flask, render_template, request, redirect, flash, redirect, url_for
from werkzeug.security import generate_password_hash, check_password_hash
from flask_sqlalchemy import SQLAlchemy
from flask_restful import Api, Resource
import administrador
import locutor
import concurso
import propuesta

app = Flask(__name__, static_folder= 'static')
api = Api(app)

class CrearAdministrador(Resource):
    def post(self):
        nuevo_administrador = administrador(nombre = request.form["nombre"], apellido = request.form["apellido"], email = request.form["email"], password = request.form["password"], password2 = request.form["password2"])
        if nuevo_administrador.password == nuevo_administrador.password2:
            admon = administrador.obtener_admon_por_email(nuevo_administrador.email)
            if admon:
                print ('El correo ya existe')
                return render_template("login.html")
            administrador.insertar_admon(nuevo_administrador.nombre, nuevo_administrador.apellido, nuevo_administrador.email, nuevo_administrador.password)
            return render_template("login.html")
        print ('Las contrasenas son diferentes')
        return render_template("register.html")


api.add_resource(CrearAdministrador,'/crearadministrador')

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)