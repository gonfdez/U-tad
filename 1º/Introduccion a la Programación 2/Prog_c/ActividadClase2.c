#include <stdio.h>
#define MAX 250
int comprobacion (char *palabras);


void main(void){
char palabras[MAX];
printf("\nIntroduce una lista de objetos separados por comas: \n");

do {
	for(int t=0;t<MAX;t++){
		palabras[t]='\0';
	}
	scanf("%s", palabras);
} while (comprobacion(palabras));

}


int comprobacion (char *palabras){
for (int i=0; palabras[i] !='\0' ; i++){
	if ( ((palabras[i] < 'a') || (palabras[i] > 'z'))&&( palabras[i]!=',' )) {
		printf("\nHas introducido alguna letra mayuscula o un caracter numerico, vuelve a intentarlo\n");
		return 1;
}
} return 0;
}