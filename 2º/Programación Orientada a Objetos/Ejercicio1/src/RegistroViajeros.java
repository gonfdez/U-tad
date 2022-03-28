import java.util.ArrayList;

public class RegistroViajeros {
	
	private ArrayList<Viajero> listaViajeros = new ArrayList<Viajero>();
	

	public void addViajero(Viajero x) {
		listaViajeros.add( x);
	}
	
	public void imprimirTodosLosViajeros() {
		for (int i =0; i < listaViajeros.size() ; i++) {
			String q = listaViajeros.get(i).toString();
			System.out.println(q + "Pais por el que viaja = " + listaViajeros.get(i).getPaisPorElQueViaja() );
		}
	}
	
}
