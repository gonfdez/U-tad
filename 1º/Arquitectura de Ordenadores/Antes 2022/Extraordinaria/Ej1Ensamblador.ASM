; This is a basic template file for writing 48K Spectrum code.

AppFilename             equ "NewFile"                   ; What we're called (for file generation)

AppFirst                equ $8000                       ; First byte of code (uncontended memory)

                        zeusemulate "48K","ULA+"        ; Set the model and enable ULA+


; Start planting code here. (When generating a tape file we start saving from here)

                        org AppFirst                    ; Start of application

consolaPrincipal                ld a, 2
                                call CHANOPEN


                                call imprimirFrase1
                                call imprimirOpciones01

                                call leerTeclado


                                ;call escogeOpcion
                                jp bucleFin
                                halt
                                jp consolaPrincipal

;-------------------RUTINAS-------------------------------------------
imprimirFrase1                  ld de, frase11
                                ld bc, 28     ;Numero de caracteres +2
                                jp PRINT
                                ret

imprimirOpciones01              call imprimirOpcionD
                                call imprimirOpcionI
                                call imprimirOpcionF
                                call imprimirOpcionN
                                ret

imprimirOpcionD              ld de, opciones11
                                ld bc, 20
                                jp PRINT
                                ret

imprimirOpcionI              ld de, opciones12
                                ld bc, 21
                                jp PRINT
                                ret

imprimirOpcionF              ld de, opciones13
                                ld bc, 22
                                jp PRINT
                                ret

imprimirOpcionN              ld de, opciones14
                                ld bc, 18
                                jp PRINT
                                ret

leerTeclado                     call leerTecladoD
                                call z leerTeclado2D
                                ret z
                                call leerTecladoI
                                call z leerTeclado2I
                                ret z
                                call leerTecladoF
                                call z leerTeclado2F
                                ret z
                                call leerTecladoN
                                call z opcionN
                                ret z
                                jp nz leerTeclado

leerTecladoD                    ld a,0fdh
                                in a,(0feh)
                                BIT 2, A
                                call z borrarOpcionD
                                ret

leerTecladoI                    ld a, 0dfh
                                in a,(0feh)
                                BIT 2, A
                                call z borrarOpcionI
                                ret

leerTecladoF                    ld a,0fdh
                                in a,(0feh)
                                BIT 3, A
                                call z borrarOpcionF
                                ret

leerTecladoN                    ld a,7fh
                                in a,(0feh)
                                BIT 3, A
                                ;call z borrarOpcionN
                                ret

leerTeclado2F                   call leerTecladoD
                                call z leerTeclado2DF
                                call leerTecladoI
                                call z leerTeclado2IF
                                call leerTecladoN
                                call z opcionFN
                                jp nz leerTeclado2F

leerTeclado2D                   call leerTecladoI
                                call z leerTeclado2DI
                                call leerTecladoF
                                call z leerTeclado2DF
                                call leerTecladoN
                                call z opcionDN
                                jp nz leerTeclado2D

leerTeclado2I                   call leerTecladoD
                                call z leerTeclado2DI
                                call leerTecladoF
                                call z leerTeclado2IF
                                call leerTecladoN
                                call z opcionIN
                                jp nz leerTeclado2I

leerTeclado2IF                  call leerTecladoD
                                call z opcionDIF
                                call leerTecladoN
                                call z opcionIFN
                                jp nz leerTeclado2IF

leerTeclado2DI                  call leerTecladoF
                                call z opcionDIF
                                call leerTecladoN
                                call z opcionDIN
                                jp nz leerTeclado2DI

leerTeclado2DF                  call leerTecladoI
                                call z opcionDIF
                                call leerTecladoN
                                call z opcionDFN
                                jp nz leerTeclado2DF

opcionN                         call imprimirEnfermedadN
                                jp bucleFin

opcionFN                        call imprimirEnfermedadFN
                                jp bucleFin

opcionIN                        call imprimirEnfermedadIN
                                jp bucleFin

opcionIFN                       call imprimirEnfermedadIFN
                                jp bucleFin

opcionDN                        call imprimirEnfermedadDN
                                jp bucleFin

opcionDFN                       call imprimirEnfermedadDFN
                                jp bucleFin

