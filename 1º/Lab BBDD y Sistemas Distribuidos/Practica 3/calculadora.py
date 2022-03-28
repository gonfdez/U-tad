import sys
import logging
import pymysql
import json

def suma(a, b):
   return a + b
   
def resta(a, b):
   return a - b
   
def multiplicacion(a, b):
   return a * b

def division(a, b):
   return a / b

def default():
   return "Opcion Invalida"
   
def switch(case, a, b):
   sw = {
      "+": suma(a, b),
      "-": resta(a, b),
      "*": multiplicacion(a, b),
      "/": division(a, b),
   }
   return sw.get(case, default())

rds_host = "pruebardsprivado.cquwqhhvnd5s.us-east-1.rds.amazonaws.com"

username = "admin"
password ="admin123"
dbname = "bd_calculadora"
rds_port = 3306

# Así se hace una conexión desde python a una BD
try:
    conn = pymysql.connect(rds_host, user=username, passwd=password, db=dbname, port=rds_port, connect_timeout=10)
except pymysql.MySQLError as e:
    print (e)
    sys.exit()

def lambda_handler(event, context):
    # TODO implement

    metodo=event["queryStringParameters"]["method"]
    
    if metodo=="operacion" :
        op1=float(event["queryStringParameters"]["op1"])
        op2=float(event["queryStringParameters"]["op2"])
        op=(event["queryStringParameters"]["op"])
        res=0
        res=switch(op, op1, op2)
        try:
            with conn.cursor() as cur:
                print(res)
                print("insert into tabla_operaciones values(" + event["queryStringParameters"]['op1'] + "," +event["queryStringParameters"]['op2'] + ",'" +event["queryStringParameters"]['op'] +"', "+str(res)+")")
                cur.execute("insert into tabla_operaciones values(" + event["queryStringParameters"]['op1'] + "," +event["queryStringParameters"]['op2'] + ",'" +event["queryStringParameters"]['op'] +"', "+str(res)+")")
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
            'body':json.dumps({ 'res' :  str(res) })
            }
    else:         
            return {
            'statusCode': 200,
            'headers': { 'Access-Control-Allow-Origin' : '*' },
            'body':json.dumps({ 'res' :  'ok Sin operacion' })
            }