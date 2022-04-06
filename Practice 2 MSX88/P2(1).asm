Practica 2(Arquitectura de Computadoras UNLP):
1) Escritura de datos en la pantalla de comandos.
Implementar un programa en el lenguaje assembler del simulador MSX88
que muestre en la pantalla de comandos un mensaje previamente almacenado 
en memoria de datos, aplicando la interrupción por software INT 7.

		ORG 1000h
Msj		DB		"Hello World-"
Msj2	DB		"Demo1, :)"
FIN		DB		?
		
		org 2000h
		mov AH,0; inicializo AH
		mov AL, OFFSET FIN - OFFSET Msj ; cant char
		mov BX, OFFSET MSJ
		INT 7 ; interrupcion para imprimir en pantalla
		INT 0 ; Interrupcion HLT
end