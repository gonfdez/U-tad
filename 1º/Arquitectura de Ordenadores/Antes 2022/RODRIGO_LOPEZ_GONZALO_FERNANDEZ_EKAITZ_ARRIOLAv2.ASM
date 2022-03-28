; This is a basic template file for writing 48K Spectrum code.

AppFilename             equ "NewFile"                   ; What we're called (for file generation)

AppFirst                equ $8000                       ; First byte of code (uncontended memory)

                        zeusemulate "48K","ULA+"        ; Set the model and enable ULA+


; Start planting code here. (When generating a tape file we start saving from here)

                        org AppFirst                    ; Start of application

setup                   nop;Configuración inicial.
                        ;Llama a chanopen con el parámetro 2, que indica utilizar la pantalla principal.
                        ld a, 2
                        call chanopen

                        call apaind

                        ;Imprime los puntos (0 al principio por lo que no hace falta hacer itoa).
                        ld hl, contadores
                        call imprimirString

reset                   nop;Imprime vidas restantes y espera a que se apriete una tecla. Despues de eso borra cualquier mensaje que apareciese por pantalla.


                        ld hl, cambiaColor
                        call imprimirString

                        call aloTecla

                        ;Imprime las vidas restantes.
                        ld hl, contadores+8
                        ld ix, contadores+13
                        call itoa
                        call imprimirString

                        ld hl, delMedioTexto
                        call imprimirString
                        ld ix,bola
                        call resetBola

inicio                  nop ;Bucle principal.

                        ;Imprime los puntos
                        ld ix, contadores+5
                        call itoa
                        ld hl, contadores
                        call imprimirString

                        call movPala

                        call movBola

                        ;"""Delay"""
                        halt
                        ;halt

                        ld a, (seed)
                        bit 1, a
                        jp z $+4
                        halt

                        bit 2, a
                        jp nz $+4
                        halt

                        bit 3, a
                        jp z inicio
                        bit 4, a
                        jp z inicio
                        halt
                        halt

                        jp inicio


;DATOS:
;;;;;;;;;;;;;;;;;;;;;;;;Apaind:
columnaBorde            defb 22,0,31,"#"                ;El borde derecho del rebote de la bola esta en el 30 para poder poner la columna de #.
textoVidas              defb 22,0,0,"Puntos: ",255
textoPuntos             defb 22,0,22,"Vidas: ",255
cambiaColor             defb 16,3,22,1,1,255

;;;;;;;;;;;;;;;;;;;;;;;;Pala:
pala                    defb 22,21,15,"="               ;Siempre esta en la fila 21. Su coordenada x puede variar entre el 0 y 31.
nada                    defb 22,21,15," "               ;Siempre esta en la fila 21. Su coordenada x sera la anterior coordenada x de parametros.
IncrementoPalaLarga     defb 0h

;;;;;;;;;;;;;;;;;;;;;;;;Bola:
bola                    defb 22,10,15,"o"
vacio                   defb 22,10,15," "
incrementoX             defb 0ffh
incrementoY             defb 1

;;;;;;;;;;;;;;;;;;;;;;;;In/Out:
chanopen                equ 5633
print                   equ 8252

;;;;;;;;;;;;;;;;;;;;;;;;Marcadores:
                             ;Puntos:                  ;Vidas:
contadores              defb 22,0,8,48,48,48,255,0,    22,0,29,48,48,48,255,3
;Define ambos contadores: el de puntos y el de vidas. Siendo el 255 el final para nuestra función imprimirString y el número inmediatamente posterior el valor de los contadores.

efeTexto                defb 22,10,9,"G a m e o v e r",255
inicioTexto             defb 22,10,9,"Horizontal Pong",255
perderVidaTexto         defb 22,10,9,"Tocar una tecla",255
delMedioTexto           defb 22,10,9,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,255       ;Reescribe con espacios para borrar los textos anterioores.

;;;;;;;;;;;;;;;;;;;;;;;;Seed:
seed                    defb 80h


