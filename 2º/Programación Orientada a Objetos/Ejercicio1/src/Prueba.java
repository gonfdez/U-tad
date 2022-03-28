
public class Prueba {

	public static void main(String[] args) {
		
		Humano uno = new Humano();
		Humano dos = new Humano("Carlos",32,true);
		
		Viajero tres  = new ViajeroSenegal();
		Viajero cuatro =  new ViajeroSenegal(); 
		Viajero cinco = new ViajeroSenegal();
		Viajero seis = new ViajeroSenegal();
		Viajero siete = new ViajeroMarruecos ("Tomas",22,false,"España", 98756 );
		Viajero ocho = new ViajeroMarruecos ("Ana",72,true,"Polonia", 986876);
		
		
		RegistroViajeros registro = new RegistroViajeros();
		
		registro.addViajero(tres);
		registro.addViajero(siete);
		registro.addViajero(ocho);
		registro.imprimirTodosLosViajeros();
		
		/*
		Viajero array[] = {tres ,cuatro ,cinco , seis ,siete,ocho};
		for (int i = 0; i<array.length;i++) {
		registro.addViajero(array[i]);
		}
		*/
		
		
		
	}

}
