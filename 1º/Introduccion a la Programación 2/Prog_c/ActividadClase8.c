
struct usuario_t {
char nombre[10];
char apellido1[15];
char dni[9];
int edad;
double peso;
char telefono[9]; 
};

void imprimeUsuario( struct usuario_t){
printf("usuario: \n Nombre: %s \n Apellido: %s",usuario_t.nombre,usuario_t.apellido1);
printf("\n DNI: %s \n Edad: %d \n Peso: %lf \n Telf: %s",usuario_t.dni, usuario_t.edad, usuario_t.peso,usuario_t.telefono);
}


void main() {
printf("Escribe el nombre de usuario:\n");
fgets(usuario_t.nombre,11,stdin);
printf("apellido:\n");
fgets(usuario_t.apellido1,16,stdin);
printf("dni:\n");
fgets(usuario_t.dni,10,stdin);
printf("edad:\n");
scanf("%d",&usuario_t.edad);
printf("peso:\n");
fgets(usuario_t.apellido1,16,stdin);
printf("telefono:\n");
fgets(usuario_t.telefono,10,stdin);

imprimeUsuario(usuario_t);



}