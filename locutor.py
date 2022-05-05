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

LocutorTable = resource.Table('Locutor')

def insertar_locutor(nombre,apellido,email):
    resp = clinet.execute_statement(Statement="INSERT INTO Locutor VALUES {'id_locutor':?,'nombre':?,'apellido':?,'email':?}",
                       Parameters =[{'S': id_locutor},{'S': nombre},{'S': apellido},{'S': email}])

def obtener_locutor():
    resp = clinet.execute_statement(Statement="SELECT id_admon,nombre,apellido,email) FROM Locutor")
    return resp

def eliminar_locutor(id):
    resp = clinet.execute_statement(Statement="DELETE FROM Locutor WHERE id_locutor = ?", Parameters =[{'S': id_locutor}])

def obtener_locutor_por_id(id):
    resp = clinet.execute_statement(Statement="SELECT id_admon,nombre,apellido,email FROM Locutor WHERE id_locutor = ?", Parameters =[{'S': id_locutor}])
    return resp

def actualizar_locutor(nombre,apellido,email, id):
    resp = clinet.execute_statement(Statement="UPDATE Locutor SET nombre = ?, apellido = ?, email = ?  WHERE id_locutor = ?",
                       Parameters =[{'S': nombre},{'S': apellido},{'S': email},{'S': id_locutor}])

def obtener_locutor_por_email(email):
    resp = clinet.execute_statement(Statement="SELECT id_locutor FROM Locutor WHERE email=?", Parameters =[{'S': email}])
    return resp