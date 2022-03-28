package Singleton;

import java.util.Scanner;

import Enemigos.*;
import Estrategias.*;
import Jugador.JugadorPrincipal;

public class Singleton {

	private int contador = 0;
	private static Singleton instancia = null;
	
	private Singleton() {}
	
	public static Singleton getInstance() {
		if (instancia == null) {
			instancia = new Singleton();
		}
		return instancia;
	}
	
	public void consola() {
		JugadorPrincipal p1 = new JugadorPrincipal();
		p1.generarAtributos();
		//Funciona
		p1.generarDecoracion(p1);
		//Funciona
		while (p1.getVida() > 0) {
			combate(p1);
		}
		
	}//Fin metodo CONSOLA
	
	public void combate(JugadorPrincipal p) {
			contador++;
			System.out.print("\n-----------------[ "+contador+"º COMBATE ]-----------------\n");
			
			String escenario = this.generadorDeMundos();
			int bonificacion = this.bonificacionElementoEscenario(p, escenario);
			
			System.out.print("\nEscenario: "+escenario);
			System.out.print("\nBonificacion de elemento: "+bonificacion+" puntos");
			System.out.print("\nENEMIGO:");
			
			
			
			FabricaEnemigos fabrica = new FabricaEnemigos();
			Enemigo enemigo = fabrica.creaEnemigo();
			this.mundoDelEnemigo(escenario, enemigo);
			
			enemigo.mostrarCaracteristicas();
			
			int turno = (int) Math.floor( Math.random()*1 + 1 );  //Numero aleatorio entre 1,2 (50%)
			//Cuando "turno" tiene valor impar es turno del jugador, y cuando es impar es turno del enemigo.
			
			while (enemigo.getVida() > 0) {	
				calculadoraCombate(p,enemigo,turno,bonificacion);
				finDeTurno(p,enemigo,turno);
				turno++;
			}
		
	}//Fin metodo COMBATE
	
	public String escogeEstrategia(int turno, Enemigo e) {
			Contexto c = null;
			String estrategia = null;	
			int seleccion;
			if (turno%2 != 0) {
			
				Scanner sc = new Scanner(System.in);
			
				System.out.print("\n\nEs tu turno. Elige que estrategia quieres utilizar:\n");
				System.out.print("[1] Ataque Directo\n[2] Ataque Magico\n[3] Ataque Sorpresa\n[4] Posicion Defensiva\n");
				
				seleccion = sc.nextInt();
				
				while (seleccion < 1 || seleccion > 4 ) { 
					System.out.print("Introduce un numero entre [1-4] por favor ");
					seleccion = sc.nextInt();
				}
				
				switch (seleccion) {//Patron strategy, para las estrategias
					case 1:
						c = new Contexto(new AtaqueDirecto());
						estrategia = c.estrategiaLucha();
						break;
					case 2:
						c = new Contexto(new AtaqueMagico());
						estrategia = c.estrategiaLucha();
						break;
					case 3:
						c = new Contexto(new AtaqueSorpresa());
						estrategia = c.estrategiaLucha();
						break;
					case 4:
						c = new Contexto(new PosicionDefensiva());
						estrategia = c.estrategiaLucha();
						break;
				}
				
				return estrategia;
			}
			
			else {
				return e.escogeEstrategiaEnemigo(); //Metodo de eleccion de estrategia del enemigo (Template Method)
			}
				
	}//Fin metodo escogeEstrategia
	
	
	public void calculadoraCombate(JugadorPrincipal p, Enemigo e, int turno,int bonificacion) {
		
		String estrategia = escogeEstrategia(turno,e);
		
		
		int v1,v2,v3,v4;//Variables usadas para los calculos;
		
		
		if (turno%2 != 0) { //Turno del jugador 
			
			switch (estrategia) {
			case "directo":
				v1 = p.getFuerza() + bonificacion;
				v2 = e.getFuerza();
				v3 = v1 - v2;
				v4 = e.getVida();
				if (v3 <= 0) {
					System.out.print("\n¡El enemigo es inmune a ese ataque!\n"); 
					break;
				}
				else { 
					e.setVida(v4-v3);
					System.out.print("\nENEMIGO -> -"+v3+" de vida");
					break;
				}
			case "magico":
				v1 = p.getSkillMagica() + bonificacion;
				v2 = e.getSkillMagica();
				v3 = v1 -v2;
				v4 = e.getVida();
				if (v3 <= 0) {
					System.out.print("\n¡El enemigo es inmune a ese ataque!\n");
					break;
				}
				else { 
					e.setVida(v4-v3);
					System.out.print("\nENEMIGO -> -"+v3+" de vida");
					break;
				}
			case "sorpresa":
				v1 =  (int) ((int) p.getVelocidad() + ( p.getFuerza()*0.1 ) + (0.3 * p.getSkillMagica())) + bonificacion;
				v2 =  (int) ((int) e.getVelocidad() + ( e.getFuerza()*0.1) + (0.3 * e.getSkillMagica()));
				v3 = v1 - v2;
				v4 = e.getVida();
				if (v3 <= 0) {
					System.out.print("\n¡El enemigo es inmune a ese ataque!\n");
					break;
				}
				else { 
					e.setVida(v4-v3); 
					System.out.print("\nENEMIGO -> -"+v3+" de vida");
					break;
				}
			case "defensiva":
				v3= (int) Math.floor( Math.random()*1 + 1 );  //Numero aleatorio entre 1-2 (50%)
				v1=(int) (p.getSkillMagica()*0.35);
				v2 = p.getVida();
				v4 = v2 + v1 + bonificacion;
				if (v3 == 1) {
					p.setVida(v4);
					System.out.print("\nJUGADOR -> +"+v1+" de vida");
					break;
				}
				else {
					System.out.print("\n¡No sirvio de nada!\n");
					break;
				}
			
			}
		
		}
		else { //Turno del enemigo
			switch (estrategia) {
			case "directo":
				v1 = e.getFuerza();
				v2 = p.getFuerza();
				v3 = v1 - v2;
				v4 = p.getVida();
				if (v3 <= 0) {
					System.out.print("\n¡Eres inmune a ese ataque!\n"); 
					break;
				}
				else { 
					p.setVida(v4-v3);
					System.out.print("\nJUGADOR -> -"+v3+" de vida");
					break;
				}
			case "magico":
				v1 = e.getSkillMagica();
				v2 = p.getSkillMagica();
				v3 = v1 -v2;
				v4 = p.getVida();
				if (v3 <= 0) {
					System.out.print("\n¡Eres inmune a ese ataque!\n");
					break;
				}
				else {
					p.setVida(v4-v3);
					System.out.print("\nJUGADOR -> -"+v3+" de vida");
					break;
				}
			case "sorpresa":
				v1 =  (int) ((int) e.getVelocidad() + ( e.getFuerza()*0.1 ) + (0.3 * e.getSkillMagica()));
				v2 =  (int) ((int) p.getVelocidad() + ( p.getFuerza()*0.1) + (0.3 * p.getSkillMagica()));
				v3 = v1 - v2;
				v4 = p.getVida();
				if (v3 <= 0) {
					System.out.print("\n¡Eres inmune a ese ataque!\n");
					break;
				}
				else {
					p.setVida(v4-v3); 
					System.out.print("\nJUGADOR -> -"+v3+" de vida");
					break;
				}
			case "defensiva":
				v3= (int) Math.floor( Math.random()*1 + 1 );  //Numero aleatorio entre 1-2 (50%)
				v1=(int) (e.getSkillMagica()*0.35);
				v2 = e.getVida();
				if (v3 == 1) {
					e.setVida(v2+v1);
					System.out.print("\nENEMIGO -> +"+v1+" de vida");
					break;
				}
				else {
					System.out.print("\n¡No sirvio de nada!\n");
					break;
				}
			
			}
			
		}
	
	}//Fin metodo calculadoraCombate
	
