#include<stdio.h>
#include<string.h>
#include<ctype.h>
#include "cabeceras.h"

#define LONGITUD_COMANDO 100

//Hecho por: Alejandro Mata Espinosa y Gonzalo Fernandez Suarez
void Printbytemaps(EXT_BYTE_MAPS *ext_bytemaps);
int ComprobarComando(char *strcomando, char *orden, char *argumento1, char *argumento2);
void LeeSuperBloque(EXT_SIMPLE_SUPERBLOCK *psup);
int BuscaFich(EXT_ENTRADA_DIR *directorio, EXT_BLQ_INODOS *inodos, 
              char *nombre);
void Directorio(EXT_ENTRADA_DIR *directorio, EXT_BLQ_INODOS *inodos);
int Renombrar(EXT_ENTRADA_DIR *directorio, EXT_BLQ_INODOS *inodos, 
              char *nombreantiguo, char *nombrenuevo);
int Imprimir(EXT_ENTRADA_DIR *directorio, EXT_BLQ_INODOS *inodos, 
             EXT_DATOS *memdatos, char *nombre);
int Borrar(EXT_ENTRADA_DIR *directorio, EXT_BLQ_INODOS *inodos,
           EXT_BYTE_MAPS *ext_bytemaps, EXT_SIMPLE_SUPERBLOCK *ext_superblock,
           char *nombre,  FILE *fich);
int Copiar(EXT_ENTRADA_DIR *directorio, EXT_BLQ_INODOS *inodos,
           EXT_BYTE_MAPS *ext_bytemaps, EXT_SIMPLE_SUPERBLOCK *ext_superblock,
           EXT_DATOS *memdatos, char *nombreorigen, char *nombredestino,  FILE *fich);
void Grabarinodosydirectorio(EXT_ENTRADA_DIR *directorio, EXT_BLQ_INODOS *inodos, FILE *fich);
void GrabarByteMaps(EXT_BYTE_MAPS *ext_bytemaps, FILE *fich);
void GrabarSuperBloque(EXT_SIMPLE_SUPERBLOCK *ext_superblock, FILE *fich);
void GrabarDatos(EXT_DATOS *memdatos, FILE *fich);

