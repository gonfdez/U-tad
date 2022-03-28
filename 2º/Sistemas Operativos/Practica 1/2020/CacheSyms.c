/*				NOTAS:
- Bus direcciones -> ADDR: 2^10 = 1KB o 1024Bytes de RAM
- Linea = Bloque
- Bloque = 8bytes
- Cantidad de bloques en la RAM = 1024 / 8 = 128 Bloques en la RAM
- 

*/

#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<math.h>

typedef struct CacheSyms{
    short int ETQ;
    short int datos[8];
}T_LINEA_CACHE;

//Definicion de varialbes globales del sistema. SIN UTILIZAR DE MOMENTO
int Nbloque=0;
int NFallos=0;

//Definicion de funciones 
int comprobarCACHE(int ETQ,int NLINE,int PLBR,T_LINEA_CACHE *cache); //Funcion para comprobar la memoria cache con el ADDR descompuesto.
int cogerETQ(int ADDRint);  //Funciones para pillar los diferentes campos de los ADDRS
int cogerNLINE(int ADDRint);
int cogerPLBR(int ADDRint); 
int conversorHexDec(char *ADDR); //Conversion de direcciones str: HEX a int: DEC
void primeracarga(T_LINEA_CACHE *cache,unsigned char *RAM); //Funcion para hacer una primera carga en la cache (Opcional - Borrado)
void inicializacion(T_LINEA_CACHE *cache); //funcion para inicializar la memoria cache
void imprimircache(T_LINEA_CACHE *cache); //funcion para imprimir la cache
void cargarRAM(unsigned char *RAM,FILE *pfile); //funcion para cargar la memoria RAM del archivo binario

int main(){
	
    T_LINEA_CACHE *cache;
    FILE *pfile =NULL;
    FILE *ADDRfile=NULL; //Puntero al fichero ADDR de direcciones
    char ADDR[4]; //ADDR -> Bus de direcciones
    int ADDRint=0;
    int ETQ = 0;
    int NLINE = 0;
    int PLBR = 0;
    unsigned char RAM[1024]; //Declaracion de la memoria RAM	
	
    // numPtr = (int *)malloc( tamanyo*sizeof(int) )
    cache = (T_LINEA_CACHE*)malloc(sizeof(T_LINEA_CACHE)*4); //Reserva dinamica de memoria para construir la cache.
    
	//Apertura de ficheros.
    if ((ADDRfile = fopen("accesos_memoria.txt", "r")) == NULL){ 
    printf ( " Error en la apertura. Es posible que el fichero no exista \n ");
    }
    if ((pfile = fopen("RAM.bin", "rb")) == NULL){ 
    printf ( " Error en la apertura. Es posible que el fichero no exista \n ");
    }
	
	/*for(i=0;i<12;i++){			//Debug el fcanf();
	fscanf(ADDRfile,"%s",ADDR);
	conversorHexDec(ADDR);
	}*/
	
	fscanf(ADDRfile,"%s",ADDR); //lectura de las direcciones de memoria.
    inicializacion(cache); //Pasamos por referencia el argumento para toda su inicializacion
    //cargarRAM(RAM,pfile);
    ADDRint = conversorHexDec(ADDR);
    PLBR=cogerPLBR(ADDRint);
    NLINE=cogerNLINE(ADDRint);
    ETQ = cogerETQ(ADDRint);
    comprobarCACHE(ETQ,NLINE,PLBR,cache);
    
    printf("El numero de palabra es: %d\n",PLBR);
    printf("El numero de linea es:  %d\n",NLINE);
    printf("El numero de Etiqueta es: %d\n",ETQ);
    
    
   /*imprimircache(cache);  //Funcion para imprimir la cache
	primeracarga(cache,RAM);
    imprimircache(cache);*/
    
    return 0;
}
//funcion  de actualizacion de cache.
 
//Funcion de comparacion y direccionamiento
int comprobarCACHE(int ETQ,int NLINE,int PLBR,T_LINEA_CACHE *cache){ //Func para comprobar la cache
	
	if(ETQ == cache[NLINE].ETQ){
		printf("Exito\n");
		//Devolucion del bit seleccionado por la PLBR
	}else{
		printf("Fail\n");
		
		/*printf("ADDR -> ETQ = %d\n",ETQ);
		printf("CACHE -> ETQ = %d\n",cache[NLINE].ETQ);*/
	}
}


