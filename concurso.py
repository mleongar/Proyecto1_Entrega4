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

ConcursoTable = resource.Table('Concurso')

def insertar_concurso(id_concurso, nombre,id_admon,logo,url,fecha_inicio,fecha_fin,valor,guion,recomendacion):
    resp = clinet.execute_statement(Statement="INSERT INTO Concurso VALUE {'id_concurso':? , 'nombre':? , 'id_admon':?,'logo':?,'url':?,'fecha_inicio':?,'fecha_fin':?,'valor':?,'guion':?,'recomendacion':?}",
                        Parameters =[{'S':id_concurso},{'S':nombre},{'S':id_admon},{'S':logo},{'S':url},{'S':fecha_inicio},{'S':fecha_fin},{'S':valor},{'S':guion},{'S':recomendacion}])

def obtener_concurso():
    resp = clinet.execute_statement(Statement="SELECT id_concurso,nombre,id_admon,logo,url,fecha_inicio,fecha_fin,valor,guion,recomendacion FROM Concurso")
    return resp

def obtener_url(url):
    resp = clinet.execute_statement(Statement="SELECT id_concurso,nombre,id_admon,logo,url,fecha_inicio,fecha_fin,valor,guion,recomendacion FROM Concurso WHERE url = ?", Parameters =[{'S': url}])
    return resp

def obtener_concurso_admon(id_Admon):
    resp = clinet.execute_statement(Statement="SELECT id_concurso,nombre,id_admon,logo,url,fecha_inicio,fecha_fin,valor,guion,recomendacion FROM Concurso WHERE id_admon = ? ", Parameters =[{'S': id_Admon}])
    return resp

def eliminar_concurso(id_concurso):
    resp = clinet.execute_statement(Statement="DELETE FROM Concurso WHERE id_concurso = ?", Parameters =[{'S': id_concurso}])

def obtener_concurso_por_id(id_concurso):
    resp = clinet.execute_statement(Statement="SELECT id_concurso,nombre,id_admon,logo,url,fecha_inicio,fecha_fin,valor,guion,recomendacion FROM Concurso WHERE id_concurso = ?", Parameters =[{'S': id_concurso}])
    return resp


def actualizar_concurso(id_concurso,nombre,logo,url,fecha_inicio,fecha_fin,valor,guion,recomendacion):
    resp = clinet.execute_statement(Statement="UPDATE Concurso SET nombre = ?, logo = ?, url = ?, fecha_inicio = ?, fecha_fin = ?, valor = ?, guion = ?, recomendacion = ?  WHERE id_concurso = ?",
                        Parameters =[{'S':nombre},{'S':logo},{'S':url},{'S':fecha_inicio},{'S':fecha_fin},{'S':valor},{'S':guion},{'S':recomendacion},{'S':id_concurso}])