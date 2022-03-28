package Estrategias;


public class Contexto {

	private Estrategia estrategiaElegida;
	
	public Contexto (Estrategia estrategiaElegida) {
		this.estrategiaElegida = estrategiaElegida;
	
	}

	public String estrategiaLucha() {
		return estrategiaElegida.resultadoLucha();
	
	}


}//Fin clase Contexto
