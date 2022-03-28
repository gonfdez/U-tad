#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include<stdbool.h>

typedef struct {
	int diaJuliano;
	int numeroRef;
	char *nombreProducto;
	char *nombreProveedor;
	float precioCoste;
	float precioVenta;
	int numeroPedidosVendidos;
}producto_t;


void creaProducto(producto_t *productos, int argumento){
	//Metodo para que el usuario rellene los datos del producto	
	for (int i=0;i<=argumento-1;i++) {
		
		printf("\nDia Juliano: ");
		
		scanf("%d",&productos[i].diaJuliano);
		
		printf("Numero de referencia: ");
		
		scanf("%d",&productos[i].numeroRef);
		
		printf("Nombre del producto: ");
		
		scanf("%s",productos[i].nombreProducto);
		
		printf("Nombre del proveedor: ");
		
		scanf("%s",productos[i].nombreProveedor);
		
		printf("Precio de coste: ");
		
		scanf("%f",&productos[i].precioCoste);
		
		printf("Precio de venta: ");
		
		scanf("%f",&productos[i].precioVenta);
		
		printf("Numero pedidos vendidos: ");
		
		scanf("%d",&productos[i].numeroPedidosVendidos);

	}
}

void mostrarProducto (producto_t *productos, int argumento){
	//Metodo para mostrar los productos introducidos
	for (int u=0;u<=argumento-1;u++) {
		
		printf("\nDia Juliano: %d",productos[u].diaJuliano);
		
		printf("\nNumero de referencia : %d",productos[u].numeroRef);
		
		printf("\nNombre del producto: %s",productos[u].nombreProducto);
		
		printf("\nNombre del proveedor: %s",productos[u].nombreProveedor);
		
		printf("\nPrecio de coste: %f",productos[u].precioCoste);

		printf("\nPrecio de venta: %f",productos[u].precioVenta);
		
		printf("\nNumero pedidos vendidos: %d\n",productos[u].numeroPedidosVendidos);
		
	}
}
	
void modificaNombres(producto_t *productos,int argumento) {
	//Metodo para modificar el nombre de los productos y añadirles parte del proveedor
	for (int u=0;u<=argumento-1;u++) {
		
		char *nombre = productos[u].nombreProducto;
		char *proveedor = productos[u].nombreProveedor;

		char uno[5];
		uno[0] = '_';
		uno[1] = proveedor[0];
		uno[2] = proveedor[1];
		uno[3] = proveedor[2];
		uno[4] = '\0';
		strcat(nombre,uno);
		
	}
}

void ordenAlfa(producto_t *productos, int argumento){
	//Metodo para ordenar en orden alfabetico los productos
	producto_t pt;
	
	for (int u=0;u<argumento;u++) {
		for (int y=u+1;y<argumento;y++){
			if (strcmp(productos[u].nombreProducto,productos[y].nombreProducto) > 0 ) {
				pt = productos[u];
				productos[u] = productos[y];
				productos[y] = pt;
			}
		}

	}
}


void ganancias(producto_t *productos, int argumento) {
	//Metodo para calcular las ganancias del dia
	int ganancias = 0;
	for (int u=0;u<=argumento-1;u++) {
	ganancias = ganancias + ((productos[u].precioVenta-productos[u].precioCoste)*productos[u].numeroPedidosVendidos);
	}
	
	printf("\n Las ganacias hoy han sido : %d€\n",ganancias);



}

int main (int argc, char *argv[]){

	int argumento = *argv[1] - '0';
	
	producto_t *productos =(producto_t*) malloc(argumento*sizeof(producto_t));
	
	if (productos == NULL ) 
		printf("\nERROR DE MEMORIA\n");
	
	printf("\nIntroduce los siguientes datos:\n");

	creaProducto(productos,argumento);
	//Funciona
	printf("\nMOSTRANDO PRODUCTOS:\n");
	mostrarProducto(productos,argumento);
	//Funciona
	
	modificaNombres(productos,argumento);
	
	printf("\nMOSTRANDO PRODUCTOS CON NOMBRE MODIFICADO:\n");
	mostrarProducto(productos,argumento);
	
	ganancias(productos,argumento);
	
	
	printf("\nMOSTRANDO PRODUCTOS ORDENADOS ALFABETICAMENETE:\n");
	ordenAlfa(productos,argumento);
	
	mostrarProducto(productos,argumento);
	
	free(productos);
	
}
