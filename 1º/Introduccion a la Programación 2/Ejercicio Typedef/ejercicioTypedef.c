#include "ejercicioTypedef.h"

//funciones
arbol_t crearArbol(){

int numeroHojasEj,numeroRamasEj;
short numeroRaicesEj;

printf("Introduce los siguientes datos, por favor.\nNumero de hojas: ");
scanf("%d",&numeroHojasEj);
printf("Numero de ramas: ");
scanf("%d",&numeroRamasEj);
printf("Numero de raices: ");
scanf("%d",&numeroRaicesEj);
printf("Nombre del arbol: ");
scanf("%s",resultado.nombreArbol);

resultado.numeroHojas = numeroHojasEj;
resultado.numeroRamas = numeroRamasEj;
resultado.numeroRaices = numeroRaicesEj;

return resultado;
}

void mostrarArbol(arbol_t arbol){

printf("\nInformacion del Arbol\nNumero de hojas: %d",arbol.numeroHojas);
printf("\nNumero de ramas: %d",arbol.numeroRamas);
printf("\nNumero de raices: %d",arbol.numeroRaices);
printf("\nNumero de ramas: %s",arbol.nombreArbol);
}

