#include <stdio.h>
#include <stdlib.h>
#include <time.h>
//utilizo una matriz de 3x3

//variables para aritmetica de punteros
int matriz [8];
int* ptrmatriz;

//variables para indexacion
int* matrizIndex;

//PRIMERA FUNCION: ARITMETICA DE PUNTEROS
void introduceMatriz () {

	int contador1 = 1;
	int contador2 = 1;
	int contador3 = 1;

	ptrmatriz = &matriz[0];  //Pongo el puntero en la primera posicion

	printf("\nIntroduce la matriz, valor a valor: (Escribe el valor y pulsa ENTER) ");

	//Bucle para introducir la matriz por el usuario
	for (int i=0;i<=8;i++) {
		
		if (i<3) {	
			//Primeras 3 posiciones, Fila 1 de la matriz
			printf("\nValor 1.%d: ",contador1);
			scanf("%d",ptrmatriz);
			ptrmatriz++;
			contador1++;
		}
		if (i>=3 && i<=5) { 
			//Fila 2 de la matriz
			printf("\nValor 2.%d: ",contador2);
			scanf("%d",ptrmatriz);
			ptrmatriz++;
			contador2++;
		}
		if (i>5) {
			//Fila 2 de la matriz
			printf("\nValor 3.%d: ",contador3);
			scanf("%d",ptrmatriz);
			ptrmatriz++;
			contador3++;
		}		
	}
}

void imprimirMatriz () {
	printf("\nLa matriz es:\n");
	for (int u = 0;u<=8;u++){
		printf("%d,",matriz[u]);
		if (u == 2 || u == 5) printf("\n");
	}
}

int esSimetrica() {
	
	int* ptrmatrizI;
	int* ptrmatrizF;
	//Pongo un puntero en la primera posicion
	ptrmatrizI = &matriz[0]; 

	//Pongo un puntero en la ultima posicion
	ptrmatrizF = &matriz[8];
	
	
	//El usuario introduce la matriz
	introduceMatriz();
	
	imprimirMatriz();
	
	//Comprueblo si es simetrica
	for (int y=0;y<4;y++) {
		if (*ptrmatrizI == *ptrmatrizF) {
			ptrmatrizI++;
			ptrmatrizF--;
		}
		else {
			printf("\n\nLa matriz introducida no es simetrica.\n");
			return 0;
		}
	}
	printf("\n\nLa matriz introducida es simetrica.\n");
	return 1;
}

//SEGUNDA FUNCION: INDEXACION
void generaMatrizRandom(){
	srand(time(NULL));//activamos la generacion de numeros random
	for(int o=0;o<=8;o++){
	matrizIndex[o]= (rand()%19) + 1; //asignamos un numero random entre 1-19
	}
}

void imprimirMatrizIndex(){
	printf("\nLa matriz generada de forma aleatoria es:\n");
	for (int p = 0;p<=8;p++){
		printf("%d,",matrizIndex[p]);
		if (p == 2 || p == 5) printf("\n");
	}
}

int esSimetricaIndex() {
	//Reservo el espacio en el puntero
	matrizIndex = (int *) malloc(9*sizeof(int));
	
	generaMatrizRandom();
	
	imprimirMatrizIndex();
	
	//Comprueblo si es simetrica
	for (int y=0;y<4;y++) {
		int count1 = 0;
		int count2 = 8;
		if (matrizIndex[count1] == matrizIndex[count2]) {
			matrizIndex[count1++];
			matrizIndex[count2--];
		}
		else {
			printf("\n\nLa matriz introducida no es simetrica.\n");
			free(matrizIndex);
			return 0;
		}
	}
	printf("\n\nLa matriz introducida es simetrica.\n");
	free(matrizIndex);
	return 0;
}



int main () {
	int seleccion;
	do {
	//Menu
	printf("\nMenu: (Escribe el valor entre corchetes y presiona ENTER)\n");
	printf("[1] Introducir matriz y comprobar si es simetrica.\n");
	printf("[2] Generar matriz aleatoria y comprobar si es simetrica.\n");
	printf("[3] Salir.\n");
	scanf("%d",&seleccion);
	
		switch (seleccion) {
			case 1:
				esSimetrica();
				break;
			case 2:
				esSimetricaIndex();
				break;
			case 3:
				return 0;
		}
	} while (seleccion != 0);
}