#include <stdio.h>
#include <stdlib.h>

int tamanoFichero(char* nombreFichero){
	FILE * f;
	f = fopen (nombreFichero,"r");
	int contadorLetras = 0;
	char l;
	l = getc(f);
	while (feof(f) == 0) {
		contadorLetras++;
		l = getc(f);
	}
	int tamano = contadorLetras * sizeof(char);
	printf ("El tamano es de %d Bytes\n",tamano);
}

int existeFichero(char *nombreFichero) {

	FILE * f;
	f = fopen (nombreFichero,"r");
	if (f == NULL) {
		printf ("\nNo existe el fichero %s\n",nombreFichero);
		return 0;
	}
	printf ("\nEl fichero %s existe\n",nombreFichero);
	fclose (f);
	tamanoFichero(nombreFichero);
	return 1;
}


int main (int argc,char* argv[] ){
	existeFichero(argv[1]);
}
