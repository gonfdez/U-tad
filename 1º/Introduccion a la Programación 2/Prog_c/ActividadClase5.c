#include<stdio.h>
#define MAX 100

int main (int argc, char *argv[]){
int i,u;
int resultado = 0;
int numeros[MAX];
printf("Argumentos de la linea de ordenes: \n\n");
	for (i=0;i<argc;i++){
	printf("El argumento en la posicion %d es:\n",i);
	scanf("%d",(numeros+i));
	resultado = resultado + (numeros+i);
	}
resultado = resultado / argc;
printf("\n\nLa media es:\n %d",resultado);

return 0;

} 