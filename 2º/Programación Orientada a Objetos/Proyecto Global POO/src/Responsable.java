
public class Responsable extends Miembro {
	public static Responsable[] responsables = new Responsable[30];
	
	private String info; //¿informacion sobre el cargo?
private final String cargo = "responsable"; //¿informacion sobre el cargo?
	
	public String getCargo() {
		return cargo;
	}
	public Responsable(String nombre, String apellidos, String depart, int anoExp, int anoNac, int coef, boolean percel) throws  Fallo {
		super(nombre, apellidos, depart, anoExp, anoNac, coef, percel);
		int contador = 0;
		for (int i=0;i<10;i++) {
			if (responsables[i] != null && responsables[i].getDepart() == depart) contador++;
		}
		if (contador > 3) throw new Fallo ("Ya hay 3 Responsables en ese Departamento");
		if (this.getCoef() <=70 || this.getEdad() <= 25 ) throw new Fallo ("No cumple los requisitos para ser Responsable");
		else {
			for (int u=0;u<10;u++) {
				if (responsables[u] == null ) {responsables[u] = this; break;}
			}
		}
	}
	
}
