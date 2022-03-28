#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void escribeFichDesor(FILE *f) {
fprintf(f,"3;Spain-Germany");
fprintf(f,"\n");
fprintf(f,"2;France-Spain");
fprintf(f,"\n");
fprintf(f,"1;Spain-Italy");
fprintf(f,"\n");
fprintf(f,"4,USA-Spain");
fprintf(f,"\n");
}

char** leerYGuardar (FILE *f) {
int maxLineas = 4;
//Vuelvo al principio por si acaso
rewind(f);

//Genero un array de punteros doble para guardar cada linea
char **lineas = (char**) malloc (maxLineas*sizeof(char*));
for (int i=0;i<4;i++) {
lineas[i] = (char*) malloc (30*sizeof(char));
}

int contador = 0;
int contadorLetras = 0;
int contadorLinea = 0;
char letra = '\0';

//Almaceno cada linea que mientras la leo
for (int u=0;u<4;u++) {
	letra = getc(f);
	while ((letra!='\n')&&(!feof(f))) {
		lineas[contadorLinea][contadorLetras] = letra;
		contadorLetras++;
		letra = getc(f);
	}
	lineas[contadorLinea][contadorLetras] = '\0';
	contadorLetras = 0;
	contadorLinea++;
}
return lineas;
}


void ordenoLineas (char** lineas) {
for (int r=0;r<3;r++){
	for (int i=0;i<3;i++){
		if ((lineas[i][0]-'0') > (lineas[i+1][0]-'0')) {
		char *lineaTemp = lineas[i+1];
		lineas[i+1] = lineas[i];
		lineas[i] = lineaTemp;
	} 
}
}

}

void escribeOrdenado(char **lineas,FILE *calendarioOrdenado) {
for (int w=0;w<4;w++) {
	fprintf(calendarioOrdenado,"%s\n",lineas[w]);
}
}

void mostrarFichero() {
FILE* calendarioOrdenado = fopen("calendario_ordenado.txt","r");
printf ("Mostrando por pantalla 'calendario_ordenado.txt'\n");
char letra;

letra = getc(calendarioOrdenado);
while ( feof(calendarioOrdenado) == 0 ) {
	printf("%c",letra);
	letra = getc(calendarioOrdenado);
}
fclose(calendarioOrdenado);
}



int main (int argc, char* argv[]){

//Creo el primer fichero "calendario_desordenado.txt"
FILE *calendarioDesordenado = fopen ("calendario_desordenado.txt","w+");
escribeFichDesor(calendarioDesordenado);
//Leo el fichero calendarioDesordenado y guardo cada linea en un array doble de punteros
char **lineas = leerYGuardar(calendarioDesordenado);
fclose(calendarioDesordenado);
//Funciona

//Ordeno el array de lineas en funcion del orden de los partidos
ordenoLineas(lineas);
//Funciona

//Creo el fichero "calendario_ordenado.txt"
FILE *calendarioOrdenado = fopen ("calendario_ordenado.txt","w+");
//Relleno el fichero con la informacion ordenada
escribeOrdenado(lineas,calendarioOrdenado);
fclose(calendarioOrdenado);
//Muestro el fichero "calendario_ordenado.txt" por pantalla
mostrarFichero(calendarioOrdenado);


}