int main(){
	//Declaro las variables que utilizo en el programa
	char comando[LONGITUD_COMANDO];
	char orden[LONGITUD_COMANDO];
	char argumento1[LONGITUD_COMANDO];
	char argumento2[LONGITUD_COMANDO];
	 
	int i,j;
	unsigned long int m;
        
	EXT_SIMPLE_SUPERBLOCK ext_superblock;
    EXT_BYTE_MAPS ext_bytemaps;
	EXT_BLQ_INODOS ext_blq_inodos;
    EXT_ENTRADA_DIR directorio[MAX_FICHEROS];
    EXT_DATOS memdatos[MAX_BLOQUES_DATOS];
    EXT_DATOS datosfich[MAX_BLOQUES_PARTICION];
   
	int entradadir;
	int grabardatos;
	FILE *fent;

	// Lectura del fichero completo de una sola vez
	fent = fopen("particion.bin","r+b");
	fread(&datosfich, SIZE_BLOQUE, MAX_BLOQUES_PARTICION, fent);    
   	 
	memcpy(&ext_superblock,(EXT_SIMPLE_SUPERBLOCK *)&datosfich[0], SIZE_BLOQUE);
	memcpy(&directorio,(EXT_ENTRADA_DIR *)&datosfich[3], SIZE_BLOQUE);
	memcpy(&ext_bytemaps,(EXT_BLQ_INODOS *)&datosfich[1], SIZE_BLOQUE);
	memcpy(&ext_blq_inodos,(EXT_BLQ_INODOS *)&datosfich[2], SIZE_BLOQUE);
	memcpy(&memdatos,(EXT_DATOS *)&datosfich[4],MAX_BLOQUES_DATOS*SIZE_BLOQUE);
    
    //Menu de la terminal de comandos
	printf("--------------------------\n"); 
    printf("---TERMINAL DE COMANDOS---\n");
    printf("--------------------------\n"); 
    printf("Lista de comandos posibles:\n\t-bytemaps\n\t-copy\n\t-dir\n\t-info\n\t-imprimir\n\t-rename\n\t-remove\n\t-salir\n");
	printf("\nIntroduzca un comando valido:"); 
    
	//Bucle de tratamiento de comandos
	for (;;){
		//Bucle infinito de peticion de comandos
		do {
			printf ("\n>> ");
			fflush(stdin);
			fgets(comando, LONGITUD_COMANDO, stdin);
		}while (ComprobarComando(comando,orden,argumento1,argumento2) !=0);
	
		//Una vez introducido el comando
		if(strcmp(orden, "info")==0){
			LeeSuperBloque(&ext_superblock);
		}else if(strcmp(orden, "bytemaps")==0){
			Printbytemaps(&ext_bytemaps);	
		}else if(strcmp(orden, "dir")==0){
			Directorio(directorio, &ext_blq_inodos);
		}else if(strcmp(orden, "rename")==0){
			switch(Renombrar(directorio, &ext_blq_inodos, argumento1, argumento2)){
				case -1:
					printf("ERROR: Fichero %s ya existe\n", argumento2);
					break;
				case 0:
					printf("ERROR: Fichero %s no encontrado\n", argumento1);
					break;
				case 1:
					grabardatos=1;
					break;
			}
		}else if(strcmp(orden, "imprimir")==0){
			switch(Imprimir(directorio, &ext_blq_inodos, datosfich, argumento1)){
				case 0:
					printf("ERROR: Fichero %s no encontrado\n", argumento1);
					break;
			}
		}else if(strcmp(orden, "remove")==0){
			switch(Borrar(directorio, &ext_blq_inodos, &ext_bytemaps, &ext_superblock, argumento1, fent)){
				case -1:
					printf("ERROR: Fichero %s ya existe\n", argumento2);
					break;
				case 0:
					printf("ERROR: Fichero %s no encontrado\n", argumento1);
					break;
				case 1:
					grabardatos=1;
					break;
			}
		}else if(strcmp(orden, "copy")==0){
			switch(Copiar(directorio, &ext_blq_inodos, &ext_bytemaps, &ext_superblock, datosfich, argumento1, argumento2, fent)){
				case -1:
					printf("ERROR: Fichero %s ya existe\n", argumento2);
					break;
				case 0:
					printf("ERROR: Fichero %s no encontrado\n", argumento1);
					break;
				case 1:
					grabardatos=1;
					break;
			}
		}else if(strcmp(orden, "salir")==0){	
			GrabarDatos(datosfich, fent);
			GrabarSuperBloque(&ext_superblock, fent);
			Grabarinodosydirectorio(directorio, &ext_blq_inodos, fent);
			GrabarByteMaps(&ext_bytemaps, fent);

			fclose(fent);
			return 0;
		}

		if(grabardatos){
		
			GrabarDatos(datosfich, fent);
			GrabarSuperBloque(&ext_superblock, fent);
			Grabarinodosydirectorio(directorio, &ext_blq_inodos, fent);
			GrabarByteMaps(&ext_bytemaps, fent);

			grabardatos--;
		}


   	}	
}


