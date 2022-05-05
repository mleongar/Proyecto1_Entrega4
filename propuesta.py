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

PropuestaTable = resource.Table('Propuesta')

def insertar_Propuesta(id_propuesta,fecha,id_locutor,id_concurso,estado,voz_original,voz_convertida,mensaje,nombre,apellido,email, id_admon):
    resp = clinet.execute_statement(Statement="INSERT INTO Propuesta VALUE {'id_propuesta':?,'fecha':?,'id_locutor':?,'id_concurso':?,'estado':?,'voz_original':?,'voz_convertida':?,'mensaje':?,'nombre':?,'apellido':?,'email':?, 'id_admon':?}",
                       Parameters =[{'S': id_propuesta},{'S': fecha},{'S': id_locutor},{'S': id_concurso},{'S': estado},{'S': voz_original},{'S': voz_convertida},{'S': mensaje},{'S': nombre},{'S': apellido},{'S': email},{'S': id_admon}])

def obtener_Propuesta():
    resp = clinet.execute_statement(Statement="SELECT id_propuesta,fecha,id_locutor,id_concurso,estado,voz_original,voz_convertida,mensaje,nombre, apellido, email) FROM Propuesta")
    return resp


def eliminar_Propuesta(id_propuesta):
    resp = clinet.execute_statement(Statement="DELETE FROM Propuesta WHERE id_propuesta = ?", Parameters =[{'S': id_propuesta}])

def eliminar_Propuesta_concurso(id_concurso):
    resp = clinet.execute_statement(Statement="DELETE FROM Propuesta WHERE id_concurso = ?", Parameters =[{'S': id_concurso}])

def obtener_Propuesta_por_id(id_propuesta):
    resp = clinet.execute_statement(Statement="SELECT id_propuesta,fecha,id_locutor,id_concurso,estado,voz_original,voz_convertida,mensaje,nombre, apellido, email FROM Propuesta WHERE id_propuesta = ?", Parameters =[{'S': id_propuesta}])
    return resp

def actualizar_Propuesta(id,fecha,id_locutor,id_concurso,estado,voz_original,voz_convertida,mensaje):
    resp = clinet.execute_statement(Statement="UPDATE Propuesta SET fecha = ?, id_locutor = ?, id_concurso = ?, estado = ?, voz_original = ?, voz_convertida = ?, mensaje = ?  WHERE id_propuesta = ?",
                       Parameters =[{'S': fecha},{'S': id_locutor},{'S': id_concurso},{'S': estado},{'S': voz_original},{'S': voz_convertida},{'S': mensaje},{'S': id}])

def obtener_Propuesta_por_concurso(id_concurso):   
    resp = clinet.execute_statement(Statement="SELECT fecha, estado, voz_original, voz_convertida, mensaje, nombre, apellido, email FROM Propuesta WHERE id_concurso = ?", Parameters =[{'S': id_concurso}])
    return resp

def obtener_Propuesta_por_concurso_por_locutor():
    resp = clinet.execute_statement(Statement="SELECT voz_convertida, id_locutor, id_concurso  FROM Propuesta")
    return resp
    
def obtener_Propuesta_por_concurso_por_locutor_id(id_admon):   
    resp = clinet.execute_statement(Statement="SELECT voz_convertida, id_locutor, id_concurso from Propuesta where id_admon = ?", Parameters =[{'S': id_admon}])
    return resp