;SUBRUTINAS:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;APAIND;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
apaind                  nop;Prepara el entorno gráfico del juego.


                        ld hl, inicioTexto
                        call imprimirString
                        ld hl,textoVidas
                        call imprimirString
                        ld hl,textoPuntos
                        call imprimirString
                        ld ix,columnaBorde+1

                        ;Imprime las columnas de "#".
apaind_primero          inc (ix)
                        ld de,columnaBorde
                        call imprimir
                        ld a,(ix)
                        cp 20
                        jp nz apaind_primero

                        ;Una vez termina una columna (la del 31), procede a crear la del 0.
                        inc(ix)
                        ld (ix+1),0

apaind_segundo          dec (ix)
                        ld de,columnaBorde
                        call imprimir
                        ld a,(ix)
                        cp 1
                        jp nz apaind_segundo
                        ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PALA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movPala                 nop ;Mueve y administra la pala.

                        ;Lee del teclado (dfh).
                        call leerdfh

                        ;Vuelve al bucle si no se apreto nada.
                        cp 1fh                 ;Si no se oprimio ninguna tecla leerdfh dejara 1fh en a.
                        ret z

                        ;Tambien si se apreto 'y', 'u', o 'o'.
                        bit 1, a
                        ret z
                        bit 3, a
                        ret z
                        bit 4, a
                        ret z

                        ;Se resetea la aceleracion.
                        ld hl, IncrementoPalaLarga
                        ld (hl), 0

                        ;Se guarda en hl la dirección de la coordenada x de pala.
                        ld hl, pala+2

                        ;Guarda la coordenada x de la pala en la coordenada de nada y la medioprepara nada para ser impresa.
                        ld de, nada
                        ld ix, de
                        ld b, a
                        ld a, (hl)
                        ld (ix+2), a

                        ld a, (seed)
                        bit 7, a
                        call z invertirControles
                        ld a, b

                        ;Comprueba input para mover la dirección de la pala y borrar el anterior.
                        bit 2, a
                        call nz inDerecha
                        bit 0, a
                        ret z
                        call inIzquierda

dibPala                 nop ;Dibuja nueva pala.
                        ld de, pala
                        call imprimir

                        ret


invertirControles       nop ;Invierte controles.

                        ;Si estamos en un borde, previene un error.
                        ld a, (hl)
                        cp 0
                        ret z
                        cp 31
                        ret z

                        ld a, b
                        bit 2, a
                        jp z $+6
                        ld b, 11011b
                        ret
                        ld b, 11110b
                        ret

inDerecha               nop ;Mueve a la derecha

                        ;Comprueba que no este en el borde derecho (1fh).
                        ld a, (hl)
                        cp 1fh               ;Borde derecho.
                        jp z dibPala         ;Si no choca se mantiene en la subrutina.

                        ;Comprueba si la pala debe de ser grande.
                        ld a, (seed)
                        bit 0, a

                        jp z finIfInDerecha
                        ;Si es asi, decrementa la coordenada x de nada y escribe la aceleracion de la pala.
                        dec (ix+2)
                        ;Tambien guarda 1 en IncrementoPalaLarga.
                        ld ix, IncrementoPalaLarga
                        inc (ix)
                        ;Si estamos en el borde contrario al movimiento actual, previene un error al tratar de imprimir nada en una columna no accesible.
                        ld a, (hl)
                        cp 0
                        jp z SalirInDerecha

                        ;Borra la pala o una parte de la pala si es grande. El registro DE tiene todavia guardado la direccion de nada.
finIfInDerecha          call imprimir

SalirInDerecha          nop ;Incrementa posición de la pala y vuelve a la subrutina de movimiento de la pala.
                        inc (hl)
                        jp dibPala


inIzquierda             nop ;Mueve a la izquierda

                        ;Comprueba que no este en el borde izquierdo (0h).
                        ld a, (hl)
                        cp 0        ;Borde izquierdo.
                        ret z       ;Si no choca se mantiene en la subrutina.

                        ;Comprueba si la pala debe de ser grande.
                        ld a, (seed)
                        bit 0, a
                        jp z finIfInIzquierda
                        ;Si es asi, incrementa la coordenada x de nada.
                        inc (ix+2)
                        ;;Tambien guarda -1 en IncrementoPalaLarga.
                        ld ix, IncrementoPalaLarga
                        dec (ix)
                        ;;Si estamos en el borde contrario al movimiento actual, previene un error al tratar de imprimir nada en una columna no accesible.
                        ld a, (hl)
                        cp 1fh
                        jp z SalirInIzquierda

                        ;Borra la pala o una parte de la pala si es grande. El registro DE tiene todavia guardado la direccion de nada.
