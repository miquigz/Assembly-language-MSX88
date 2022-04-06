Practica 2(Arquitectura de Computadoras UNLP):
6) * Escribir un programa que solicite el ingreso de un número (de un dígito) 
por teclado y muestre en pantalla dicho número expresado en letras. 
Luego que solicite el ingreso de otro y así sucesivamente. 
Se debe finalizar la ejecución al ingresarse en dos vueltas 
consecutivas el número cero.
	; while(lo ingresado sea <> de dos veces 0 consecutivos) entonces sigo
		ORG 1000h
Msj0	DB		"Cero"
FinMsj0	DB		?

		ORG 1050h
Msj1	DB		"Uno"
FinMsj1	DB		?

		ORG 1100h
FinMsj2	DB		?

		ORG 1150h
Msj3	DB		"Tres"
FinMsj3	DB		?

		ORG 1200h
Msj4	DB		"Cuatro"
FinMsj4	DB		?

		org 1250h
num		DB		?
msj		DB		"Ingrese un numero"
finMsj	DB		?

		ORG 2000h
		mov AH, 0
loop:	mov AL, offset finMsj - offset msj
		mov BX, offset msj
		int 7
		mov BX, OFFSET	num
		mov AL, 1
		int 6; pedimos un numero, carga en [BX]
		mov CL, 0; contador de veces num0
		
		cmp [BX], "0"
		jnz sig1
		mov BX, offset Msj0
		mov AL, OFFSET FinMsj0 - OFFSET Msj0
		INC CL
		int 7
sig1:	cmp [BX], "1"
		jnz sig2
		mov BX, offset Msj1
		mov AL, OFFSET FinMsj1 - OFFSET Msj1
		int 7
sig2	cmp [BX], "2"
		jnz sig3
		mov BX, offset Msj2
		mov AL, OFFSET FinMsj2 - OFFSET Msj2
		int 7
sig3	cmp [BX], "3"
		jnz sig4
		mov BX, offset Msj3
		mov AL, OFFSET FinMsj3 - OFFSET Msj3
		int 7
sig4	cmp [BX], "4"
		mov BX, offset Msj4
		mov AL, OFFSET FinMsj4 - OFFSET Msj4
		int 7
		cmp CL, 2;
		JZ fin
		JMP loop
fin:	int 0
end