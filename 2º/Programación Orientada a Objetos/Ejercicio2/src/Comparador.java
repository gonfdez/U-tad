import java.io.*;
import java.util.*;

public class Comparador {

	private ArrayList<String> arrayFicheroUno = new ArrayList<String>();
	private ArrayList<String> arrayFicheroDos = new ArrayList<String>();
	
	public static void main(String[] args) {
		
	}
	
	
	public void escaneoUno() {
			File f = new File("texto1.txt");
			Scanner scannerUno;
			File w = new File("texto2.txt");
			Scanner scannerDos;
			try {
					scannerDos = new Scanner(w);
					scannerUno = new Scanner(f);
					while (scannerUno.hasNextLine()) {
							String linea = scannerUno.nextLine();
							Scanner scannerUnoLinea = new Scanner(linea);
							scannerUnoLinea.useDelimiter(" ");
							scannerUnoLinea.useDelimiter("\n");
							
							while (scannerUnoLinea.hasNext()) {
									arrayFicheroUno.add(scannerUnoLinea.next());
							}
							scannerUnoLinea.close();
						}
						scannerUno.close();
					while (scannerDos.hasNextLine()) {
							String linea = scannerDos.nextLine();
							Scanner scannerDosLinea = new Scanner(linea);
							scannerDosLinea.useDelimiter(" ");
							scannerDosLinea.useDelimiter("\n");
							
							while (scannerDosLinea.hasNext()) {
									arrayFicheroDos.add(scannerDosLinea.next());
							}
							scannerDosLinea.close();
						}
						scannerDos.close();	
					}
					catch (FileNotFoundException e) {
						e.printStackTrace();
					}
	}
	
	
//NO ME HA DADO TIEMPO




}//Fin de la clase Comparador
