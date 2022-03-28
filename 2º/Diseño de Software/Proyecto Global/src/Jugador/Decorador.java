package Jugador;

public class Decorador implements Caracteristicas {

	protected Caracteristicas componente;
	
	public Decorador(Caracteristicas componente) {
		this.componente = componente;
	}
	
	public void mostrarCaracteristicas() {
		componente.mostrarCaracteristicas();
	}
}
