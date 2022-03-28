public class ViajeroSenegal extends Viajero {

	public String getPaisPorElQueViaja() {
		return "Senegal";
	}
	public ViajeroSenegal (String nombre, int edad, boolean casado, String paisDeOrigen, int identificador) {
		super(nombre, edad, casado, paisDeOrigen, identificador);
	}
	
	public ViajeroSenegal () {
		super();
	}
}
