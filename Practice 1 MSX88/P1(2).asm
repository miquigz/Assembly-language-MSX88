Practica1(Arquitectura de Computadoras UNLP):
2) Escribir un programa que calcule el producto entre dos números sin signo 
almacenados en la memoria del microprocesador llamando a una subrutina MUL, pero en 
este caso pasando los parámetros por valor y por referencia a través de la pila.

		ORG 1000H
NUM1	DB		13h
NUM2	DB		2h
RES		DB		?

		ORG 3000h
MUL		mov BX, SP
		ADD BX, 2
		MOV DH, [BX] ; DH = NUM2
		DEC BX
		MOV DL, [BX] ; DL = NUM1
		MOV CL, 0
LOOP:	cmp DH, 0
		JZ FIN
		ADD CL, DL
		DEC DH
		JMP LOOP
		DEC BX
FIN:	MOV [BX], CL
		RET

		ORG 2000H
		MOV AL, OFFSET RES
		PUSH AL
		MOV AL, num1
		PUSH AL
		MOV AL, num2
		PUSH AL
		CALL MUL
		HLT
end