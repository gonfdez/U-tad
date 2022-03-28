
public class Coordinador extends Miembro {

	public static Coordinador[] coordinadores = new Coordinador[90];
	private String info; //¿informacion sobre el cargo?
	private final String cargo = "coordinador"; //¿informacion sobre el cargo?
	
	public String getCargo() {
		return cargo;
	}
	
	public Coordinador(String nombre, String apellidos, String depart, int anoExp, int anoNac, int coef, boolean percel) throws  Fallo {
		super(nombre, apellidos, depart, anoExp, anoNac, coef, percel);
		int contador = 0;
		for (int i=0;i<10;i++) {
			if (coordinadores[i] != null && coordinadores[i].getDepart() == depart) contador++;
		}
		if (contador > 9) throw new Fallo ("Ya hay 9 Coordinadores en ese Departamento");
		if (this.getCoef() <=80 ) throw new Fallo ("No cumple los requisitos para ser Responsable");
		else {
			for (int u=0;u<10;u++) {
				if (coordinadores[u] == null ) {coordinadores[u] = this; break;}
			}
		}
	}
}
