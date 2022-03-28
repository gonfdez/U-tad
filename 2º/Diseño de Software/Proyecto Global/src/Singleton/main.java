package Singleton;
import java.util.Scanner;
		import Enemigos.*;
		import Jugador.*;
		import Singleton.Singleton;
		
public class main {


			public static void main(String[] args) {
				//Prueba 1 JUGADOR ----------------------------------
				//Generacion del personaje del jugador
				/*
				JugadorPrincipal p1 = new JugadorPrincipal();
				p1.generarAtributos();
				
				p1.generarDecoracion(p1);
				*/
				//CORRECTO
				
				//Prueba 2 ENEMIGOS ----------------------------------
				
				//Generacion de Enemigos
				/*
				//Array para guardar enemigos
				Enemigo[] enemigos = new Enemigo[4];
				
				//FabricaEnemigos debe ser una interfaz y despues tener una clase de cada tipo de fabrica, MAGOS, GUERREROS, ETC...
				FabricaEnemigos fabrica = new FabricaEnemigos();
				
				
				for (int u=0;u<4;u++) {
					enemigos[u] = fabrica.creaEnemigo();
				}
				
				for (int u=0;u<4;u++) {
					enemigos[u].mostrarCaracteristicas();
				}
				/*
				//Funciona
				/*
				Enemigo ola = fabrica.creaEnemigo();
				ola.mostrarCaracteristicas();
				//Funciona
				for (int y=0;y<4;y++) {
					enemigos[y] = fabrica.creaEnemigo();
					enemigos[y].mostrarCaracteristicas();
				}
				//Funciona
				*/
				
				//CORRECTO
				
				//Prueba 3  SINGLETON ----------------------------------
				
				Singleton singleton = Singleton.getInstance();
				singleton.consola();
				//Funciona
				
				
				
				
				
			}//Fin del MAIN


			
			
			
			
}//Fin clase Prueba



