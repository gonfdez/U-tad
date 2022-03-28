#include "ejercicioTypedef.h"

int main (){

	int seleccion;
	do {
		printf("\nMenu: (Para elegir escriba el numero de la opcion y presione enter)");
		printf("\n[1] Crear Arbol\n[2] Mostrar Arbol\n[3] Salir\n");
		
		scanf("%d",&seleccion);
		
		switch (seleccion) {
			case 1: 
					crearArbol();
					break;
					
			case 2: 
					mostrarArbol(resultado);
					break;
			case 3:
					return 0;
		}
		
	} while (seleccion != '3');

}