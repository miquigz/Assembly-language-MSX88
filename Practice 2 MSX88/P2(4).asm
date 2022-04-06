Practica 2(Arquitectura de Computadoras UNLP):
4) Lectura de datos desde el teclado.
Escribir un programa que solicite el ingreso de un número (de un dígito) 
por teclado e inmediatamente lo muestre en la pantalla de comandos, 
haciendo uso de las interrupciones por software INT 6 e INT 7

		ORG	1000h
msj		DB		"Ingrese un numero"
finMsj	DB		?

		org 1300H ; 0 > digito < 9
num		DB		?

		ORG 2000h ;si lo ingresado NO es un num, entonces vuelvo a pedir un num
		mov AH, 0
loop	mov AL, offset finMsj - offset msj
		mov BX, offset msj
		int 7
		mov BX, OFFSET	num
		mov AL, 1
		int 6
		cmp [BX],"0" ; ... 75h - 40h = 35h 
		JS loop; si tiene signo es menor q 0, ..., no es un digito
		cmp [BX], "9" 
		cmp "9", [BX] 
		JS loop
		mov CL, num
		int 0
end