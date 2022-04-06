Practica 2(Arquitectura de Computadoras UNLP):
3) * Escribir un programa que muestre en pantalla las letras del abecedario, sin espacios, intercalando mayúsculas y
minúsculas (AaBb…), sin incluir texto en la memoria de datos del programa. Tener en cuenta que el código de “A” es 41H,
el de “a” es 61H y que el resto de los códigos son correlativos según el abecedario.
		ORG 1000h
CHAR		DB		40h
CHAR2		DB		60h

		ORG 2000h
		mov CL, 0
		mov AL, 1
loop:	cmp cl, 27 ; 26 letras ASCII en ambas Mayus-sin Mayus
		JZ FIN
		mov BX, offset CHAR  
		INC [BX]
		int 7
		mov BX, offset CHAR2
		INC [BX]
		int 7
		inc cl
		JMP loop
FIN:	int 0
end