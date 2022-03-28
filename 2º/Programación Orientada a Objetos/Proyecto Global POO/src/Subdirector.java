
public class Subdirector extends Miembro {

	public static Subdirector[] subdirectores = new Subdirector[10];
private final String cargo = "subdirector"; //¿informacion sobre el cargo?
	
	public String getCargo() {
		return cargo;
	}
	private String info; //¿informacion sobre el cargo?
	
	public Subdirector(String nombre, String apellidos, String depart, int anoExp, int anoNac, int coef,boolean percel) throws Fallo {
		super(nombre, apellidos, depart, anoExp, anoNac, coef, percel);
		for (int i=0;i<10;i++) {
			if (subdirectores[i] != null &&subdirectores[i].getDepart() == depart) throw new Fallo ("Ya hay un Subdirector en ese Departamento");
		}
		if (this.getAnoExp() <=10 || this.getEdad() <= 30 ) throw new Fallo ("No cumple los requisitos para ser Subdirector");
		else {
			for (int u=0;u<10;u++) {
				if (subdirectores[u] == null ) {subdirectores[u] = this; break;}
			}
		}
	}
	
	
	
	
}
