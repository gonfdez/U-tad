#include <stdio.h>
#include <stdlib.h>
//Creo un tipo tiempo para guardar minutos y segundos
typedef struct {
	int minutos;
	int segundos;
}tiempo;
//Creo un tipo nadador
typedef struct {
	char nombre;
	int edad;
	char prueba;
	tiempo tiempo;
}nadador;

nadador* nadadores;
int desviacionEstandar;

void entradaDatos(){
nadador* nadadores = (nadador *) malloc(16*sizeof(nadador));

//Variables temporales
	char nombre;
	int edad;
	char prueba;
	int minutos;
	int segundos;
	tiempo tiempo;

//Usuario mete los datos
 for (int i=0;i<17;i++){
	printf("\n\nIntroduzca los datos del nadador %d:",i);
	printf("\nNombre: ");
	scanf("%s",&nombre);
	printf("\nEdad: ");
	scanf("%d",&edad);
	printf("\nPrueba: ");
	scanf("%s",&prueba);
	printf("\nTiempo, Minutos:");
	scanf("%d",&minutos);
	printf("\nTiempo, Segundos:");
	scanf("%d",&segundos);
	
	tiempo.minutos = minutos;
	tiempo.segundos = segundos;
	
	nadadores[i].nombre = nombre;
	nadadores[i].edad = edad;
	nadadores[i].prueba = prueba;
	nadadores[i].tiempo = tiempo;
 }

}

void calculoDesviacion() {
//variables
int media = 0;
int sumaMinutos = 0;
int sumaSegundos = 0;
int totalSegundos = 0;
int desviacionTotal = 0;

//Sumo todos los tiempos
for (int u=0;u<17;u++){
sumaMinutos = sumaMinutos + nadadores[u].tiempo.minutos;
sumaSegundos = sumaSegundos + nadadores[u].tiempo.segundos;
}
//Lo paso todo a segundos para calcular la desviacion media
sumaMinutos = sumaMinutos*60;
totalSegundos = sumaMinutos + sumaSegundos;
//Calculo la media total de tiempo
media = totalSegundos / 16;
//Calculo la suma de las desviaciones
for (int y=0;y<17;y++){
desviacionTotal = desviacionTotal + (((nadadores[y].tiempo.minutos*60)+nadadores[y].tiempo.segundos)
- media);
}
//Calculo la desviacion estandar
desviacionEstandar = desviacionTotal/16;

}
int main() {
	
	
	entradaDatos();
	
	calculoDesviacion();
	printf("\n\nLa desviacion estandar es = %d",desviacionEstandar);
}