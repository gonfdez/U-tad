package Enemigos;

public class FabricaEnemigos implements Fabrica {

	public Enemigo creaEnemigo() {
		
		//Los atributos de cada enemigo se generan de forma aleatoria
		
		int vida = (int) Math.floor( Math.random()*199 + 1 );  //Numero aleatorio entre 1-200
		int skillMagico = 200 - vida;
		int fuerza = (int) Math.floor( Math.random()*199 + 1 );  //Numero aleatorio entre 1-200
		int velocidad = 200 - fuerza;
		
		int boss = (int) Math.floor( Math.random()*4 + 1); //Numero aleatorio entre 1-5 (%20)
		
		if (boss == 1 ) {
			vida = 300;//Los bosses tienen obligatoriamente 300 de vida
			fuerza += 50;
			return new Boss (vida,skillMagico,fuerza,velocidad);
		} 
		else {
			//Dependiendo de los atributos sera un tipo u otro
			if (skillMagico > fuerza) {
				skillMagico +=30;
				return new Mago (vida,skillMagico,fuerza,velocidad);
			} 
			if (skillMagico < fuerza ) {
				fuerza += 30;
				return new Guerrero (vida,skillMagico,fuerza,velocidad);
			}
			else { //skillMagico == fuerza
				skillMagico += 100;
				fuerza += 100;
				return new Brujo (vida,skillMagico,fuerza,velocidad);
			}
		}
		
	}
	
	
}//Fin clase FabricaEnemigos
