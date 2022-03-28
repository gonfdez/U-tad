package Enemigos;

public class Mago extends Enemigo {

	public Mago(int vida, int skillMagica, int fuerza, int velocidad) {
		super(vida, skillMagica, fuerza, velocidad);
	
	}
	
	public void mostrarCaracteristicas() {
		System.out.print("\nVida: "+ vida +"		Poder Magico: "+skillMagica+"\nFuerza: "+ fuerza  +"		Velocidad: "+ velocidad);
		System.out.print("\nVocacion: Mago");
	}

	public String escogeEstrategiaEnemigo() {
			
			String ataque = null;
			String estrategiaEnemiga = null;
			int estrategiae = (int) Math.floor( Math.random()*4 + 1 );  //Numero aleatorio entre 1-5 (20%)
			
			switch (estrategiae) {
			 	case 1:
			 		estrategiaEnemiga = "defensiva";
			 		ataque = "Posicion Defensiva";
			 		break;
			 	case 2:
			 		estrategiaEnemiga = "magico";
			 		ataque = "Ataque Magico";
			 		break;
			 	case 3:
			 		estrategiaEnemiga = "sorpresa";
			 		ataque = "Ataque sorpresa";
			 		break;
			 	case 4:
			 		estrategiaEnemiga = "defensiva";
			 		ataque = "Posicion Defensiva";
			 		break;
			 	case 5:
			 		estrategiaEnemiga = "magico";
			 		ataque = "Ataque Magico";
			 		break;
			}
			System.out.print("\n\nTurno del Enemigo. Ha decidido: "+ataque+" \n");
			return estrategiaEnemiga;
			
	}
}
