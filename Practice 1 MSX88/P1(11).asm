Practica1(Arquitectura de Computadoras UNLP):
11) Escriba la subrutina ES_VOCAL, que determina si un caracter es vocal o no.
La rutina debe recibir el caracter por valor, y debe retornar, vía registro, 
el valor 0FFH si el caracter es una vocal, o 00H en caso contrario.

		ORG 1000h
char 	DB		"A",0
res		DB		?
vocales DB		"A, E, I, O, U, a, e, i, o, u", 0

	;					A = 41h, E = 45h, I = 49h, O = 4Fh, U = 55h
	;					a = 61h, e=65h, i = 69h, o = 6Fh, u =75h
		ORG 3000h
ES_VOCAL:mov DH, 0 
		mov DL, 00h
		cmp AL, "A" ; comparo char con A, ... CHAR - A (41h)
		JS FIN
		cmp AL, "u" ; vemos si esta entre los rangos de las vocales
		JNS FIN
loop:	cmp [AH],0 ;cuando llego a0  dejo de recorrer la string vocales
		JZ FIN
		cmp AL, [AH]; comparo char con todas las vocales
		JZ EsV		
		INC AH; sigo recorriendo vocales
		JMP loop
EsV:	mov DL, 0FFh
FIN:	RET		

		ORG 2000h
		mov AL, char
		mov AH, OFFSET vocales
		CALL ES_VOCAL
		mov res, DL; cargamos resultado del reg
		hlt
end

