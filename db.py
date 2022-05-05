import boto3
from boto3 import resource
import config

AWS_ACCESS_KEY_ID = config.AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY = config.AWS_SECRET_ACCESS_KEY
aws_session_token = config.aws_session_token
REGION_NAME = config.REGION_NAME
    
resource = resource(
        'dynamodb',
        aws_access_key_id     = AWS_ACCESS_KEY_ID,
        aws_secret_access_key = AWS_SECRET_ACCESS_KEY,
        aws_session_token = aws_session_token,
        region_name           = REGION_NAME    
)

clinet = boto3.client('dynamodb')

AdministradorTable = resource.Table('Administrador')

def insertar_admon(id_admon,nombre,apellido,email,password):
    resp = clinet.execute_statement(Statement="INSERT INTO Administrador VALUE {'id_admon':?, 'nombre':?, 'apellido':?, 'email':?, 'password':?, 'id_admon':?}", Parameters =[{'S':nombre},{'S':apellido},{'S':email},{'S':password},{'N':id_admon}])

def obtener_admon():
    resp = clinet.execute_statement(Statement="SELECT id_admon,nombre,apellido,email,password FROM Administrador")
    return resp

def eliminar_admon(id_admon):
    resp = clinet.execute_statement(Statement="DELETE FROM Administrador WHERE id_admon = ?", Parameters =[{'N': id_admon}])

def obtener_admon_por_id(id_admon):
    resp = clinet.execute_statement(Statement="SELECT id_admon,nombre,apellido,email,password FROM Administrador WHERE id_admon = ?", Parameters =[{'N': id_admon}])
    return resp

def obtener_admon_por_email(email):
    resp = clinet.execute_statement(Statement="SELECT id_admon,nombre,apellido,email,password FROM Administrador WHERE email = ?", Parameters =[{'S': email}])
    return resp

def actualizar_admon(nombre,apellido,email,password,id_admon):
    resp = clinet.execute_statement(Statement="UPDATE Administrador SET nombre = ?, apellido = ?, email = ?, password = ?  WHERE id_admon = ?", Parameters =[{'S':nombre},{'S':apellido},{'S':email},{'S':password},{'N':id_admon}])