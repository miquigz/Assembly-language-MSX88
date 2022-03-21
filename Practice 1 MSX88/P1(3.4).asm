Practica1(Arquitectura de Computadoras UNLP):
3) Suma de números de 32 bits. Escribir un programa que calcule
la suma de dos números de 32 bits almacenados en la memoria del microprocesador:
3.4) Llamando a una subrutina SUM32, pero en este caso pasando 
los parámetros por valor y por referencia a través de la pila

		ORG 1000h
n1h		DW		0AC2 h
n1l		DW	 	1423 h
n2h		DW		0BEF h
n1l		DW		1234 h	
RESH	DW		?
RESL	DW		?
		
		ORG 3000h
SUM32:	mov BX, SP
		ADD BX, 2 ; salteo IP
		mov CX, [BX]; n2l
		ADD BX, 2
		mov DX, [BX] ; n1l
		ADD BX,2
		mov AX, [BX]; n2h
		ADD BX,2
		mov BX, [BX]; n1h
		ADD CX, DX
		ADC AX, BX
		mov BX, SP
		ADD BX, 10 ;
		mov [BX], CX ; resl
		ADD BX,2
		mov [BX], AX
		RET	
		
		org 2000h
		mov AX, OFFSET RESH
		PUSH AX
		mov AX, OFFSET RESL
		PUSH AX
		mov AX, n1h
		PUSH AX
		mov AX, n2h
		PUSH AX
		mov AX, n1l
		PUSH AX
		mov AX, n2l
		PUSH AX
		CALL SUM32
		HLT
end