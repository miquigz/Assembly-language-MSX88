Practica 2(Arquitectura de Computadoras UNLP):
9) Escribir un programa que aguarde el ingreso de una clave de cuatro caracteres
por teclado sin visualizarla en pantalla. En caso de coincidir con una clave 
predefinida (y guardada en memoria) que muestre el mensaje  "Acceso permitido", 
caso contrario el mensaje "Acceso denegado". 
		org 1000h
PassPre	DB		"FsY4" ; Recordar el espacio OCUPA BYTES

		org 1100h
SiPass:	DB		"Acceso permitido"

		org 1200h
NoPass:	DB		"Acceso denegado"

		org 1250h
PASS	DB		?

		org 2000h
		mov BX, offset PASS
		mov AL, 1
		mov CL, 0
loop:	cmp CL, 0
		JZ fin
		int 6
		inc CL
		inc BX
		jmp loop
fin:	mov BX, offset PASS ;
		mov DX, BX
		MOV BX, OFFSET PassPre
		
loop2:	cmp [DX], [BX] ; hacer con aux?


