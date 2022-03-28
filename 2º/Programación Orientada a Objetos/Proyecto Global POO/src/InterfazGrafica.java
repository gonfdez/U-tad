import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.Scanner;
import java.awt.*;

import javax.swing.*;
import java.awt.event.*;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import javax.swing.JOptionPane;
public class InterfazGrafica extends JFrame implements ActionListener{

	//Columnas de la tabla
	private String[] nombreColumnas = {"Nombre","Apellidos","Cargo","Años de Experiencia","Año de nacimiento","Coeficiente habilidad espacial"};		
	//Filas de la Tabla
	private String[][] dataFilas = new String[41][6];
	
	//Array bidimensional de todos los miembros y sus parametros. La primera dimension indica el miembro (1,2,3,...,100)
	//La segunda dimension contiene cada uno de los parámetros de ese miembro en orden (1-8)
	public String[][] dataTotal = new String[100][8];
	
	//Variables usadas en metodos como contadores
	private int contadorMiembros = -1;
	private int contadorLineas = 0;
	
	//Array que contiene a todos los miembros creados
	private Miembro[] totalMiembros = new Miembro[100];
	
	//Array de miembros por Departamentos
	private Miembro[] direccion = new Miembro[41];
	private Miembro[] logistica = new Miembro[41];
	private Miembro[] controlDeRobots = new Miembro[41];
	private Miembro[] medico = new Miembro[41];
	private Miembro[] investigacionBiologica = new Miembro[41];
	private Miembro[] construccionYMantenimiento = new Miembro[41];
	private Miembro[] sistemasInformaticos = new Miembro[41];
	private Miembro[] investigacionAstronomica = new Miembro[41];
	private Miembro[] cometologia = new Miembro[41];
	private Miembro[] navegacion = new Miembro[41];
	
		//Getters de los arrays
		public Miembro getDireccion(int q) {
			return direccion[q];
		}
		public Miembro getLogistica(int q) {
			return logistica[q];
		}
		public Miembro getControlDeRobots(int q) {
			return controlDeRobots[q];
		}
		public  Miembro getMedico(int q) {
			return medico[q];
		}
		public  Miembro getInvestigacionBiologica(int q) {
			return investigacionBiologica[q];
		}
		public Miembro getConstruccionYMantenimiento(int q) {
			return construccionYMantenimiento[q];
		}
		public Miembro getSistemasInformaticos(int q) {
			return sistemasInformaticos[q];
		}
		public Miembro getInvestigacionAstronomica(int q) {
			return investigacionAstronomica[q];
		}
		public Miembro getCometologia(int q) {
			return cometologia[q];
		}
		public Miembro getNavegacion(int q) {
			return navegacion[q];
		}
	
//-----------------------------------------------------------------------------METODOS----------------------------------------------------------------------------
		public void ventana() {
			//Ventana del programa
			JFrame jFrame;
			jFrame = new JFrame();
			jFrame.setSize(400,300);
			jFrame.setLocation(150,250);
			jFrame.setTitle("PASA - Misión Halley - Tripulación");
			jFrame.setVisible(true);
			jFrame.setDefaultCloseOperation(EXIT_ON_CLOSE);
			
			//Boton imprimir
			JButton boton = new JButton("Imprimir");
			
			//Etiqueta del comboBox	
			/*	JLabel etiquetaComboBox = new JLabel();
			etiquetaComboBox.setText("Departamento: ");
			etiquetaComboBox.setSize(150,50);	*/
		
			//Zona superior, comboBox de departamentos
			String[] comboBoxLista = {"direccion","logistica","control de robots","medico","investigacion biologica","construccion y mantenimiento","sistemas informaticos","investigacion astronomica","cometologia","navegacion"};
			JComboBox comboBoxDepartamentos = new JComboBox(comboBoxLista);
			//Obtener seleccion del comboBox NO ME FUNCIONA
			String seleccionado = (String) comboBoxDepartamentos.getSelectedItem();//seleccion del comboBox
			
			//Zona central Tabla			
			switch (seleccionado) {
			case "direccion":
				dataFilasTabla("direccion");break;
			case "logistica":
			dataFilasTabla("logistica");break;
			case "control de robots":
				dataFilasTabla("control de robots");break;
			case "medico":
				dataFilasTabla("medico");break;
			case "investigacion biologica":
				dataFilasTabla("investigacion biologica");break;
			case "construccion y mantenimiento":
				dataFilasTabla("construccion y mantenimiento");break;
			case "sistemas informaticos":
				dataFilasTabla("sistemas informaticos");break;
			}
			dataFilasTabla(seleccionado); JTable tabla=new JTable(dataFilas, nombreColumnas);//Hacemos la tabla
			
			//Maquetacion de la ventana jFrame
			jFrame.setLayout(new BorderLayout());
			//jFrame.add(etiquetaComboBox, BorderLayout.NORTH);
			jFrame.add(comboBoxDepartamentos, BorderLayout.NORTH);
			jFrame.add(tabla, BorderLayout.CENTER);
			jFrame.add(boton, BorderLayout.SOUTH);
		
			for(int r =0;r<41;r++) {
				for(int t=0;t<5;t++) {
			System.out.println(dataFilas[r][t]);}}
		}//fin metodo ventana
		
