Practica1(Arquitectura de Computadoras UNLP):
10) Escriba la subrutina RESTO que calcule el resto de la división entre
2 números positivos. Dichos números deben
pasarse por valor desde el programa principal a la subrutina a través de registros

		ORG 1000h
num2	DB		3  ; divisor
num1	DB		28 ; dividendo
Res		DB		? ; resto

		org 3000h
RESTO:	mov CX, 0; inicializamos CX, CL contador Cociente, CH contador resto
		CMP	AL, AH ; comparamos resta del dividendo y divisor, si me da signo termino
		JS FIN
		SUB AL, AH
		INC CL ;conteo cociente
		JMP Loop
FIN:	mov CH, AL ; movemos el resto
		pop AX; 
		RET
		
		ORG 2000h
		mov AL, num1
		mov AH, num2
		push AX; guardamos el registro momentaneamente, ya q estamos pasando por valor
		CALL RESTO
		pop AX; salvamos valor del registro AX(buenas practicas)
		mov Res, CH
		HLT
end