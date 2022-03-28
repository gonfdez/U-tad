#include<stdio.h>
int main (int argc, char *argv[]){
int i;
printf("Argumentos de la linea de ordenes: \n\n");
	for (i=0;i<argc;i++){
	printf("El argumento %d es %s\n",i,argv[i]);
	}

printf("\n\n Terminacion normal del programa.\n");
return 0;

} 