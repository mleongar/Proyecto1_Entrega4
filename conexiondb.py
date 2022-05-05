import pymysql

def obtener_conexion():
    return pymysql.connect(host='dbcloud2.cy2r9xjioauk.us-east-1.rds.amazonaws.com',
                                user='cloud',
                                password='uniandeS.1',
                                db='supervoices')
