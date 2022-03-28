
public class ViajeroMarruecos extends Viajero {

	public String getPaisPorElQueViaja() {
		return "Marruecos";
	}
	
	public ViajeroMarruecos (String nombre, int edad, boolean casado, String paisDeOrigen, int identificador) {
		super(nombre, edad, casado, paisDeOrigen, identificador);
	}
	
	public ViajeroMarruecos () {
		super();
	}
}
