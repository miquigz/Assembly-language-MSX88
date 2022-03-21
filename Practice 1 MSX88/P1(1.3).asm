Practica1(Arquitectura de Computadoras UNLP):
Multiplicación de números sin signo.
1.3) Llamando a una subrutina MUL, pasando los parámetros 
por referencia desde el programa principal a través de registros.

		ORG 1000h
num1	DB	9h
num2	DB	3H
RES		DB	?

		ORG 3000h
MUL:	mov CL, [AL]
		mov CH, [BL]
		mov DH, 0
LOOP:	cmp CH, 0
		JZ FIN
		ADD DH, CL
		DEC CH
		JMP LOOP
FIN:	MOV [DL], DH
		RET
		
		org 2000h
		mov		AL, OFFSET num1
		mov		BL, OFFSET num2
		mov		DL, OFFSET RES
		CALL MUL
		HLT
end