		public void dataFilasTabla(String seleccionado){
			for(int r=0;r<41;r++) {
						if (direccion[r]!=null) {
						dataFilas[r][0]=direccion[r].getNombre();
						dataFilas[r][1]=direccion[r].getApellidos();
						dataFilas[r][2]=direccion[r].getCargo();
						dataFilas[r][3]=Integer.toString(direccion[r].getAnoExp());
						dataFilas[r][4]=Integer.toString(direccion[r].getAnoNac());
						dataFilas[r][5]=Integer.toString(direccion[r].getCoef());
						}
				
					if (logistica[r]!=null) {
					dataFilas[r][0]=logistica[r].getNombre();
					dataFilas[r][1]=logistica[r].getApellidos();
					dataFilas[r][2]=logistica[r].getCargo();
					dataFilas[r][3]=Integer.toString(logistica[r].getAnoExp());
					dataFilas[r][4]=Integer.toString(logistica[r].getAnoNac());
					dataFilas[r][5]=Integer.toString(logistica[r].getCoef());
					}
				

					if (controlDeRobots[r] != null) {
					dataFilas[r][0]=controlDeRobots[r].getNombre();
					dataFilas[r][1]=controlDeRobots[r].getApellidos();
					dataFilas[r][2]=controlDeRobots[r].getCargo();
					dataFilas[r][3]=Integer.toString(controlDeRobots[r].getAnoExp());
					dataFilas[r][4]=Integer.toString(controlDeRobots[r].getAnoNac());
					dataFilas[r][5]=Integer.toString(controlDeRobots[r].getCoef());
					}

					if (medico[r] !=null) {
					dataFilas[r][0]=medico[r].getNombre();
					dataFilas[r][1]=medico[r].getApellidos();
					dataFilas[r][2]=medico[r].getCargo();
					dataFilas[r][3]=Integer.toString(medico[r].getAnoExp());
					dataFilas[r][4]=Integer.toString(medico[r].getAnoNac());
					dataFilas[r][5]=Integer.toString(medico[r].getCoef());
					}

					if (investigacionBiologica[r]!=null) {
					dataFilas[r][0]=investigacionBiologica[r].getNombre();
					dataFilas[r][1]=investigacionBiologica[r].getApellidos();
					dataFilas[r][2]=investigacionBiologica[r].getCargo();
					dataFilas[r][3]=Integer.toString(investigacionBiologica[r].getAnoExp());
					dataFilas[r][4]=Integer.toString(investigacionBiologica[r].getAnoNac());
					dataFilas[r][5]=Integer.toString(investigacionBiologica[r].getCoef());
					}

					if (construccionYMantenimiento[r]!=null) {
					dataFilas[r][0]=construccionYMantenimiento[r].getNombre();
					dataFilas[r][1]=construccionYMantenimiento[r].getApellidos();
					dataFilas[r][2]=construccionYMantenimiento[r].getCargo();
					dataFilas[r][3]=Integer.toString(construccionYMantenimiento[r].getAnoExp());
					dataFilas[r][4]=Integer.toString(construccionYMantenimiento[r].getAnoNac());
					dataFilas[r][5]=Integer.toString(construccionYMantenimiento[r].getCoef());
					}
				
					if (sistemasInformaticos[r]!=null) {
					dataFilas[r][0]=sistemasInformaticos[r].getNombre();
					dataFilas[r][1]=sistemasInformaticos[r].getApellidos();
					dataFilas[r][2]=sistemasInformaticos[r].getCargo();
					dataFilas[r][3]=Integer.toString(sistemasInformaticos[r].getAnoExp());
					dataFilas[r][4]=Integer.toString(sistemasInformaticos[r].getAnoNac());
					dataFilas[r][5]=Integer.toString(sistemasInformaticos[r].getCoef());
					}

					if (investigacionAstronomica[r] != null) {
					dataFilas[r][0]=investigacionAstronomica[r].getNombre();
					dataFilas[r][1]=investigacionAstronomica[r].getApellidos();
					dataFilas[r][2]=investigacionAstronomica[r].getCargo();
					dataFilas[r][3]=Integer.toString(investigacionAstronomica[r].getAnoExp());
					dataFilas[r][4]=Integer.toString(investigacionAstronomica[r].getAnoNac());
					dataFilas[r][5]=Integer.toString(investigacionAstronomica[r].getCoef());
					}
			
				if (cometologia[r]!=null) {
					dataFilas[r][0]=cometologia[r].getNombre();
					dataFilas[r][1]=cometologia[r].getApellidos();
					dataFilas[r][2]=cometologia[r].getCargo();
					dataFilas[r][3]=Integer.toString(cometologia[r].getAnoExp());
					dataFilas[r][4]=Integer.toString(cometologia[r].getAnoNac());
					dataFilas[r][5]=Integer.toString(cometologia[r].getCoef());
				}

					if (navegacion[r]!=null) {
					dataFilas[r][0]=navegacion[r].getNombre();
					dataFilas[r][1]=navegacion[r].getApellidos();
					dataFilas[r][2]=navegacion[r].getCargo();
					dataFilas[r][3]=Integer.toString(navegacion[r].getAnoExp());
					dataFilas[r][4]=Integer.toString(navegacion[r].getAnoNac());
					dataFilas[r][5]=Integer.toString(navegacion[r].getCoef());
					}
				}
			}
		//fin metodo dataFilasTabla
		
