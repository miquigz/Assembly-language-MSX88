Practica1(Arquitectura de Computadoras UNLP):
7) Modificar la subrutina del ejercicio 5 para que cuente la cantidad de 
veces que se repite un dado caracter en una cadena.
Además, la subrutina debe cambiar el caracter especificado por una "X". 
El caracter a buscar se debe pasar por valor mientras que la cadena 
a analizar por referencia a través de la pila.

		ORG 1000h
CAD		DB		"A,2,3,4,F,B,W,2,W,Q",0
CharB	DB		? ; caracter dado a Buscar
CANT	DB		?

		ORG 3000h
CONCAR:	mov CL, 0 ; Registro a utilizar para conteo
		mov BX, SP
		ADD BX, 2
		mov AX, [BX] ; AX, AL Tiene a CANT OFFSET, AH contiene a OFFSET CAD
		INC BX ; decremento en 1, para acceder a CharB (guardado little endian)
		mov CH, [BX] ; CH contiene charB
		
Loop:	cmp [AH], 0 ; comparo char con 0, si es 0 salto a fin
		JZ FIN
		cmp [AH], CH; comparo si AH es <> o igual de CH(charB)
		JNZ NoEs
		INC CL; contador de repeticion de charB
		MOV [AH], "X"; reemplazo el char con una X
NoEs:	INC AH ; sumo 1 byte, a la direccion para avanzar en AH (cadena)
		JMP Loop
FIN:	mov [AL], CL
		SUB BX, 3; BX = SP
		RET

		ORG 2000h
		mov AL, OFFSET CAD
		mov AH, OFFSET CANT
		push AX
		mov AL, CharB
		mov AH, 0
		push AX
		CALL	CONCAR
		pop AX
		pop AX; limpiamos Pila (buenas practicas)
		HLT
end		