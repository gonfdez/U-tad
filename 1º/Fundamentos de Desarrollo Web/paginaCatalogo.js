function movimientoTarjeta(x){
	if (document.getElementById(x).style.color == "" || document.getElementById(x).style.color == "transparent"){
		document.getElementById(x).style.transition="color 0.75s 0.25s, height 1s";
		document.getElementById(x).style.color= "black";
		document.getElementById(x).style.height= "320px";
	}
	else {
		document.getElementById(x).style.transition="color 0.75s, height 1s 0.25s";
		document.getElementById(x).style.color = "transparent";
		document.getElementById(x).style.height= "140px";
	}

}