Practica1(Arquitectura de Computadoras UNLP):
5)Escribir una subrutina CONCAR que cuente el número de caracteres de una 
cadena de caracteres terminada en cero(00H) almacenada en la memoria del microprocesador.
La cadena se pasa a la subrutina por referencia vía registro.

		ORG 1000h
CAD		DB		"A,2,3,4,F,B,W,2,W,Q",0
CANT	DB		?

		ORG 3000h
CONCAR:	mov CX, 0 ; inicializo dx
loop:	cmp [BL], 0
		JZ FIN
		INC CL; CONTEO CHAR
		INC BL; avanzo en la dir de memoria
		JMP loop
FIN:	mov [BH], CL; guardo cantidad, en la etiq CANT
		RET

		ORG 2000h
		mov BL, OFFSET CAD
		mov BH, OFFSET CANT
		CALL	CONCAR
		HLT
end