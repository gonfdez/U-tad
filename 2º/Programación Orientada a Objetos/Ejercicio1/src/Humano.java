
public class Humano {
		private String nombre;
		private int edad;
		private boolean casado;
	
		public void Persona() {
			nombre = "";
			edad = 0;
			casado = false;
		}
		//Constructor sin parametros
		public Humano () {Persona();}
		
		//Constructor con parametros
		public Humano (String nombre, int edad, boolean casado) {
			this.nombre = nombre;
			this.edad = edad;
			this.casado = casado;
		}

		public String getNombre() {
			return nombre;
		}

		public void setNombre(String nombre) {
			this.nombre = nombre;
		}

		public int getEdad() {
			return edad;
		}

		public void setEdad(int edad) {
			this.edad = edad;
		}

		public boolean isCasado() {
			return casado;
		}

		public void setCasado(boolean casado) {
			this.casado = casado;
		}

	public String toString() {
		String estadoCivil = " ";
		if (this.casado == false) {
			estadoCivil = "no";
		} else { estadoCivil = "si"; };
		Integer datoEdad = edad;
		return getNombre() + " " + " tiene " + datoEdad.toString() + " años, y" + estadoCivil + " esta casado";		
		}
	

}//Fin clase Humano


