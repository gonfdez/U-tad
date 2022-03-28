import sys
import logging
import pymysql
import json


rds_host = "endpoint_bd"

username = "user"
password ="password"
dbname = "nombre_bd"
rds_port = 3306

# Así se hace una conexión desde python a una BD
try:
    conn = pymysql.connect(rds_host, user=username, passwd=password, db=dbname, port=rds_port, connect_timeout=10)
except pymysql.MySQLError as e:
    print (e)
    sys.exit()

def lambda_handler(event, context):
    # TODO implement

    metodo="encuesta"
    
    if metodo=="encuesta" :
        cliente=int(event["queryStringParameters"]["cliente"])
        hotel=(event["queryStringParameters"]["hotel"])
        v_general=int(event["queryStringParameters"]["v_general"])
        v_limpieza=(event["queryStringParameters"]["v_limpieza"])
        
        try:
            with conn.cursor() as cur:
                cur.execute("insert into opiniones_clientes values(" + event["queryStringParameters"]['cliente'] + ",'" +event["queryStringParameters"]['hotel'] + "'," +event["queryStringParameters"]['v_general'] +", '" +event["queryStringParameters"]['v_limpieza']+"')")
                conn.commit()
                for row in cur:
                    print(row)
        except pymysql.MySQLError as e:    
            print (e)
            sys.exit()
    
        print ("executed!")
        return {
            'statusCode': 200,
            'headers': { 'Access-Control-Allow-Origin' : '*' },
            'body':json.dumps({ 'res' : ' ok Opinion creada' })
            }
    else: 
            return {
            'statusCode': 200,
            'headers': { 'Access-Control-Allow-Origin' : '*' },
            'body':json.dumps({ 'res' :  'ok Sin Opinion' })
            }