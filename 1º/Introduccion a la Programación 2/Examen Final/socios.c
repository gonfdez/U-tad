#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct socio_t{
	char *fechaIngreso[11];
	char *dni[15];
} socio_t;

int numeroSocios = 0;
socio_t* listaSocios;
 


socio_t introduceSocio () {
	socio_t* listaTemp;	
	
		for (int i=0;i<numeroSocios-1;i++){
		listaTemp = (socio_t*)malloc(numeroSocios*sizeof(socio_t));
		listaTemp[i] = listaSocios[i]; 
		}
		realloc(listaSocios,numeroSocios*sizeof(socio_t));
		for (int u=0;u<numeroSocios-1;u++){
		listaSocios[u]=listaTemp[u];
		}

	
	socio_t socio;
	printf ("\nIntroduce fecha de ingreso en formato dd/mm/aaaa :\n");
	scanf ("%s",socio.fechaIngreso);
	printf("\nIntroduce el DNI :\n");
	scanf ("%s",socio.dni);
	
	return socio;
}

void mostrarListaSocios() {
	if (numeroSocios == 0) printf ("\nNo hay socios en la lista\n");
	for (int i=0;i<numeroSocios;i++) {
		printf("\n\nSOCIO %d:",i);
		printf("\nFecha de ingreso: %s",listaSocios[i].fechaIngreso);
		printf("       DNI : %s\n",listaSocios[i].dni);
	}

}

int main (int argc, char * argv[] ){
	int num = 1;	
	int seleccion;	
	listaSocios = (socio_t*)malloc(1*sizeof(socio_t));

while (num == 1) {
	printf("\n[1] Introducir socio nuevo\n");
	printf("[2] Mostrar listado de socios\n");
	printf("[3] Salir\n");
	scanf("%d",&seleccion);
	if (seleccion == 3) {return 0; free(listaSocios);}
	if (seleccion == 1) {
		numeroSocios++;
		listaSocios[numeroSocios-1] = introduceSocio();
	}
	if (seleccion == 2){
		mostrarListaSocios();
	}
}


}
