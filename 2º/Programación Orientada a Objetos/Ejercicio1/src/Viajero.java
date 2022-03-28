
public abstract class Viajero extends Humano {

	private String paisDeOrigen;
	private int identificador;
	
	//Constructor por defecto
	public Viajero() {
		super();
		paisDeOrigen = " ";
		identificador = 0;
	}
	
	//Constructor con parametros
	public Viajero (String nombre, int edad, boolean casado, String paisDeOrigen, int identificador) {
		super (nombre, edad, casado);
		this.paisDeOrigen = paisDeOrigen;
		this.identificador = identificador;
	}
	
	//metodo abstracto
	public abstract String getPaisPorElQueViaja();

	public String toString() {
		String estadoCivil = " ";
		if (isCasado() == true) estadoCivil = "si";
		else estadoCivil = "no";
		return "Viajero [ Pais de origen = " + paisDeOrigen + ", identificador = " + identificador + ", Nombre = "
				+ getNombre() + ", Edad = " + getEdad() + ", estado civil ="+ estadoCivil + "]";
	}
	
	
}
