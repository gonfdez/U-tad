function cargaPagina() {
    cambiarAnim()
    permitirUbicacion()
    aceptarCookies()
}

function aceptarCookies() {
    var valorCookies = sacarValorCookie( "cookies" );
    if(valorCookies != "aceptado") {
        if(!confirm("La página a la que esta accediendo utiliza un uso de cookies privadas, para poder hacer uso de nuestros recursos debe aceptarlas.")) {
            var emergente;
            emergente = emergente.open("", "_blank");
            emergente.document.write("<p>Me lo tomare como un sí</p>");
        } else {
            document.cookie = "cookies=aceptado; path=/";
        }
    }
}

function sacarValorCookie(nombre) {
    var nombreCookie = nombre + "="; 
    var separados = document.cookie.split(';');
    
    for(var a=0;a < separados.length;a++) {
        var solouno = separados[a];
        while (solouno.charAt(0)==' ') solouno = solouno.substring(1,solouno.length);
        if (solouno.indexOf(nombreCookie) == 0) {
            return decodeURIComponent( c.substring(nombreCookie.length,solouno.length) );
        }
    }
    return null;
}

function borrarCookie(nombre) {
    var nombreCookie = nombre + "=; max-age=0; path=/";
    document.cookie=nombreCookie;
}

function comprobarCredenciales() {
    //Solo comprueba contraseña, el nombre puedes entrar con el que quieras
    if (document.getElementsByName("pwd")[0].value == "utadblack") {
        location.href="./catalogo.html"
    } else {
        document.getElementById("estadoContraseña").innerText="Contraseña incorrecta"
    }
}

/*mapa*/
function permitirUbicacion() {
    if (navigator.geolocation) {
        var valorCookies = sacarValorCookie( "ubicacion" );
        if (valorCookies != "preguntado") {
            navigator.geolocation.getCurrentPosition(displayPosition, errorFunction);
            document.cookie = "ubicacion=preguntado; path=/";
        }
    } else {
        alert('Geolocation is not enabled in your browser.');
    }
}

function displayPosition(position) {
    var mylat = position.coords.latitude;
    var mylong = position.coords.longitude;
    var myMts = position.coords.accuracy;
    var info = document.getElementById('locationinfo');
    info.innerHTML = '<p><b> Tu latidud es ' + mylat.toFixed(6) + ' y tu longitud es ' + mylong.toFixed(6) + 'y me encuentras en ' + myMts.toFixed(6) +'<br>' + 'ESTA WEB ES DE ACCESO RESTRINGIDO, SALGA VD. SI NO DISPONE DE LOS PERMISOS SUFICENTES ' + '</b></p>';
    //Carga Google Map
    var latlng = new google.maps.LatLng(mylat, mylong);
    var myOptions = {
        zoom: 15,
        center: latlng,
    };

    var map = new google.maps.Map(document.getElementById("mapa"), myOptions);

    //Añade un marcador
    var marker = new google.maps.Marker({
        position: latlng,
        map: map,
    });
}

function errorFunction(position) {
    alert('Error: ' + position.code + '. ' + position.message);
}


var tamaño = 1;

//Añadir
function sumar() {
    if (document.getElementById("cantidad").value.length != 0) {
        var numtopaleat = Math.floor(Math.random() * 100);
        var numleftaleat = Math.floor(Math.random() * 100);
        var tamaño_bpq;
        document.getElementById("reb").style.background="#b6a727";
        document.getElementById("bolap").style.top=numtopaleat+"%";
        document.getElementById("bolap").style.left=numleftaleat+"%";
        tamaño+=parseFloat((Math.log10(document.getElementById("cantidad").value)/10).toFixed(2));

        tamaño_bpq=((20*(Math.log(((document.getElementById("cantidad").value)/10)+1)))/45)/2;
        document.getElementsByClassName("bolac")[0].style.transform="scale("+tamaño_bpq+")";
        
        setTimeout(function(){
            document.getElementById("bolap").style.opacity="1";
            document.getElementById("bolap").style.top="30%";
            document.getElementById("bolap").style.left="0%";
            setTimeout(function(){
                document.getElementById("bolap").style.opacity="0";
                cambiarTam(tamaño);
            },3000);
        },3000);
    }
    cuantoDinero(tamaño);
}

