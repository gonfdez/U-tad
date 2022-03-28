#define MAX 5
#include <stdio.h>

struct usuario_t{
	char nombre[10];
	char apellido1[15];
	char DNI[9];
	int edad;
	float peso;
	char telefono[9];
};

struct usuario_t usuarios[MAX];

void main (){
struct usuario_t usuario1;
printf("\n Introduce el nombre del primer usuario:  ");
scanf("%s",usuario1.nombre);

printf("\n Introduce el apellido del primer usuario:  ");
scanf("%s",usuario1.apellido1);







}