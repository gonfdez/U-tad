
//variables para strToInteger
int contador1 = 0;
int numero1 = 0;
int resultado1 = 0;
int contadorDeCasilla1 = 0;

//variables para strToFloat
int contador2 = 0;
int contador3 = 0;
int contadorTotal = 0;
int contadorDeCasilla2 = 0;
int contadorDeCasilla3 = 0;
float numero2 = 0;
float numero3 = 0;
float noDecimal = 0;
float decimal = 0;
float resultado2 = 0;

int strToInteger(char* strln){
	//Cuento la longitud del string
	for (int y=0;y<11;y++){
		if (strln[y]!='\0') contador1++;
		else break;
	}
	//ERROR, numero mayor a 9 cifras
	if (contador1 > 9 ) return 0;
	//Transformacion de char a int y construccion del numero
	for (int i = 0; i < 9;i++){
		if (strln[i] != '\0'){ 
			//Transformacion char > int
			numero1 = strln[i] - '0';
			//Construccion del numero teniendo en cuanta el orden (centenas, decenas, unidades...)
			contadorDeCasilla1++;
			resultado1 = resultado1 + (numero1 * pow(10,(contador1-contadorDeCasilla1)));
		}
		else break;
	}
	return resultado1;
}//fin strToInteger

float strToFloat(char* strln){
	//Cuento la longitud del string (coma no incluida, solo cuento cifras)
	for (int q=0;q<12;q++){
		if (strln[q] != '\0'){ 
			if(strln[q]==',') continue;
			else contadorTotal++;
		}
		else break;	
	}
	//Cuento la longitud del string hasta la coma
	for (int y=0;y<12;y++){
		if (strln[y] != ',') {
			if (strln[y] != '\0')
				contador2++;
			else break;
		}
		else break;
	}
	
	//ERROR, numero de mas de 9 cifras
	if (contadorTotal>9) return 0;
	
	//Cuento la longitud del string despues de la coma
	for (int x=(contador2+1);x<=(contadorTotal+1);x++){
		//Compruebo si el numero tiene numeros decimales (es posible que no tenga)
		if ((contadorTotal) == contador2) break;
		if (strln[x] == ',') continue;//empieza desde la coma, para que no la cuente
		else {
			if (strln[x]!='\0') contador3++; // El contador 3 me dice cuantos numeros hay despues de la coma
			else break;
		}
	}
	
	//Transformacion de char a float y construccion del numero entero
	for (int i = 0; i <=contador2 ; i++ ){
		if (strln[i] != '\0'){ 
			//Transformacion char > float
			numero2 = strln[i] - '0';
			//Construccion del numero entero (no decimal)
			contadorDeCasilla2++;
			noDecimal = noDecimal + (numero2 * pow(10,(contador2-contadorDeCasilla2)));
		}
		else break;
	}
	//Transformacion de char a float y construccion del numero decimal
	for (int i =contador2+1 ; i <=contadorTotal+1 ; i++ ){
		//Comprobacion de que tiene decimales
		if (contadorTotal == contador2) break;
		
		if (strln[i] != '\0'){ 
			//Transformacion char > float
			numero3 = strln[i] - '0';
			//Construccion del numero entero (no decimal)
			contadorDeCasilla3++;
			int exponente = (-1)*contadorDeCasilla3;
			decimal = decimal + (numero3 * pow(10,exponente));
		}
		else break;
	}
	resultado2 = noDecimal + decimal;
	return resultado2;
}//fin strToFloat