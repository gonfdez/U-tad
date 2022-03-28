
public class Director extends Miembro {

	public static Director[] directores = new Director[10];
	
	private final String cargo = "director"; //¿informacion sobre el cargo?
	
	public String getCargo() {
		return cargo;
	}

	public Director(String nombre, String apellidos, String depart, int anoExp, int anoNac, int coef, boolean percel) throws Fallo {
		super(nombre, apellidos, depart, anoExp, anoNac, coef, percel);
		for (int i=0;i<10;i++) {
			if (directores[i] != null && directores[i].getDepart() == depart) throw new Fallo ("Ya hay un Director en ese Departamento");
		}
		if (this.getAnoExp() <=20 || this.isPercel() == true ) throw new Fallo ("No cumple los requisitos para ser director");
		else {
			for (int u=0;u<10;u++) {
				if (directores[u] == null ) {directores[u] = this; break;}
			}
		}
	}

	public static Director[] getDirectores() {
		return directores;
	}
	
	
}
