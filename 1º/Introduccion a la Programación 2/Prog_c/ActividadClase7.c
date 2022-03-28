


struct autor_t 
{
char nombre[10];
char apellido[10];
char nacionalidad[10];
};

struct libro_t 
{
char titulo[20];
char ISBN[13];
int nPags;
char editorial[20];
struct autor_t;
};