Practica 3(Arquitectura de Computadoras UNLP):
e) Escribir un programa que encienda una luz a la vez, de las ocho conectadas al puerto 
paralelo del microprocesador a través de la PIO, en el 
siguiente orden de bits: 0-1-2-3-4-5-6-7-6-5-4-3-2-1-0-1-2-3-4-5-6-7-6-5-4-3-2-1-0-1-..., 
es decir, 00000001, 00000010, 00000100, etc. Cada luz debe estar encendida durante un segundo. 
El programa nunca termina.

cont 	equ		10h
comp	equ		11h
EOI		equ		20h
PIC		equ		20h
IMR		equ		21h
INT_1	equ		25h

PA		equ		30h
PB		equ		31h
CA		equ		32h
CB		equ		33h

n_clock	equ		20

		org 80
IP_clck	DW		Rut_clck
		
		org 1000h
actual	DB		0
patron	DB		1h
		DB		2h
		DB		4h
		DB		8h
		DB		16h
		DB		32h
		DB		64h
		DB		128h
fin		DB		?

		org 3000h
Rut_clck:push ax
		
		cmp actual, 8
		JNZ	IMPR
		
		
IMPR	mov al, patron
		out PB, patron
		
		cmp patron, fin




		mov al, EOI
		out PIC, al
		pop ax
		IRET

		org 2000h
		mov	ax,	0
		CLI
		out cont, al;TIMER
		out CB, al; PIO
		out PB, al; PIO
		mov al, 1
		out comp, 1;TIMER, interrumpe cuando cont sea = a 1 (1seg)
		mov al, n_clock
		out INT_1, al; PIC
		mov al, 0FDh
		out IMR, al; PIC
		STI
		
		

		