Practica1(Arquitectura de Computadoras UNLP):
12) Usando la subrutina anterior escribir la subrutina VOCALES, 
que recibe una cadena por referencia, y devuelve, en un registro, 
la cantidad de vocales que tiene esa cadena

		ORG 1000h
cadena 	DB		"A, B, R, T, s, a, q, b, u, o, i, e, E, }, 2",0
res		DB		?
vocales DB		"A, E, I, O, U, a, e, i, o, u", 0

;					A = 41h, E = 45h, I = 49h, O = 4Fh, U = 55h
;					a = 61h, e=65h, i = 69h, o = 6Fh, u =75h

		ORG 3000h
ES_VOCAL:mov CX, 0; Inicializo registro contador
		mov CH, BH; Guardo el valor inical de las vocales.
loop2:	cmp [BL], 0
		JZ FIN
		cmp [BL], "A" ; comparo cadena con A, ... CHAR - A (41h)
		JS sigChar
		cmp [BL], "u" ; vemos si esta entre los rangos de las vocales
		JNS sigChar
loop:	cmp [BH],0 ;cuando llego a0  dejo de recorrer la string vocales
		JZ sigChar
		cmp [BL], [BH];
		JNZ sigVocal; si no es 0, no es vocal, ... no incremento CL
		INC CL; 
sigVocal:INC BH; sigo recorriendo vocales
		JMP loop
sigChar:mov BH, CH; Volvemos al comienzo de las vocales
		INC	BL; Avanzamos en la cadena de char
		JMP loop2
FIN:	RET	

		ORG 2000h
		mov BL, cadena
		mov BH, OFFSET vocales
		CALL ES_VOCAL
		mov res, CL; Cant de vocales en la cadena
		hlt	
end