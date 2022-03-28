#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
	int alto;
	int ancho;
	int **numeros; //Array doble de puntero para los numeros del carton
	int *marcados; //Array contiene 1 si el numero es marcado 0 si no lo es
}carton_t;

typedef struct {
	carton_t *carton; //Carton del usuario
	char *nombre;
}usuario_t;

void generarCarton(int anchoC,int altoC, usuario_t usuario, char *numerosCarton) {
	
	
	
	usuario.carton.alto = altoC;
	usuario.carton.ancho = anchoC;
	cartonC.numeros = (int **)malloc(altoC*sizeof(int*));
	
	int **numeros = cartonC.numeros;
	for (int i=0;i<altoC;i++) {
		numeros[i] = (int*)malloc(anchoC*sizeof(int)); 
	}
	
	
	char *w = strtok(numerosCarton,",");
	
	int contador = 0;
	
	while (w != NULL) {
		printf("   %s   ",*w);
		for (int u=0;u<anchoC;u++){
			for (int y=0;y<altoC;y++){
			numeros[u][y] = w[contador]; 
			contador++;
			}
		}
	}
}

usuario_t introducirJugador(int anchoC, int altoC) {
	usuario_t usuario;
	char *numerosCarton;
	
	printf("\nIntroduzca el nombre del jugador: ");
	scanf("%s",usuario.nombre);
	
	printf("\nIntroduzca sus numeros: ");
	scanf("%s",numerosCarton);

	generarCarton(anchoC,altoC,usuario,numerosCarton);

	return usuario;
}



void mostrarCartones(usuario_t *usuarios)  {

	int longitud = sizeof(usuarios) / sizeof(usuario_t);

	for (int i=0; i< longitud;i++){
		usuario_t usuario = *(usuarios+i);
		printf("\nUsuario %d: ",(i+1));
		printf("\nNombre: %s",usuario.nombre);
		printf("\nNumeros: ");
		
		carton_t carton = *(usuario.carton);
		int **numeros = carton.numeros;
		
		int altoC = carton.alto;
		int anchoC= carton.ancho;
		
		for (int u=0;u<anchoC;u++){
				printf("\n");
				for (int y=0;y<altoC;y++){
				printf("  %d    ",numeros[u][y]); 
				}
			}


	}
}

void main (int argc, char *argv[]){
	
	usuario_t *usuarios;
	
	int anchoCarton = *argv[1] - '0';
	int altoCarton = *argv[2] - '0';

	usuarios = (usuario_t*) malloc (1*sizeof(usuario_t));
	
	usuario_t usuario = introducirJugador(anchoCarton,altoCarton);
	usuarios[0] = usuario;
	
	mostrarCartones(usuarios);

}
	