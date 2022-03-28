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

struct usuario_t usuario1,usuario2,usuario3,usuario4,usuario5;
usuarios[1] = usuario1;
usuarios[2] = usuario2;
usuarios[3] = usuario3;
usuarios[4] = usuario4;
usuarios[5] = usuario5;

for (int i = 1; i < 6; i++){
	printf("\n Introduce el nombre del usuario:  ");
	scanf("%s",usuarios[i].nombre);

	printf("\n Introduce el apellido del usuario:  ");
	scanf("%s",usuarios[i].apellido1);

	printf("\n Introduce el DNI:  ");
	scanf("%s",usuarios[i].DNI);

	printf("\n Introduce la edad: ");
	scanf("%d",usuarios[i].edad);

	printf("\n Introduce peso:  ");
	scanf("%f",usuarios[i].peso);

	printf("\n Introduce el telefono:  ");
	scanf("%s",usuarios[i].telefono);
}

}