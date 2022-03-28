package Jugador;

public class DecoradorHacha extends Decorador{


	//Elemento que se usa para hechizar el arma
	String elemento;
			
			
	public DecoradorHacha(Caracteristicas componente) {
		super(componente);
		
	}
	
	public void mejora(JugadorPrincipal p,String elemento) {
		int fuerza = (int) ( p.getFuerza() + (p.getFuerza() *0.5 )	);
		p.setFuerza(fuerza);
		
		this.elemento = elemento; 
	}

	public void mostrarCaracteristicas() {
		super.mostrarCaracteristicas();
		System.out.print("\nArma: Hacha de Guerra		Elemento: "+elemento);
	}
	public String getElemento() {
		return elemento;
	}

	public void setElemento(String elemento) {
		this.elemento = elemento;
	}
}
