Practica1(Arquitectura de Computadoras UNLP):
3) Suma de números de 32 bits. Escribir un programa que calcule
la suma de dos números de 32 bits almacenados en la memoria del microprocesador:
3.1) Llamando a una subrutina SUM32 para efectuar la operación, 
pasando los parámetros por valor desde el programa principal a través de registros;


		ORG 1000h
n1h		DW		0AC2 h
n1l		DW	 	1423 h
n2h		DW		0BEF h
n1l		DW		1234 h	
RESH	DW		?
RESL	DW		?


		ORG 3000h
SUM32:	ADD BX, DX
		ADC AX, CX
		RET
		
		ORG 2000h
		mov AX, n1h
		mov CX, n2h
		mov BX, n1l
		mov DX 	n2l
		CALL SUM32
		mov RESH, AX
		mov RESL, BX
		HLT
end