		public void arranque() {
			try {//Lectura del fichero y comprobación de que no tiene mas de 100 lineas, es decir, mas de 100 miembros
			File f = new File("fichero.txt");
			Scanner x;
				try {
					x = new Scanner(f);
					while (x.hasNextLine()) {
						contadorLineas++;
						x.nextLine();
					}
					x.close();
				}
				catch (FileNotFoundException e) {
					e.printStackTrace();
				}
				
				if (contadorLineas > 100) throw new Fallo ("Hay mas de 100 miembros en el fichero");
				
				//Si hay 100 o menos lineas en el fichero el programa comienza a leerlo
				else {
					Scanner s;
					try {
						s = new Scanner(f);
						while (s.hasNextLine()) {
							String linea = s.nextLine();
							contadorMiembros++;
							Scanner sl = new Scanner(linea);
							sl.useDelimiter(";");
							//Todos los parametros de un mismo miembro se guardan en sus correspondientes casillas del array dataTotal
							dataTotal[contadorMiembros][0] = sl.next();
							dataTotal[contadorMiembros][1] = sl.next();
							dataTotal[contadorMiembros][2] = sl.next();
							dataTotal[contadorMiembros][3] = sl.next();
							dataTotal[contadorMiembros][4] = sl.next();
							dataTotal[contadorMiembros][5] = sl.next();
							dataTotal[contadorMiembros][6] = sl.next();
							if ( sl.next() == "si") dataTotal[contadorMiembros][7] = "true";
							else dataTotal[contadorMiembros][7] = "false";
							sl.close();
						}
						s.close();
					}
					catch (FileNotFoundException e) {
						e.printStackTrace();
					}
				}
				
				//	Comprobacion de que lee el fichero y guarda los datos en dataTotal[][]
				/*	System.out.println("AQUI EMPIEZA dataTotal[][]");
 					for (int o=0;o<50;o++) {
				 		for (int w=0;w<8;w++) {
							System.out.println(dataTotal[o][w]);
						}
					}		*/
				
				//Construccion de los miembros en funcion del valor del tercer parametro, el cargo. Al crearse un miembro este se guarda en totalMiembros
				generadorDeMiembros();//COMPROBADO CORRECTO
				//Ordenación de los miembros por departamento
				ordenarPorDepartamentos();//COMPROBADO CORRECTO
			} catch(Fallo x) {
				JOptionPane.showMessageDialog(null, x.getMessage());
			} catch(NumberFormatException c) {
				JOptionPane.showMessageDialog(null, c.getMessage());
				}
			
		
		}//fin arranque

