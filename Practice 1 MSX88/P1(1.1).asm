Practica1(Arquitectura de Computadoras UNLP):
Multiplicación de números sin signo.
1.1)Sin hacer llamados a subrutinas, 
resolviendo el problema desde el programa principal

		ORG 1000h
num1	DB	13h
num2	DB	3h
RES		DB	?

		ORG 2000h
		mov		AL, num1
		mov		BL,	num2
		mov		CL,	0
LOOP:	cmp	BL,0;contemplo Caso 0
		JZ FIN
		ADD 	CL, AL
		DEC		BL
		JMP		LOOP
FIN:	MOV		RES, CL
		HLT
end