
public class Miembro {
	
	//Atributos de cada Miembro
	private String nombre;
	private String apellidos;
	private String depart;
	private int anoExp, anoNac, coef;
	private boolean percel;

	//Arrays
	public static String[] departamentos = {"dirección","logística","control de robots","médico","investigación biológica","construcción y mantenimiento","sistemas informáticos","investigación astronómica","cometología","navegación"};
	public static Miembro[] miembros = new Miembro[100];
	
	//Constructor de Miembro
	public Miembro(String nombre, String apellidos, String depart, int anoExp, int anoNac, int coef, boolean percel) {
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.depart = depart;
		this.anoExp = anoExp;
		this.anoNac = anoNac;
		this.coef = coef;
		this.percel = percel;
	}
	//Metodo getEdad
	public int getEdad() {
		return (2020 - this.anoNac);
	}
	
	//Metodos percel
	public boolean isPercel() {
		return percel;
	}

	public void setPercel(boolean percel) {
		this.percel = percel;
	}	
	
	
	//Getters and Setters
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public int getAnoExp() {
		return anoExp;
	}

	public void setAnoExp(int anoExp) {
		this.anoExp = anoExp;
	}

	public int getAnoNac() {
		return anoNac;
	}

	public void setAnoNac(int anoNac) {
		this.anoNac = anoNac;
	}

	public int getCoef() {
		return coef;
	}

	public void setCoef(int coef) {
		this.coef = coef;
	}
	public String getCargo() {
		return getCargo();
	}

	
	
	
	
	
	
	
}
