package Jugador;
import java.util.*;


public class JugadorPrincipal implements Caracteristicas {
	//Atributos del jugador
	protected int vida;
	protected int skillMagica;
	protected int fuerza;
	protected int velocidad;
	protected int puntuacion;
	protected String elemento;
	
	//Constructor sin parametros (Me permite crear instancias JugadorPrincipal sin inicializar los atributos)
	public JugadorPrincipal() {};
	
	//Metodo para mostrar las stats del personaje (Su funcionalidad varia con el PATRON DECORATOR)
	public void mostrarCaracteristicas() {
		System.out.print("\nTUS ATRIBUTOS:");
		System.out.print("\nVida: "+ vida +"		Poder Magico: "+skillMagica+"\nFuerza: "+ fuerza  +"		Velocidad: "+ velocidad);
	
	}
	
	//Generacion del Jugador
	
	//Primero genera los atributos base
	public void generarAtributos() {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print(" ¡Bienvenido! \n ¡Ha llegado la hora de crear tu personaje!\n ");
		System.out.print("\nPuedes asignar 200 puntos entre VIDA y FUERZA MAGICA ¡Adelante! \nVida : ");
		int vida = sc.nextInt();
		
		while (vida < 1 || vida > 200 ) { 
			System.out.print("Introduce un numero entre [1-200] por favor ");
			vida = sc.nextInt();
		}
		
		int skillMagica = 200 - vida;
		System.out.print("\nEntonces tu Vida sera: "+vida+"		y tu Fuerza Magica sera: "+skillMagica+"\n");
		
		System.out.print("\nAhora puedes asignar 200 puntos entre FUERZA y VELOCIDAD ¡Adelante! \nFuerza : ");
		int fuerza = sc.nextInt();
		
		while (fuerza < 1 || fuerza > 200 ) { 
			System.out.print("Introduce un numero entre [1-200] por favor ");
			fuerza = sc.nextInt();
		}
		
		int velocidad = 200 - fuerza;
		System.out.print("\nEntonces tu Fuerza sera: "+fuerza+"		y tu Velocidad sera: "+velocidad+"\n");
		System.out.print("\n¡PERFECTO!");
		
		//Tras obtener los datos, se incorporan al jugador
		this.vida = vida;
		this.skillMagica = skillMagica;
		this.fuerza = fuerza;
		this.velocidad = velocidad;
		
	}
	
	//Despues elige como quiere decorar su personaje
	public void generarDecoracion(JugadorPrincipal p) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("\n¡Es el momento de elegir tu arma!\n");
		System.out.print("[1] Espada y Escudo (+40% Vida, +20% Fuerza)\n");
		System.out.print("[2] Hacha de guerra (+50% Fuerza)\n");
		System.out.print("[3] Varita (+60% Fuerza Magica)\n");
		System.out.print("[4] Cuchillas (+60% Velocidad)\n");
		
		int seleccion = sc.nextInt();
		
		while (seleccion < 1 || seleccion > 4) {
			System.out.print("\nIntroduce un numero entre [1-4]\n");
			seleccion = sc.nextInt();
		}
		
		System.out.print("\n¡Es el momento de elegir con que elemento quieres hechizar tu arma!\n ");
		System.out.print("[1] Fuego\n ");
		System.out.print("[2] Agua\n ");
		System.out.print("[3] Tierra\n ");
		System.out.print("[4] Aire\n ");
		
		int seleccion2 = sc.nextInt();
		
		while (seleccion2 < 1 || seleccion2 > 4) {
			System.out.print("\nIntroduce un numero entre [1-4]\n");
			seleccion2 = sc.nextInt();
		}
		
		
		String elemento = null;
		
		switch (seleccion2) {
		case 1:
			elemento = "fuego";
			this.elemento = "fuego";
			break;
		case 2:
			elemento = "agua";
			this.elemento = "agua";
			break;
		case 3:
			elemento = "tierra";
			this.elemento = "tierra";
			break;
		case 4:
			elemento = "aire";
			this.elemento = "aire";
			break;
		}
		
		switch (seleccion) {
		
		case 1:
			DecoradorEspadaEscudo player = new DecoradorEspadaEscudo(p);
			player.mejora(p,elemento);
			player.mostrarCaracteristicas();
			break;
		case 2:
			DecoradorHacha player1 = new DecoradorHacha(p);
			player1.mejora(p,elemento);
			player1.mostrarCaracteristicas();
			break;
		case 3:
			DecoradorVarita player2 = new DecoradorVarita(p);
			player2.mejora(p,elemento);
			player2.mostrarCaracteristicas();
			break;
		case 4:
			DecoradorCuchillas player3 = new DecoradorCuchillas(p);
			player3.mejora(p,elemento);
			player3.mostrarCaracteristicas();
			break;
		
		}
		
		
	}


	
	//GETTERS AND SETTERS
	
	public int getVida() {
		return vida;
	}

	public String getElemento() {
		return elemento;
	}

	public void setElemento(String elemento) {
		this.elemento = elemento;
	}

	public void setVida(int vida) {
		this.vida = vida;
	}

	public int getSkillMagica() {
		return skillMagica;
	}

	public void setSkillMagica(int skillMagica) {
		this.skillMagica = skillMagica;
	}

	public int getFuerza() {
		return fuerza;
	}

	public void setFuerza(int fuerza) {
		this.fuerza = fuerza;
	}

	public int getVelocidad() {
		return velocidad;
	}

	public void setVelocidad(int velocidad) {
		this.velocidad = velocidad;
	}

	public void setPuntuacion(int puntuacion) {
		this.puntuacion = puntuacion;
	}

	public int getPuntuacion(){
		return puntuacion;
	}



	
	
	
}//Fin clase JugadorPrincipal
