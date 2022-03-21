Practica1(Arquitectura de Computadoras UNLP):
Multiplicación de números sin signo.
1)Llamando a una subrutina MUL para efectuar la operación, 
pasando los parámetros por valor desde el programa principal a través de registros;

		org 1000h
num1 	DB	4 
num2	DB	6
RES		DB	?

		org 3000h
MUL:	mov		CL, 0
loop:	cmp BL, 0
		JZ FIN ; contemplo caso 0, num2 = 0 ... res = 0 (RES = CL)
		ADD CL, AL
		DEC BL
		JMP loop
FIN:	RET
		
		org 2000h 
		mov		AL, num1; NUMERO A MULTIPLICAR
		mov		BL,	num2; CANT DE VECES
		CALL	MUL
		mov		RES, CL; 
		HLT
end