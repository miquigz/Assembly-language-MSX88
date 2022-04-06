Practica 2(Arquitectura de Computadoras UNLP):
2) Escribir un programa que muestre en pantalla todos los caracteres disponibles
en el simulador MSX88, comenzando con el caracter cuyo código es el número 01H.
;	01h    hasta -->	~ = (7Eh)
		ORG 1000h
cad		DB		?

		ORG 2000h
		mov BH, OFFSET cad; Guardo OFFSET del principio de la cadena
		mov DH, 0
		mov BL, OFFSET cad
		mov [BL], 01h"Primer Char"
loop:	cmp  [BL], "~"
		JZ FIN
		mov DL, [BL] + 1; usamos DL para registro Auxiliar
		INC BL ; avanzamos en dir memoria para alojar mas char
		mov [BL], DL
		;mov [BL + 1], [BL] + 1 , Se puede?
		jmp loop	
FIN		mov DH, BL + 1 ; DH seria el fin de la cadena (OFFSET)
		mov BX, BH ; muevo el offset del comienzo de la cadena a BX(para int7)
		mov AL, DH - offset cad
		int 7
		int 0
end