int cogerPLBR(int ADDRint){
	return ((ADDRint)&(7)); // El 7 en binario: 0111
}
int cogerNLINE(int ADDRint){
	return (((ADDRint)&(24))>>3); // el 24 en binario :11000
}
int cogerETQ(int ADDRint){
	return (((ADDRint)&(992))>>5);// el 992 en binario: 1111100000
}

int conversorHexDec(char *ADDR){ //Funcion de conversion de str: HEX a int: DEC
	//Tabla de correspondencia.
	int A = 10; int i = 0;
	int B = 11; int h = 3; 
	int C = 12; int acc = 0;
	int D = 13; int aux = 0; 
	int E = 14;
	int F = 15;
	//printf("La direccion en la funcion es: %c\n",ADDR); --> Array por puntero perfectamente.
	printf("El ADDR es: %s\n",ADDR);
	
	for(i=3 ; i>=0; i--){
		
		switch(ADDR[i]){
		case 'A':
			aux = A*pow(16,(h-i));
			break;
		case 'B':
			aux = B*pow(16,(h-i));
			break;
		case 'C':
			aux = C*pow(16,(h-i));
			break;
		case 'D':
			aux = D*pow(16,(h-i));
			break;
		case 'E':
			aux = E*pow(16,(h-i));
			break;
		case 'F':
			aux = F*pow(16,(h-i));
			break;
		default: //Todos aquellos casos que no sean Letra.
			aux = (ADDR[i] - '0')*pow(16,(h-i));
		}
		acc = acc + aux;
	}
	printf("El numero en decimal es: %d\n",acc);
	return acc;	
}



void cargarRAM(unsigned char *RAM, FILE *pfile){
	int leidos =0;
	int i=0;
	printf(" -Loading Ram Memory\n");
	leidos = fread (RAM, 1, 1024, pfile); //Funcion fread para volcar el arhivo binario a la "RAM memmory"
	
	if(leidos == 1024){ 				  //Animacion de carga
		printf(" [");
		for(i=0;i<15;i++){
			printf("=");
			if(i==14){
				printf("] \n");
			}
			sleep(1);
	}
		printf(" -RAM memory sucesfully load\n");
	}
}


void primeracarga(T_LINEA_CACHE *cache,unsigned char *RAM){
    int i = 0;
    int j = 0;
    int ACC = 0;
	printf(" \n\n-Loading Cache memory");sleep(1);printf(".");sleep(1);printf(".");sleep(1);printf(".\n");
	printf("-Cache memory Load\n");
	sleep(1);
    for(i=0;i<4;i++){
    	cache[i].ETQ = Nbloque; //Actualizacion de la etiqueta
    	Nbloque++;
        for(j=0;j<8;j++){
            cache[i].datos[j]=RAM[j+ACC];
            if(j == 7){
            	ACC = ACC + j; //Actualizacion del acumulador
			}
        }
        ACC++; //Actualizacion del acumulador 2.0
    }
}

void inicializacion(T_LINEA_CACHE *cache){
    int i = 0;
    int j = 0;
    for (i=0; i < 4; i++){
        cache[i].ETQ = 0xFF;
        for(j=0;j<8;j++){
            cache[i].datos[j]=0; //inicializacion de todos los datos a 0
        }
    }
}


void imprimircache(T_LINEA_CACHE *cache){
	printf("--------------------------\n");
	printf("       CACHE MEMORY\n");
	printf("--------------------------\n");
    int i = 0;
    int j = 0;
    for (i=0; i < 4; i++){
    	if(cache[i].ETQ == 0){
    		printf("ETQ: 0X0  ");	
		}else{	
        	printf("ETQ: %#X  ",cache[i].ETQ);
        }
        printf("Datos: ");
		for(j=7;j>=0;j--){
            printf("%X ",cache[i].datos[j]);
            if(j==0){
            	printf("\n");
            }
        }		
    }
}