finIfInIzquierda        call imprimir

SalirInIzquierda        nop ;Decrementa dirección de la pala y vuelve a la subrutina de movimiento de la pala.
                        dec (hl)
                        ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;BOLA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movBola                 nop ;Dirige el movimiento de la bola.
                        call colisiones

                        call delPreBola

                        ld de, bola
                        call imprimir
                        ret


delPreBola              nop ;Borra la bola anterior e incrementa en x e y para obtener los nuevos valores de la bola.

                        ld ix, vacio
                        ld a, (bola+1)
                        ld (ix+1), a
                        ld hl, incrementoY
                        add a, (hl)
                        ld (bola+1), a

                        ld a, (bola+2)
                        ld (ix+2), a
                        ld hl, incrementoX
                        add a, (hl)
                        ld (bola+2), a

                        ld de, ix
                        call imprimir
                        ret


colisiones              nop ;Comprueba colisiones.

                        ;Guarda la direccion de bola en hl.
                        ld ix, bola

                        ;Colisiones. Optimizado para que no compruebe dos colisiones del mismo eje.
                        ld a, (seed)
                        bit 1, a
                        jp z finAlteraciones
                        bit 5, a
                        jp z finAlteraciones
                        ld a, (incrementoY)
                        cp 0ffh
                        jp z  finAlteraciones
                        ld a, (bola+2)
                        cp 1
                        jp z finAlteraciones
                        cp 31
                        jp z finAlteraciones
                        ld a, (incrementoX)
                        neg
                        ld (incrementoX), a
                        jp noEjeX


finAlteraciones         call colisionIzquierda
                        call nz colisionDerecha

                        ;Puede haber dos colisiones en distintos ejes.
noEjeX                  call colisionArriba
                        call nz colisionAbajo

                        ret


colisionArriba          nop ;Comprueba si la bola choca arriba.
                        ld a, (ix+1)
                        cp 01h          ;Borde superior.
                        ret nz          ;Si no choca sale de la subrutina.

                        ;Cambia incrementoY.
                        ld a, 01h
                        ld (incrementoY), a
                        ret


colisionAbajo           nop ;Comprueba si la bola choca abajo.
                        ld a, (ix+1)
                        cp 14h          ;Borde inferior.

                        ret nz          ;Si no choca sale de la subrutina.

;Hay 3 tipos de pala diferenciados por el IncrementoPalaLarga:
;La pala doble -o pala larga- tiene una real, que se encuentra donde apunta (pala+2). La otra es un remanente de la anterior posicion de esta.
  ;Incremento positivo: -=#-
  ;La pala real es la que esta situada más a la derecha. Su IncrementoPalaLarga es 1.
  ;Tambien entra en esta clasificacion la pala normal. Su IncrementoPalaLarga es 0.

  ;Incremento negativo: -#=-
  ;La pala real es la que esta situada más a la izquierda. Su IncrementoPalaLarga es 0ffh, esto es, -1.

                        ld a, (pala+2)
                        inc a           ;Incrementa la posicion teorica de pala para la comprobacion de la colision con la misma. De aqui en adelante, "pala".
                        ld e, a         ;E guarda posicion de la pala.

                        ld a, (IncrementoPalaLarga)
                        cp 2
                        jp c acelPalaPos            ;Si es positivo o igual a 0, se ejecuta directamente modo incremento positivo.

                        ;Sino, se transforna el modo incremento negativo en un caso de modo incremento positivo, igualando a 1 el incremento e incrementando la posicion de la pala.
                        ; --#=  ->  --=#
                        ld a, 1
                        inc e

                        ;El registro A todavia contiene (IncrementoPalaLarga).