opcionDIF                       call imprimirEnfermedadDIF
                                jp bucleFin

opcionDIN                       call imprimirEnfermedadDIN
                                jp bucleFin

imprimirEnfermedadN           ld de, enfermedadN
                                ld bc, 23
                                jp PRINT
                                ret


imprimirEnfermedadFN           ld de, enfermedadFN
                                ld bc, 29
                                jp PRINT
                                ret

imprimirEnfermedadIN           ld de, enfermedadIN
                                ld bc, 53
                                jp PRINT
                                ret

imprimirEnfermedadIFN            ld de, enfermedadIFN
                                ld bc, 49
                                jp PRINT
                                ret

imprimirEnfermedadDN           ld de, enfermedadDN
                                ld bc, 15
                                jp PRINT
                                ret

imprimirEnfermedadDFN           ld de, enfermedadDFN
                                ld bc, 46
                                jp PRINT
                                ret

imprimirEnfermedadDIN           ld de, enfermedadDIN
                                ld bc, 24
                                jp PRINT
                                ret

imprimirEnfermedadDIF           ld de, enfermedadDIF
                                ld bc, 15
                                jp PRINT
                                ret

borrarFrase                     ld de, fraseVacia
                                ld bc, 28
                                jp PRINT
                                ret

borrarOpcionD                   ld de, fraseVaciaD
                                ld bc, 20
                                jp PRINT
                                ret

borrarOpcionI                   ld de, fraseVaciaI
                                ld bc, 21
                                jp PRINT
                                ret

borrarOpcionF                   ld de, fraseVaciaF
                                ld bc, 22
                                jp PRINT
                                ret

borrarOpcionN                   ld de, fraseVaciaN
                                ld bc, 18
                                jp PRINT
                                ret

bucleFin                        halt
                                jp bucleFin
;--------------ETIQUETAS-------------------------------
CHANOPEN equ 5633
PRINT equ 8252
frase11 defb 22,2,1,"Que tres sintomas tienes?"
fraseVacia defb 22,2,1,"                         "
opciones11 defb 22,5,3,"Dolor de garganta"
fraseVaciaD defb 22,5,3,"                 "
opciones12 defb 22,7,3,"Irritacion de piel"
fraseVaciaI defb 22,7,3,"                  "
opciones13 defb 22,9,3,"Falta de equilibrio"
fraseVaciaF defb 22,9,3,"                   "
opciones14 defb 22,11,3,"No mas sintomas"
fraseVaciaN defb 22,11,3,"                "
enfermedadDIF defb 22,14,2,"Tienes Lepra"
enfermedadDIN defb 22,14,2,"Sufres deshidratacion"
enfermedadDFN defb 22,14,2,"Es posible que te fallen los oidos, vertigo"
enfermedadDN defb 22,14,2,"Tienes Gripe"
enfermedadIFN defb 22,14,2,"Es probable que estes sufriendo una insolacion"
enfermedadIN defb 22,14,2,"Seguramente te has quemado con el Sol, ponte crema"
enfermedadFN defb 22,14,2,"Bajon de azucar, come algo"
enfermedadN defb 22,14,2,"Estas perfectamente!"
;------------------------------------------------------







; Stop planting code after this. (When generating a tape file we save bytes below here)
AppLast                 equ *-1                         ; The last used byte's address

; Generate some useful debugging commands

                        profile AppFirst,AppLast-AppFirst+1     ; Enable profiling for all the code

; Setup the emulation registers, so Zeus can emulate this code correctly

Zeus_PC                 equ consolaPrincipal                            ; Tell the emulator where to start
Zeus_SP                 equ $FF40                               ; Tell the emulator where to put the stack

; These generate some output files

                        ; Generate a SZX file
                        output_szx AppFilename+".szx",$0000,consolaPrincipal    ; The szx file

                        ; If we want a fancy loader we need to load a loading screen
;                        import_bin AppFilename+".scr",$4000            ; Load a loading screen

                        ; Now, also generate a tzx file using the loader
                        output_tzx AppFilename+".tzx",AppFilename,"",AppFirst,AppLast-AppFirst,1,consolaPrincipal ; A tzx file using the loader



