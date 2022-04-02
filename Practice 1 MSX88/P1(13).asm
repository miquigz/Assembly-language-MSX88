Practica1(Arquitectura de Computadoras UNLP):
13) Analizar el funcionamiento de la siguiente subrutina y su programa principal:

		ORG 3000h
mul:	CMP	AX,0
		JZ	FIN
		ADD CX, AX
		DEC AX
		CALL mul
FIN:	RET

		ORG 2000h
		mov CX,0
		mov AX, 3
		CALL mul
		HLT
end

a) ¿Qué hace la subrutina?
b) ¿Cuál será el valor final de CX?
c) Dibujar las posiciones de memoria de la pila, anotando que valores va tomando
d) ¿Cuál será la limitación para determinar el valor mas grande 
que se le puede pasar a la subrutina a través de AX?