//Sustraer
function restar() {
    if (document.getElementById("cantidad").value.length != 0) {
        var numtopaleat = Math.floor(Math.random() * 100);
        var numleftaleat = Math.floor(Math.random() * 100);
        var tamaño_bpq;
        document.getElementById("reb").style.background="#b6a727";
        document.getElementById("bolap").style.top="30%";
        document.getElementById("bolap").style.left="0%";

        tamaño-=(Math.log10(document.getElementById("cantidad").value)/10).toFixed(2);

        tamaño_bpq=((20*(Math.log(((document.getElementById("cantidad").value)/10)+1)))/45)/2;
        document.getElementsByClassName("bolac")[1].style.transform="scale("+tamaño_bpq+")";
        
        setTimeout(function(){
            document.getElementById("bolaf").style.opacity="1";
            document.getElementById("bolaf").style.top=numtopaleat+"%";
            document.getElementById("bolaf").style.left=numleftaleat+"%";
            setTimeout(function(){
                document.getElementById("bolaf").style.opacity="0";
                cambiarTam(tamaño);
            },3000);
        },3000);
    }
    cuantoDinero(tamaño);
}

function comprobar(tamaño) {
    if (tamaño<=0) {
        document.getElementById("reb").style.background="#b92626";
    }
    else {
        document.getElementById("reb").style.background="#2c2b1c";
    }
}

function cambiarTam(tamaño) {
    // Crear keyframe cambTam
    document.getElementsByTagName("style")[0].innerHTML="@keyframes cambTam { 75% { -webkit-transform: scale("+(tamaño+1.5)+");transform: scale("+(tamaño+1.5)+");}100% { -webkit-transform: scale("+(tamaño)+");transform: scale("+(tamaño)+");}}"

    // Asignar a la bola central, lo que lo accionara
    document.getElementById('reb').style.animation="cambTam 1s easy-in 0s 1 normal running;";
    document.getElementById("reb").style.transform="scale("+tamaño+")";
    setTimeout(function(){
        comprobar(tamaño);
    },2000);
}

function cuantoDinero(tamaño) {
    document.getElementById("dinero").innerText=(10**(tamaño+1));
}

/*Logo animado*/
var u = document.getElementsByClassName("logoanim");

function cambiarAnim() {
    var a;
    u[0].style.opacity="1";
    for (a=100;a>=0;a--) {
        setTimeout(function(){
            u[1].style.filter="grayscale("+a+"%)";
        }, 12);
    }
    u[0].addEventListener("transitionend", function(){
        u[1].style.opacity="0";
        for (a=0;a<181;a++) {
            setTimeout(function(){
                u[0].style.filter="hue-rotate("+a+"deg)";
                setTimeout(function(){
                    u[0].style.opacity="0";
                    setTimeout(function(){
                        document.getElementById("logofinal").style.opacity="1";
                        document.getElementById("logofinal").style.left="11%";
                        setTimeout(function(){
                            document.getElementById("logofinal").style.left="10%";
                        },1200)
                    },500)
                }, 1200)
            }, 12);
        }
    });
}

/*Catalogo*/
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

/*Busqueda*/
var divs = document.getElementsByClassName("textoTarjetas")
function marcar() {
    var todo
    for (a=0;a<divs.length;a++) {
        // var todo = document.getElementById("texto").innerText
        // https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_node_parentnode_hide
        todo = divs[a].innerText
        var busq = document.getElementById("name").value;
        var n = todo.search(busq);
        var nutodo = todo;
        if (n != -1) {
            nutodo = todo.substr(0, n)+"<b>"+todo.substr(n, busq.length)+"</b>"+todo.substr((n+busq.length), todo.length)
            document.getElementsByClassName("tarjetas")[a].style.display="block"
        } else {
            document.getElementsByClassName("tarjetas")[a].style.display="none"
        }
        document.getElementsByClassName("textoTarjetas")[a].innerHTML = nutodo;
    }
}