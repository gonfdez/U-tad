package Jugador;

public class DecoradorVarita extends Decorador {

	//Elemento que se usa para hechizar el arma
	String elemento;
			
	public DecoradorVarita(Caracteristicas componente) {
		super(componente);
		
	}		
			
	public void mejora(JugadorPrincipal p, String elemento) {
		
		int skillMagica = (int) ( p.getSkillMagica() + (p.getSkillMagica() *0.6 )	);
		p.setSkillMagica(skillMagica);
		
		this.elemento = elemento; 
	}
	
	public void mostrarCaracteristicas() {
		super.mostrarCaracteristicas();
		System.out.print("\nArma: Varita		Elemento: "+elemento);
	}
	public String getElemento() {
		return elemento;
	}

	public void setElemento(String elemento) {
		this.elemento = elemento;
	}
}
