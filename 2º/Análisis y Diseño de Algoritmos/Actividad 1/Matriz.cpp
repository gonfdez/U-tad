#include "Matriz.h"
#include <iostream>
#include <math.h>
#include <stdlib.h>
#define assertdomjudge(x) if(!(x)){std::cout<<"ERROR"<<std::endl;exit(0);}

// Constructores
Matriz::Matriz() {
  n_filas = 0;
  n_columnas = 0;
  matriz = NULL;
}
Matriz::Matriz(const int& _n_filas, const int& _n_columnas) {
  n_filas=_n_filas;
  n_columnas=_n_columnas;
  if(n_filas>0 && n_columnas>0) {
      matriz= new double *[n_filas];
      for (int i = 0; i < n_filas; i++) {
        matriz[i] = new double[n_columnas];  
      }
  } else {
    matriz = new double *[0];
    matriz[0] = new double[0];
  }
}


//Asignacion de matrices

Matriz& Matriz::operator= (const Matriz &m)
{
  if(matriz!=NULL)
    {
      for (int i = 0; i < n_filas; i++)
	delete[] matriz[i];
      
      delete[] matriz;
      matriz=NULL;
    }

  this->n_filas=m.n_filas;
  this->n_columnas=m.n_columnas;
  this->matriz=NULL;
  if(n_filas>0 && n_columnas>0)
    {
      matriz= new double *[n_filas];
  
      for (int i = 0; i < n_filas; i++)
	{
	  matriz[i] = new double[n_columnas];  
	  for(int j=0; j <n_columnas; j++)
	    matriz[i][j]=m.matriz[i][j];
	}
    }
  
    return(*this); 
}


// Leer matriz
void Matriz::rellenarManual()
{
  double elemento;
  for (int i = 0; i < n_filas; i++)
  {
    cout << "Fila " << i << endl;
    for (int j = 0; j < n_columnas; j++)
    {
      cout << "Elemento " << j  << endl;
      cin >> elemento;
      matriz[i][j] = elemento;
    }
        cout << endl;
  }
  
}

// Rellenar Matriz Aleatoria
void Matriz::rellenarAleatorio(long seed)
{
  srand(seed);
  for (int i = 0; i < n_filas; i++)
    for (int j = 0; j < n_columnas; j++)
      matriz[i][j]=rand();
  
}



// Imprimir Matriz
void Matriz::mostrarMatriz()
{
  for (int i = 0; i < n_filas; i++)
      {
	for (int j = 0; j < n_columnas; j++)
	  cout << matriz[i][j] << " ";       
        cout << endl;
    }
}


//  Sumar Matriz
Matriz& Matriz::operator+ (const Matriz &m)
{
  Matriz* r=new Matriz(n_filas,n_columnas);
  if (n_filas != m.n_filas || n_columnas != m.n_columnas){
    cout << "Las matrices deben tener el mismo numero de filas y columnas para realizar la operacion." << endl;
  } else {  
    for (int i = 0; i < n_filas; i++)
    {
      // matriz[i] = new double[n_columnas];  
      for(int j=0; j <n_columnas; j++)
        r->matriz[i][j] = matriz[i][j] + m.matriz[i][j];
    }
  }
  return *r;
}

//  Restar Matriz
Matriz& Matriz::operator- (const Matriz &m)
{
  Matriz* r=new Matriz(n_filas,n_columnas);
  if (n_filas != m.n_filas || n_columnas != m.n_columnas){
    cout << "Las matrices deben tener el mismo numero de filas y columnas para realizar la operacion." << endl;
  } else {  
    for (int i = 0; i < n_filas; i++)
    {
      // matriz[i] = new double[n_columnas];  
      for(int j=0; j <n_columnas; j++)
        r->matriz[i][j] = matriz[i][j] - m.matriz[i][j];
    }
  }
  return *r;
}

//  Multiplicar por escalar
Matriz& Matriz::operator* (const double &n)
{
  Matriz* r=new Matriz(n_filas,n_columnas);
    for (int i = 0; i < n_filas; i++)
    {
      for(int j=0; j <n_columnas; j++)
        r->matriz[i][j] = matriz[i][j] * n;
    }
  return *r;
}

//  Multiplicar por Matriz
Matriz& Matriz::operator* (const Matriz &m)
{ 
  Matriz* r=new Matriz(n_filas,m.n_columnas);
  if (n_columnas != m.n_filas) {
    cout<<" Las matrices no son multiplicables. El numero de columnas de A debe ser igual a las filas de B."<<endl;
  } else {  
      for (int i = 0; i < n_filas; i++) // Por cada fila de A
        for(int j=0; j < m.n_columnas; j++) // Por cada columna de B
          for (int k=0; k < m.n_filas; k++) // Valor K me permite iterar entre las columnas de la matriz B
          {
            r->matriz[i][j] = matriz[i][j] +( matriz[i][k] * m.matriz[k][j] );
          }
  }
  return *r;
}


// Obtener maximo de una matriz
double Matriz::obtenerMaximo()
{
  double r = matriz[0][0];
  for (int i=0;i<n_filas;i++)
    for (int j=0;j<n_columnas;j++) 
    {
      if (r < matriz[i][j]) r = matriz[i][j];
    }
  return r;
}

// Obtener minimo de una matriz
double Matriz::obtenerMinimo()
{
  double r = matriz[0][0];
  for (int i=0;i<n_filas;i++)
    for (int j=0;j<n_columnas;j++) 
    {
      if (r > matriz[i][j]) r = matriz[i][j];
    }
  return r;
}

// Calcular la traspuesta de una matriz
Matriz& Matriz::calcularTraspuesta()
{
  Matriz* t=new Matriz(n_columnas,n_filas); 
  for (int i=0;i<n_filas;i++)
    for (int j=0;j<n_columnas;j++) 
    {
      t->matriz[i][j] = matriz[j][i];
    }
  return *t;
}

// Determinar si una matriz es simetrica
bool Matriz::esSimetrica()
{
  Matriz t= calcularTraspuesta(); 
  for (int i=0;i<n_filas;i++)
    for (int j=0;j<n_columnas;j++) 
    {
      if (matriz[i][j] != t.matriz[i][j]) return false;
    }
  return true;
}