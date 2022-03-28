#include <stdio.h>
#include <stdlib.h>
char array_char[]={'X','Y','Z'};

char* punt_array = &array_char[0];

void imprimeArray(char* puntero){
		
		printf("\nEl contenido del Array es: ");
	
		printf("%s,",puntero);
		printf("%s,",puntero+1);
		printf("%s,",puntero+2);
}

void main(){
	imprimeArray(punt_array);
	imprimeArray(array_char);
}