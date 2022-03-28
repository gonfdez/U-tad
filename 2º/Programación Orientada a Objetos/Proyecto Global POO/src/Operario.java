
public class Operario extends Miembro {
	public Operario[] operarios = new Operario[270];
	
	private String info; //¿informacion sobre el cargo?
private final String cargo = "operario"; //¿informacion sobre el cargo?
	
	public String getCargo() {
		return cargo;
	}
	public Operario(String nombre, String apellidos, String depart, int anoExp, int anoNac, int coef, boolean percel) throws  Fallo {
		super(nombre, apellidos, depart, anoExp, anoNac, coef, percel);
		int contador = 0;
		for (int i=0;i<10;i++) {
			if (operarios[i] != null && operarios[i].getDepart() == depart) contador++;
		}
		if (contador > 27) throw new Fallo ("Ya hay 27 Operarios en ese Departamento");
		if (this.getEdad() <= 20 ) throw new Fallo ("No cumple los requisitos para ser Operario");
		else {
			for (int u=0;u<10;u++) {
				if (operarios[u] == null ) {operarios[u] = this; break;}
			}
		}
	}
}