	public void finDeTurno(JugadorPrincipal p, Enemigo enemigo, int turno) {
		if (turno%2 != 0) {//Turno del jugador
			if (enemigo.getVida() <=0 ) {
				System.out.print("\n¡VICTORIA!\nHas derrotado a tu oponente\n");
				p.mostrarCaracteristicas();
			}
			else {  
				System.out.print("\nENEMIGO -> Vida: "+enemigo.getVida());
			
			}
		}
		else {//Turno del enemigo
			if (p.getVida() <= 0) {
				System.out.print("\nDERROTA\nHas sido masacrado por tu oponente :(\nGAME OVER\nTu puntuacion ha sido "+contador+" puntos");
				System.exit(0);//Sale del programa
			}
			else {
				System.out.print("\nJUGADOR -> Vida: "+p.getVida());
			}
		}
	}
	
	public String generadorDeMundos() {
		int numero = (int) Math.floor( Math.random()*4 + 1 );  //Numero aleatorio entre 1-5 (20%)
		String escenario ="";
		switch (numero) {
			case 1:
				escenario = "Bosque";
				break;
			case 2:
				escenario = "Oceano";
				break;
			case 3:
				escenario = "Montaña";
				break;
			case 4:
				escenario = "Cueva";
				break;
			case 5:
				escenario = "Volcan";
				break;
		}
		return escenario;
	}
	
	public void mundoDelEnemigo(String escenario, Enemigo e) {
		switch (escenario) {
		case "Bosque":
			int vida = e.getVida();
			e.setVida((int) (vida+(0.1*vida)));
			break;
		case "Oceano":
			int skillMagica = e.getSkillMagica();
			e.setSkillMagica((int) (skillMagica+(0.1*skillMagica)));
			break;
		case "Montaña":
			int fuerza = e.getFuerza();
			e.setFuerza((int) (fuerza + (0.1*fuerza)));
			break;
		case "Cueva":
			int velocidad = e.getVelocidad();
			e.setVelocidad((int) (velocidad+(0.1*velocidad)));
			break;
		case "Volcan":
			int vida1 = e.getVida();
			e.setVida((int) (vida1+(0.1*vida1)));
			int velocidad1 = e.getVelocidad();
			e.setVelocidad((int) (velocidad1+(0.1*velocidad1)));
			break;
		}
		
		
	}
	
	public int bonificacionElementoEscenario(JugadorPrincipal p, String escenario) {
		String elemento = p.getElemento();
		
		if (elemento == "fuego" && escenario == "Bosque") return 5;
		if (elemento == "agua" && escenario == "Montaña") return 5;
		if (elemento == "tierra" && escenario == "Cueva") return 5;	
		if (elemento == "aire" && escenario == "Oceano") return 5;
		else return 0;
	}
	
}//Fin clase SINGLETON
