#include <stdio.h>
#include <stdlib.h>


typedef struct {
    short int ETQ;
    short int Datos[8];
    } T_LINEA_CACHE;

double tiempoGlobal = 0;
int numFallos = 0;

void CACHEsym () {
    T_LINEA_CACHE lineasCache[4];

    //Inicializamos los valores de ETQ a FF y los de datos a 0
    for (int i = 0; i < 4; ++i) {
         lineasCache[i].ETQ = 0xFF;
        for (int o = 0; 0 < 8; o++) {
            lineasCache[i].Datos[o] = 0;
        }
    }
    /*
      printf("fICHEROS ABIERTOS");
    FILE *f1, *f2;
    
    // Apertura de los ficheros, con posibles errores
    f1 = fopen ("RAM.bin", "rb");
    f2 = fopen ("accesos_memoria.txt" , "rb");
   
     
    if (f1 == NULL) {
        printf("Error. El fichero RAM.bin no existe.");
         exit(-1);
    }
     if (f2 == NULL) {
        printf("Error. El fichero accesos_memoria.txt no existe.");
         exit(-1);
    }
    

   
    //RAM.bin
    unsigned char RAM[1024];
    int leidos;

    //Leemos el fichero y guardamos en RAM
    leidos = fread (RAM, 1, 1024, f1);
    if (leidos != 1024) {
        printf("Error en el fichero RAM.bin, caracteres distintos de 1024, caracteres leidos: %i ", leidos);
        exit(-1);
    }
    printf("leidos RAM: %i", leidos);
    //Leemos direccion de memoria accesos_memoria.txt
    for (int y = 0; y < 12; y++) {
        char binario[16];
        long hexT;
        int contador = 0;
        for (int x = 0; x < 4; x++) {
            hexT += fgetc(f2);
        }
        ltoa(hexT, binario, 2);
        
        printf("Esto es: %li", hexT);
        //printf(binario[0]+binario[1]+binario[2]+binario[3]);
    }
    printf("hola");
    
    
    */
   exit(-1);
}

void main() {
    
    CACHEsym();
}






