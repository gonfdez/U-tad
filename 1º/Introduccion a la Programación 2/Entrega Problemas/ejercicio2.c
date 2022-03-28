#include <stdio.h>
#include <stdlib.h>

int longitud = 0;
int contador= 0;
int* pila;

void push(int valor) {
	//Aumento el tamaño de la pila, porque se quiere introducir un valor
	longitud++;
	
	//Creo una pila para guardar temporalmente los valores
	int* pilaTemporal = (int *) malloc(longitud*sizeof(int));
	if (longitud != 1) { //Al introducir el primer valor esto no es necesario
		for (int i=0;i<longitud;i++){
			pilaTemporal[i]=pila[i]; //guardo los valores en la pila temporal
		}
	}
	//Hago la pila con la nueva longitud
	pila = (int *) malloc(longitud*sizeof(int));
	
	//Relleno la pila con los valores que tenia antes
	if (longitud != 1) { //Al introducir el primer valor esto no es necesario
		for (int i=0;i<longitud;i++){
			pila[i]=pilaTemporal[i];
		}
	}
	
	//Se guarda el valor, en el ultimo lugar de la pila
	pila[longitud-1] = valor;

	printf("\nPila:  ");
	for (int u=0;u<longitud;u++){
		printf("%d,",pila[u]);
	}
}

void pop() {
	//Recupero el valor, ultimo en introducirse en la pila
	printf("\nValor recuperado: %d\n",pila[longitud-1]);

	//Reduzco el tamaño
	longitud--;
	
	printf("\nlongitud = %d\n",longitud);
	
	//Creo una pila para guardar temporalmente el resto de valores
	int* pilaTemporal = (int *) malloc(longitud*sizeof(int));
	
	for (int i=0;i<longitud;i++){
		pilaTemporal[i]=pila[i]; //Guardo temporalmente los valores
	}
	//Hago de nuevo la pila
	pila = (int *) malloc(longitud*sizeof(int));
	for (int i=0;i<longitud;i++){
		pila[i]=pilaTemporal[i];
	}
	
	printf("\nPila:  ");
	for (int u=0;u<longitud;u++){
		printf("%d,",pila[u]);
	}
}

int main() {
	int seleccion;
	do {
		printf("\nIntroduce el valor para almacenar en la pila: ");
		printf("\n[0] Recupera un valor\n[-1] Finaliza el programa\n");
		scanf("%d",&seleccion);
		
		if (seleccion == 0) {
				pop();
		}
		else {
			push(seleccion);
		}
		
	} while (seleccion !=-1);
	return 0;
}