Practica 2(Arquitectura de Computadoras UNLP):
10) Interrupción por hardware: tecla F10.
Escribir un programa que, mientras ejecuta un lazo infinito, cuente el número de veces que se presiona la tecla F10 y
acumule este valor en el registro DX.

EOI		equ 	20h
IMR		equ		21h
INT_0	equ		24h

N_F10	equ		8

		ORG 32
IP_F10	DW	Rutina_f10

		org 3000h
Rutina_f10:inc DX
		IRET
		
		org 2000H
		mov DX, 0
		CLI
		mov al, 0FEh
		OUT IMR, al
		mov al, N_F10
		out INT_0, al
		STI
lazo:	jmp lazo
		hlt
end