acelPalaPos             ld c, a
                        ld a, e

                        ;Si la coordenada X de la bola es mayor que la del valor de "pala", no choco con la pala.
                        cp (ix+2)
                        jp c perderVida
                        ;Le restamos 3 posiciones a "pala". Tambien le restamos su IncrementoPalaLarga.
                        sub c
                        sub 3
                        ;Si la coordenada X de la bola es menor o igual que la del valor de "pala", no choco con la pala.
                        cp (ix+2)
                        jp nc perderVida

                        ;Cambia incrementoY.
colisionConPala         ld a, 0ffh
                        ld (incrementoY), a

                        ;Incrementa el valor del puntuaje.
                        ld ix, contadores
                        inc (ix+7)

                        call alteracion
                        ld a, (seed)
                        bit 7, a
                        ret z

                        ld hl, cambiaColor+1
                        ld a, (hl)
                        cp 3
                        jp nz $+4
                        ld a, 5
                        ld (hl), a

                        dec hl
                        call imprimirString
                        ret


colisionIzquierda       nop ;Comprueba si la bola choca izquierda.
                        ld a, (ix+2)
                        cp 01h          ;Borde izquierdo.
                        ret nz          ;Si no choca sale de la subrutina.

                        ;Cambia incrementoY.
                        ld a, 01h
                        ld (incrementoX), a
                        ret


colisionDerecha         nop ;Comprueba si la bola choca derecha.
                        ld a, (ix+2)
                        cp 1eh          ;Borde derecho.
                        ret nz          ;Si no choca sale de la subrutina.

                        ;Cambia incrementoY.
                        ld a, 0ffh
                        ld (incrementoX), a
                        ret


resetBola               nop;Resetea la bola
                        ld (ix+1),10
                        ld a, r
                        and 1eh
                        inc a
                        ld (ix+2),a

                        ;Para que haya mas tiempo de reaccion.
                        ld ix, incrementoY
                        ld (ix), 0ffh

                        ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;IN/OUT;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
imprimir                nop ;Imprime. El registro DE debera de tener la dirección a los parametros necesarios.
                        ld bc, 4
                        call print
                        ret


imprimirString          nop ;Imprime un String hasta encontrarse un '255'.
                        ld a, (hl)
                        cp 255
                        ret z
                        inc hl
                        rst 16              ;Lo mismo que call #0010.
                        jp imprimirString


aloTecla                nop ;Se mantiene en pausa hasta que se pulse una tecla.
                        ld a, 0feh
                        in a, (0feh)
                        and 1fh
                        cp 1fh
                        ret nz

                        ld a,0fdh
                        in a, (0feh)
                        and 1fh
                        cp 1fh
                        ret nz

                        ld a,0fbh
                        in a, (0feh)
                        and 1fh
                        cp 1fh
                        ret nz

                        ld a,0f7h
                        in a, (0feh)
                        and 1fh
                        cp 1fh
                        ret nz

                        ld a, 0efh
                        in a, (0feh)
                        and 1fh
                        cp 1fh
                        ret nz

                        ld a, 0bfh
                        in a, (0feh)
                        and 1fh
                        cp 1fh
                        ret nz

                        ld a, 7fh
                        in a, (0feh)
                        and 1fh
                        cp 1fh
                        ret nz

                        call leerdfh
                        cp 1fh
                        jp z aloTecla


leerdfh                 nop ;Lee de la semifila de yuiop.
                        ld a, 0dfh
                        in a, (0feh)
                        and 1fh
                        ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CONTADORES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
itoa                    nop ;Integer to Array

                        ;Parametros de entrada:
                        ;En ix debera estar almacenada la direccion al ultimo caracter de puntosString (el ultimo realmente es el 255, pero no lo tendremos en cuenta).

                        ;Los primeros 2 caracteres se igualan a 0.
                        ld (ix-1), '0'
                        ld (ix-2), '0'

                        ;Se guarda el valor de puntos en a
                        ld a, (ix+2)

                        ;Si tenemos 0 puntos (a==0) se guarda un 0 en el ultimo caracter y sale.
                        cp 0h
                        jp nz itoaux
                        ld (ix), '0'
                        ret

                        ;Sino hace un bucle sacando un array de caracteres que es el numero puesto en ascii.
