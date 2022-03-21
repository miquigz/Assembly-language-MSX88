Practica1(Arquitectura de Computadoras UNLP):
3) Suma de números de 32 bits. Escribir un programa que calcule
la suma de dos números de 32 bits almacenados en la memoria del microprocesador:
3.1)Sin hacer llamados a subrutinas, 
resolviendo el problema desde el programa principal;

		ORG 1000h
n1h		DW		0AC2 h
n1l		DW	 	1423 h
n2h		DW		0BEF h
n1l		DW		1234 h	
RESH	DW		?
RESL	DW		?

		ORG 2000h
		mov AX, n1h
		mov BX, n1l
		mov CX, n2h
		mov DX, n2l
		ADD BX, DX
		ADC AX, CX
		mov RESL, BX
		mov RESH, AX
		HLT
end
		


