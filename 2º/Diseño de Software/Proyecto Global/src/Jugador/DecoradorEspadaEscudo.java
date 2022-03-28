package Jugador;

public class DecoradorEspadaEscudo extends Decorador {

	

		//Elemento que se usa para hechizar el arma
		String elemento;
		
		
	public DecoradorEspadaEscudo(Caracteristicas componente) {
		super(componente);
	
	}

	public void mejora(JugadorPrincipal p, String elemento) {
		int vida = (int) ( p.getVida() + (p.getVida() *0.4 )	);
		p.setVida(vida);
		int fuerza = (int) ( p.getFuerza() + (p.getFuerza() *0.2 )	);
		p.setFuerza(fuerza);
		
		this.elemento = elemento; 
	}
	
	public void mostrarCaracteristicas() {
		super.mostrarCaracteristicas();
		System.out.print("\nArma: Espada y Escudo		Elemento: "+elemento);
	}
	
	public String getElemento() {
		return elemento;
	}

	public void setElemento(String elemento) {
		this.elemento = elemento;
	}
}
