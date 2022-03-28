__author__ = 'Nombres_y_Apellidos'

from pymongo import MongoClient

def getCityGeoJSON(address):
    """ Devuelve las coordenadas de una direcciion a partir de un str de la direccion
    Cuidado, la API tiene un limite de peticiones.
    Argumentos:
        address (str) -- Direccion
    Return:
        (str) -- GeoJSON
    """
    from geopy.geocoders import Nominatim
    geolocator = Nominatim()
    location = geolocator.geocode(address)
    #TODO
    # Devolver GeoJSON de tipo punto con la latitud y longitud almacenadas
    # en las variables location.latitude y location.longitude

class ModelCursor:
    """ Cursor para iterar sobre los documentos del resultado de una
    consulta. Los documentos deben ser devueltos en forma de objetos
    modelo.
    """

    def __init__(self, model_class, command_cursor):
        """ Inicializa ModelCursor
        Argumentos:
            model_class (class) -- Clase para crear los modelos del 
            documento que se itera.
            command_cursor (CommandCursor) -- Cursor de pymongo
        """
        #TODO
        pass #No olvidar eliminar esta linea una vez implementado
    
    def next(self):
        """ Devuelve el siguiente documento en forma de modelo
        """
        #TODO
        pass #No olvidar eliminar esta linea una vez implementado

    @property
    def alive(self):
        """True si existen más modelos por devolver, False en caso contrario
        """
        #TODO
        pass #No olvidar eliminar esta linea una vez implementado

class Persona: ##Representacion de los documentos de la bbdd en memoria
    """ Prototipo de la clase modelo
        Copiar y pegar tantas veces como modelos se deseen crear (cambiando
        el nombre Model, por la entidad correspondiente), o bien crear tantas
        clases como modelos se deseen que hereden de esta clase. Este segundo 
        metodo puede resultar mas compleja
    """
    required_vars = []
    admissible_vars = []
    db = None

    def __init__(self, **kwargs): ##Constructor

        ##Comprobar que estan todos los datos requeridos y solo los admitidos, sino excepcion (Pista Teoria de conjuntos)
        ## self.__dict__.update(kwargs)
    
        #TODO
        pass #No olvidar eliminar esta linea una vez implementado


    def save(self):
        #TODO
        pass #No olvidar eliminar esta linea una vez implementado

    def change(self, **kwargs):
        ##Modificar el objeto, uno o varios argumentos a la vez
        ##Son objetos q ya existen, los requeridos los tiene, solo se comprueban los admitidos
        ##self.__dict__.update(kwargs) 
        
        #TODO
        pass #No olvidar eliminar esta linea una vez implementado
    
    @classmethod
    def query(cls, query):
        """ Devuelve un cursor de modelos        
        """ 
        #TODO
        # cls es el puntero a la clase
        pass #No olvidar eliminar esta linea una vez implementado

    @classmethod
    def init_class(cls, db, vars_path="model_name.vars"):
        """ Inicializa las variables de clase en la inicializacion del sistema.
        Argumentos:
            db (MongoClient) -- Conexion a la base de datos.
            vars_path (str) -- ruta al archivo con la definicion de variables
            del modelo.
        """
        #TODO
        # cls es el puntero a la clase
        pass #No olvidar eliminar esta linea una vez implementado


# Q1: Listado de todas las compras de un cliente
nombre = "Definir"
Q1 = []

# Q2: etc...

if __name__ == '__main__':

    client = pymongo.MongoClient('localhost', 27017)
    db = client.practica
    Persona.init_class(db, "/Escritorio/Ampliacion Bases/1ºPractica")



