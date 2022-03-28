#include "strToNumber.h"

int main (int argc, char* argv[]){

printf("Introducido (Strings):\n %s \n %s \n\n", argv[1], argv[2]);

if (argc > 3 ) { printf("\n ERROR, se requieren unicamente dos parametros.");
return 0; }
//Transformacion char > Int
strToInteger(argv[1]);

if (resultado1 != 0) 
	printf("\n El numero Int es: %D", resultado1);

//ERROR
else {
	printf("\n ERROR en el numero Int tiene mas de 9 cifras\n"); return 0; 
}

//Transformacion char > float
strToFloat(argv[2]);

if (resultado2 != 0) 
	printf("\n El numero Float es: %f",resultado2);

//ERROR
else {
	printf("\n ERROR el numero Float tiene mas de 9 cifras\n"); return 0;
}

//comprobaciones
printf("\n\n\n COMPROBACIONES:\n Para el numero FLOAT: \n noDecimal = %f \n decimal = %f",noDecimal,decimal);
printf ("\n\n contador enteros = %d \n contador decimales = %d \n contador total = %d \n",contador2,contador3,contadorTotal);


}//fin main