		//Metodo que genera cada miembro leyendo dataTotal y los guarda en el array totalMiembros
		public void generadorDeMiembros() {
			try {
				
					for (int z=0;z<100;z++){			
						if (dataTotal[z][2] != null) {
							switch (dataTotal[z][2]) {
								case "director":
									 totalMiembros[z]=new Director(dataTotal[z][0], dataTotal[z][1], dataTotal[z][6], Integer.parseInt(dataTotal[z][3]), Integer.parseInt(dataTotal[z][4]), Integer.parseInt(dataTotal[z][5]), Boolean.parseBoolean(dataTotal[z][7]));
									break;
								case "subdirector":
									totalMiembros[z]=new Subdirector(dataTotal[z][0], dataTotal[z][1], dataTotal[z][6], Integer.parseInt(dataTotal[z][3]), Integer.parseInt(dataTotal[z][4]), Integer.parseInt(dataTotal[z][5]), Boolean.parseBoolean(dataTotal[z][7]));
									break;
								case "operario":
									totalMiembros[z]=new Operario(dataTotal[z][0], dataTotal[z][1], dataTotal[z][6], Integer.parseInt(dataTotal[z][3]), Integer.parseInt(dataTotal[z][4]), Integer.parseInt(dataTotal[z][5]), Boolean.parseBoolean(dataTotal[z][7]));
									break;
								case "responsable":
									totalMiembros[z]=new Responsable(dataTotal[z][0], dataTotal[z][1], dataTotal[z][6], Integer.parseInt(dataTotal[z][3]), Integer.parseInt(dataTotal[z][4]), Integer.parseInt(dataTotal[z][5]), Boolean.parseBoolean(dataTotal[z][7]));
									break;
								case "coordinador":
									totalMiembros[z]=new Coordinador(dataTotal[z][0], dataTotal[z][1], dataTotal[z][6], Integer.parseInt(dataTotal[z][3]), Integer.parseInt(dataTotal[z][4]), Integer.parseInt(dataTotal[z][5]), Boolean.parseBoolean(dataTotal[z][7]));
									break;
							}
						}
					}
					
				//Comprobacion de que se rellena TotalMiembros con los miembros creados			
				/*	 	System.out.println("AQUI EMPIEZA TOTALMIEMBROS[]");
				 		for(int u=0;u<100;u++) {
					   		System.out.println(totalMiembros[u]);
				   		}	*/
				   
				//Cogemos excepciones
			} catch (Fallo x) {
				JOptionPane.showMessageDialog(null, x.getMessage());	
			} catch (NumberFormatException m) {
				JOptionPane.showMessageDialog(null, m.getMessage());
				}
				
		}
		
		//Metodo para ordenar todos los miembros, que estan en totalMiembros, segun su departamento
		public void ordenarPorDepartamentos() {
			 for(int q=0;q<10;q++) {
					
				 switch(totalMiembros[q].getDepart()) {
					case "direccion":
						int contador1=0;
						direccion[contador1] = totalMiembros[q];
						contador1++;
						break;
					case "logistica":
						int contador2=0;
						logistica[contador2] = totalMiembros[q];
						contador2++;
						break;
					case "control de robots":
						int contador3=0;
						controlDeRobots[contador3] = totalMiembros[q];
						contador3++;
						break;
					case "medico":
						int contador4=0;
						medico[contador4] = totalMiembros[q];
						contador4++;
						break;
					case "investigacion biologica":
						int contador5=0;
						investigacionBiologica[contador5] = totalMiembros[q];
						contador5++;
						break;
					case "construccion y mantenimiento":
						int contador6=0;
						construccionYMantenimiento[contador6] = totalMiembros[q];
						contador6++;
						break;
					case "sistemas informaticos":
						int contador7=0;
						sistemasInformaticos[contador7] = totalMiembros[q];
						contador7++;
						break;
					case "investigacion astronomica":
						int contador8=0;
						investigacionAstronomica[contador8] = totalMiembros[q];
						contador8++;
						break;
					case "cometologia":
						int contador9=0;
						cometologia[contador9] = totalMiembros[q];
						contador9++;
						break;
					case "navegacion":
						int contador10=0;
						navegacion[contador10] = totalMiembros[q];
						contador10++;
						break;
					}
				 
			 }
		//Comprobacion ordenarPorDepartamentos
			 /*
			 System.out.println(direccion);
			 System.out.println(logistica);
			 System.out.println(controlDeRobots);
			 */
		}//fin metodo ordenarPorDepartamentos
		
																											//Método MAIN
																										public static void main(String[] args) {
																												InterfazGrafica w = new InterfazGrafica();
																												w.arranque();//COMPROBADO CORRECTO
																												w.ventana();
																										}//fin del main
	
	//NO SE PARA QUE ES ESTE METODO
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
	}

}//fin clase InterfazGrafica
