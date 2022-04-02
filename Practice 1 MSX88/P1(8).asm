Practica1(Arquitectura de Computadoras UNLP):
8) Usando la subrutina ROTARIZ del ejercicio 4, escriba una subrutina ROTARDER 
que haga una rotación hacia la derecha de un byte almacenado en la memoria
del microprocesador. Dicho byte y el número de posiciones a rotar deben pasarse
por valor desde el programa principal a la subrutina a través de registros.

		ORG 1000h
num		DB		00110011 ; num a multiplicar
veces	DB		2
res		DB		?

;			left	 	right
;		veces a rotar a la derecha + 8.

		ORG 3000h		
ROTARIZ:ADD AL, 4; addeo 4 para mover a la derecha
loop:	cmp AL, 0
		JZ FIN
		ADD AH, AH
		DEC AL
		JMP loop
FIN:	RET
				
		ORG 2000h
		mov AL, veces
		mov AH, num
		CALL ROTARIZ
		mov res, AH
		HLT
end