itoaux                  ld c, a
itoafor                 nop;
                        ;Limpia a y prepara una division de 8/8 bits de c/10. El cociente quedara en c, y el resto en a.
                        xor a
                        ld b, 8

                        ;Divide c/=10.
itoadiv                 sla c  ;Mueve los bits del registro C a la izquierda. El bit 7 se mete a carry y el bit 0 se iguala cero.
                        rla    ;Mueve los bits del registro C a la izquierda. El bit anterior de carry se mete en bit 0 y el bit 7 se mete en carry.
                        cp 10  ;Si a es menor o igual a 10, se saltara este ciclo del bucle.
                        jp c itoacontinue
                        sub 10
                        inc c  ;Introduce un 1 en el bit 0 de c, el cual sera desplazado a la izquierda.
itoacontinue            djnz itoadiv

                        ;Se le suma 48 al registro a para que corresponda a su valor ascii. Ese valor se guarda en el array, y posteriormente se decrementa el puntero.
                        add a, 48
                        ld (ix), a
                        dec ix

                        ;Se restablece el valor de a desde c para poder realizar la comprobacion de si es 0.
                        ld a, c

                        ;Para el bucle si a es 0.
                        cp 0h
                        jp nz itoafor
                        ret


perderVida              nop ;Decrementa la cantidad de vidas restantes. Si no quedan, se restablecen los valores iniciales. Independientemente de las vidas que queden, resetea.

                        ;Prepara para llamar a imprimirString.
                        ld hl, perderVidaTexto

                        ;Ultimo caracter (sin contar el 255) de vidas.
                        ld ix, contadores+13
                        ;Valor de vidas.
                        ld a, (ix+2)
                        cp 0

                        jp nz gameNOver

                        ;Se restablecen los valores de Vidas y Puntos, en ese orden.
                        ld (ix+2), 04h
                        ld (ix-6), 00h

                        ;Se sobreescribe la configuración anterior para llamar a imprimirString.
                        ld hl, efeTexto

gameNOver               dec (ix+2)

                        call imprimirString

                        ;Borrar bola muerta.
                        call delPreBola

                        ld a, 80h
                        ld (seed), a

                        ld hl, cambiaColor+1

                        ld a, 3
                        ld (hl), a

                        dec hl
                        call imprimirString
                        jp reset


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SEED;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Alteración partida
        ;Tabla valores ya porcesados:
        ;Bit 0-1: Modo de la pala.
        ;Bit 1-1: Modo vertical (Cambia direccion de la y al final) 1/2.
        ;Bit 2-1: Velocidad.
        ;Bit 3-1: Modo lento 1/2.
        ;Bit 4-1: Modo lento 2/2.
        ;Bit 5-1: Modo vertical 2/2.
        ;Bit 6-1: Nada.
        ;Bit 7-1: Bit de anulacion. Cambia color. Invierte controles.

alteracion              nop ;Aleatoriza modoPartida guardando en el valor del refresco de la memoria dinamica.
                        ld a, r
                        ld (seed), a
                        call comprobarNulo
                        ret


comprobarNulo           nop ;Comprueba el bit 7 de modoPartida y si es 0 anula el resto (80h).
                        ld hl, seed
                        sra (hl)
                        ret nc
                        ld (hl), 80h
                        ret

; Stop planting code after this. (When generating a tape file we save bytes below here)
AppLast                 equ *-1                         ; The last used byte's address

; Generate some useful debugging commands

                        profile AppFirst,AppLast-AppFirst+1     ; Enable profiling for all the code

; Setup the emulation registers, so Zeus can emulate this code correctly

Zeus_PC                 equ setup                            ; Tell the emulator where to start
Zeus_SP                 equ $FF40                               ; Tell the emulator where to put the stack

; These generate some output files

                        ; Generate a SZX file
                        output_szx AppFilename+".szx",$0000,setup    ; The szx file

                        ; If we want a fancy loader we need to load a loading screen
;                        import_bin AppFilename+".scr",$4000            ; Load a loading screen

                        ; Now, also generate a tzx file using the loader
                        output_tzx AppFilename+".tzx",AppFilename,"",AppFirst,AppLast-AppFirst,1,setup ; A tzx file using the loader

