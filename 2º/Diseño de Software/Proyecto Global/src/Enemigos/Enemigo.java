package Enemigos;

public abstract class Enemigo {

	//Atributos del enemigo
	protected int vida;
	protected int skillMagica;
	protected int fuerza;
	protected int velocidad;
	
	//Constructor
	public Enemigo (int vida, int skillMagica, int fuerza, int velocidad) {
		this.vida = vida;
		this.skillMagica = skillMagica;
		this.fuerza = fuerza;
		this.velocidad = velocidad;
	}
	
	public abstract void mostrarCaracteristicas();
	public abstract String escogeEstrategiaEnemigo();
	
	//GETTERS AND SETTERS
	public int getVida() {
		return vida;
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
	
	
}
