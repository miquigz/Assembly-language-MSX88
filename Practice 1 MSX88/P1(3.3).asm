Practica1(Arquitectura de Computadoras UNLP):
3) Suma de números de 32 bits. Escribir un programa que calcule
la suma de dos números de 32 bits almacenados en la memoria del microprocesador:
3.3) Llamando a una subrutina SUM32, pasando los parámetros por referencia
 desde el programa principal a través de registros.

		ORG 1000h
n1h		DW		0AC2 h
n1l		DW	 	1423 h
n2h		DW		0BEF h
n1l		DW		1234 h	
RESH	DW		?
RESL	DW		?
		
		ORG 3000h
SUM32:	PUSH AX ;guardo en pila para poder usar registro
		MOV AX, [BX]
		ADD AX, [DX]
		POP BX	
		ADC  BX, CX  
		RET

		ORG 3500h
SUM32:	ADD [BX], [DX]
		ADC [AX], [CX]
		RET
		
		
		ORG 2000h
		MOV AX, OFFSET n1h
		MOV CX, OFFSET n2h
		MOV BX, OFFSET n1l
		MOV DX, OFFSET n2l
		CALL SUM32
		MOV RESH, [AX]
		MOV RESL,[BX] 