int ComprobarComando(char *strcomando, char *orden, char *argumento1, char *argumento2){
	
	//Primero limpiamos las variables
	strcpy(orden, "");
	strcpy(argumento1, "");
	strcpy(argumento2, "");
	
	char temp[strlen(strcomando)];
	strncpy(temp, strcomando, strlen(strcomando)-1);
	temp[strlen(strcomando)-1]='\0';
	char *token = strtok(temp," ");
	
	//Separo el comando en sus partes
	if(token != NULL){
		int i;
		for(i = 0; token != NULL; i++){
			switch(i){
				case 0:
					strcpy(orden, token);
					token = strtok(NULL," ");
					break;
				case 1:
					strcpy(argumento1, token);
					token = strtok(NULL," ");
					break;
				case 2:
					strcpy(argumento2, token);
					token = strtok(NULL," ");
					break;
				default:
					return 1;
			}
		}
	}else{
		return 1;
	}

	//Verifico que las ordenes y los parametros establecidos son validos
	if(strcmp(orden, "info")==0){
		return 0;
	}else if(strcmp(orden, "bytemaps")==0){
		return 0;
	}else if(strcmp(orden, "dir")==0){
		return 0;
	}else if(strcmp(orden, "rename")==0){
		return !(strlen(argumento1)>0 && strlen(argumento2)>0);
	}else if(strcmp(orden, "imprimir")==0){
		return !strlen(argumento1)>0;
	}else if(strcmp(orden, "remove")==0){
		return !strlen(argumento1)>0;
	}else if(strcmp(orden, "copy")==0){
		return !(strlen(argumento1)>0 && strlen(argumento2)>0);
	}else if(strcmp(orden, "salir")==0){
		return 0;
	}else{
		printf("ERROR: Comando no valido\n Opciones: bytemaps,copy,dir,info,imprimir,rename,remove,salir\n");
	}

}

void LeeSuperBloque(EXT_SIMPLE_SUPERBLOCK *psup){
	printf("Bloque %d Bytes\nInodos particion = %d\nInodos libres = %d\nBloques particion = %d\nBloques libres = %d\nPrimer bloque de datos = %d\n",SIZE_BLOQUE,MAX_INODOS, psup->s_free_inodes_count, MAX_BLOQUES_PARTICION, psup->s_free_blocks_count, psup->s_first_data_block);		
}


void Printbytemaps(EXT_BYTE_MAPS *ext_bytemaps){
	
	printf("Inodos: ");
	int i;
	for(i=0;i<MAX_INODOS;i++){
		printf("%d ", ext_bytemaps->bmap_inodos[i]);
	}
	printf("\nBloques [0-25]: ");
	for(i=0;i<MAX_BLOQUES_PARTICION;i++){
		printf("%d ", ext_bytemaps->bmap_bloques[i]);
	}
	printf("\n");
}

void Directorio(EXT_ENTRADA_DIR *directorio, EXT_BLQ_INODOS *inodos){
	
	int i,j;
	for(i=1;i<MAX_FICHEROS;i++){
		if((directorio+i)->dir_inodo!=NULL_INODO){
			printf("%s\ttamaño: %d\tinodo: %d\tbloques:", (directorio+i)->dir_nfich, inodos->blq_inodos[(directorio+i)->dir_inodo].size_fichero, (directorio+i)->dir_inodo);	
		
			for(j=0; inodos->blq_inodos[(directorio+i)->dir_inodo].i_nbloque[j]!=NULL_INODO; j++){
				printf(" %d", inodos->blq_inodos[(directorio+i)->dir_inodo].i_nbloque[j]);
			}

			printf("\n");
		}
	}
}


int Renombrar(EXT_ENTRADA_DIR *directorio, EXT_BLQ_INODOS *inodos, char *nombreantiguo, char *nombrenuevo){
	
	short unsigned int comprobar=0;
	short unsigned int wardI;
	//Primero compruebo que existe el fichero
	for(int i=1; ((directorio+i)->dir_inodo)!=NULL_INODO; i++){
		if((strcmp(nombreantiguo, (directorio+i)->dir_nfich)==0)){
			comprobar++;
			wardI = i;
		}
		if(strcmp(nombrenuevo, (directorio+i)->dir_nfich)==0){
			return -1;
		}
	}
		
	//Si comprobar es 1 significa que los dos parametros son validos y diferentes
	if(comprobar==1){
		strcpy( (directorio+wardI)->dir_nfich, nombrenuevo );
	}

	return comprobar;

}


int Imprimir(EXT_ENTRADA_DIR *directorio, EXT_BLQ_INODOS *inodos, EXT_DATOS *memdatos, char *nombre){
	//Primero compruebo si existe el fichero pedido
	short unsigned int comprobar=0;
	short unsigned int wardI;

	for(int i=1; ((directorio+i)->dir_inodo)!=NULL_INODO; i++){
		if((strcmp(nombre , (directorio+i)->dir_nfich ) == 0)){
			comprobar++;
			wardI=i;
			continue;
		}
	}

	return comprobar;
} 

