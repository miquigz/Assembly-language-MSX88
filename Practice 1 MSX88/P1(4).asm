Practica1(Arquitectura de Computadoras UNLP):
4) Escribir una subrutina ROTARIZ que haga una rotación hacia la izquierda 
de los bits de un byte almacenado en la memoria del microprocesador. 
Dicho byte y el número de posiciones a rotar deben pasarse por valor desde el programa
principal a la subrutina a través de registros.

		ORG 1000h
num		DB		00110011 ; num a multiplicar
veces	DB		3
res		DB		?

;			left	 	right
;		veces a rotar (2 * veces ), ... , 2*1 = 2, 2*4= 8, ..., veces = multiplo

		ORG 3000h		
ROTARIZ:cmp AL, 0
		JZ FIN
		ADD AH, AH
		DEC AL
		JMP ROTARIZ
FIN:	RET
				
		ORG 2000h
		mov AL, veces
		mov AH, num
		CALL ROTARIZ
		mov res, AH
		HLT
end