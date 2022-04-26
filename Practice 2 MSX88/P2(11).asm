Practica 2(Arquitectura de Computadoras UNLP):
11) Escribir un programa que permita seleccionar una letra del abecedario al azar. El código de la letra debe generarse en
un registro que incremente su valor desde el código de A hasta el de Z continuamente. La letra debe quedar seleccionada al
presionarse la tecla F10 y debe mostrarse de inmediato en la pantalla de comandos.

IMR		equ		21h
int_0	equ		24h

n_f10	equ		8

		ORG 32
IP_F10	DW	Rutina_F10
		
		org 1000h
Res		DB		?

		ORG 3000h
Rutina_F10:	mov DH, 0
		IRET
		
		org 2000h
		CLI
		MOV al, 0FEh; AL = 1111 1110
		OUT PIC+1, al; PIC+1 = 21H (IMR)
		mov al, n_f10
		OUT PIC + 4, al; PIC+4 = 24h (int 0) 	
		STI
		mov DH, 1
loop2:	mov DL, "A"
loop:	cmp DL, "Z"
		JZ loop2
		inc DL
		cmp DH, 0
		jnz loop
		mov RES, DL
		mov al, 1
		mov BX, offset RES
		int 7
		HLT
end