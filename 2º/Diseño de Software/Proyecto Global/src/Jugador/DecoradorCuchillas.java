package Jugador;

public class DecoradorCuchillas extends Decorador {
	//Elemento que se usa para hechizar el arma
	String elemento;

	public DecoradorCuchillas (Caracteristicas componente) {
		super(componente);
	}
	
	
	public void mejora(JugadorPrincipal p,String elemento) {
		
		int velocidad = (int) ( p.getVelocidad() + (p.getVelocidad() *0.6 )	);
		p.setVelocidad(velocidad);
		this.elemento = elemento; 
	}

	public void mostrarCaracteristicas() {
		super.mostrarCaracteristicas();
		System.out.print("\nArma: Cuchillas		Elemento: "+elemento);
	}
	public String getElemento() {
		return elemento;
	}

	public void setElemento(String elemento) {
		this.elemento = elemento;
	}
}