int Borrar(EXT_ENTRADA_DIR *directorio, EXT_BLQ_INODOS *inodos, EXT_BYTE_MAPS *ext_bytemaps, EXT_SIMPLE_SUPERBLOCK *ext_superblock, char *nombre, FILE *fich ){
	short unsigned int comprobar=0;
	short unsigned int wardI;

	//Primero compruebo que el fichero existe
	for(int i=1; ((directorio+i)->dir_inodo)!=NULL_INODO; i++){
		if(strcmp(nombre, (directorio+i)->dir_nfich)==0){
			comprobar++;
			wardI=i;
			continue;
		}
	}

	if(comprobar){
		//Cambio los bytemaps y el super bloque
		ext_bytemaps->bmap_inodos[ (directorio+wardI)->dir_inodo ]= 0;
		for(int i=0; inodos->blq_inodos[(directorio+wardI)->dir_inodo].i_nbloque[i]!=NULL_INODO; i++){
			ext_bytemaps->bmap_bloques[inodos->blq_inodos[(directorio+wardI)->dir_inodo].i_nbloque[i]] = 0;
			//Añado un bloque libre al super bloque
			ext_superblock->s_free_blocks_count++;
		}

		ext_superblock->s_free_inodes_count++;


		//Elimino los datos del bloque
		inodos->blq_inodos[(directorio+wardI)->dir_inodo].size_fichero = 0;
		for(int i=0; i<MAX_NUMS_BLOQUE_INODO; i++){
			inodos->blq_inodos[(directorio+wardI)->dir_inodo].i_nbloque[i] = NULL_INODO;
		}
		//Ahora borro los datos del fichero
		for(int i=wardI; i<MAX_FICHEROS-1; i++){
			directorio[i] = directorio[i+1];
		}
	}


	return comprobar;
}


//--------TERMINAR FUNCION---------------
int Copiar(EXT_ENTRADA_DIR *directorio, EXT_BLQ_INODOS *inodos,
    EXT_BYTE_MAPS *ext_bytemaps, EXT_SIMPLE_SUPERBLOCK *ext_superblock,
    EXT_DATOS *memdatos, char *nombreorigen, char *nombredestino,  FILE *fich){

	int comprobar=0, wardI,ficheros=0;

	//Primero compruebo que el fichero existe
    for(int i=1; ((directorio+i)->dir_inodo)!=NULL_INODO; i++){
        if(strcmp(nombreorigen, (directorio+i)->dir_nfich)==0){
            comprobar++;
            wardI=i;
        }
            
		if(strcmp(nombredestino, (directorio+i)->dir_nfich)==0){
            return 0;
        }
            
		ficheros++;
    }

	return comprobar;
}

void GrabarDatos(EXT_DATOS *memdatos, FILE *fich){
	fseek(fich, 0, SEEK_SET);
	fwrite(memdatos, MAX_BLOQUES_DATOS*SIZE_BLOQUE, 1, fich);
}

void Grabarinodosydirectorio(EXT_ENTRADA_DIR *directorio, EXT_BLQ_INODOS *inodos, FILE *fich){
	fseek(fich, SIZE_BLOQUE*2, SEEK_SET);
	fwrite((EXT_DATOS *)inodos, SIZE_BLOQUE, 1, fich);
	fseek(fich, SIZE_BLOQUE*3, SEEK_SET);
	fwrite((EXT_DATOS *)directorio, SIZE_BLOQUE, 1, fich);
	
}

void GrabarByteMaps(EXT_BYTE_MAPS *ext_bytemaps, FILE *fich){
	fseek(fich, SIZE_BLOQUE*1, SEEK_SET);
	fwrite((EXT_DATOS *)ext_bytemaps, SIZE_BLOQUE, 1, fich);

}

void GrabarSuperBloque(EXT_SIMPLE_SUPERBLOCK *ext_superblock, FILE *fich){
	fseek(fich, SIZE_BLOQUE*0, SEEK_SET );
	fwrite((EXT_DATOS *)ext_superblock, SIZE_BLOQUE, 1,fich);
}


