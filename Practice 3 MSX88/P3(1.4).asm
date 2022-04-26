Practica 3(Arquitectura de Computadoras UNLP):
d) * Escribir un programa que implemente un encendido y apagado sincronizado de las luces. Un contador,
que inicializa en cero, se incrementa en uno una vez por segundo. Por cada incremento, se muestra a
través de las luces, prendiendo solo aquellas luces donde el valor de las llaves es 1. Entonces, primero
se enciende solo la luz de más a la derecha, correspondiente al patrón 00000001. Luego se continúa con
los patrones 00000010, 00000011, y así sucesivamente. El programa termina al llegar al patrón
11111111.

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
conteo	DB	0
FIN		DB	0

		org 3000h	 ; 0FFh = 255decimal, 1111 1111b
Rut_clck:push ax
		INC conteo
		cmp conteo, 0FFh
		JNZ LEDS ;SI ES 255 TERMINO LAZO, sino sigo mostrando leds
		mov FIN, 5; corte lazo
		mov al, 0FFh
		out IMR, al; desactivo int1 del pic
		jmp FinRut
LEDS:	mov al, conteo
		out PB, al
		mov al, 0
		out cont, al ; REG CONT TIMER, vuelve a 0
FinRut:	mov al, EOI
		out PIC, al
		pop ax 
		IRET
		
		org 2000h
		mov ax,0
		CLI; configuracion PIO:
		out CB, al; PB todo en EN SALIDA
		out PB, al; establezco pb en 0
		out cont, al
		mov al, 1
		out comp, al
		;configuracion PIC:
		mov al, n_clock
		out INT_1, al
		mov al, 0FDh
		out IMR, al
		STI
		
LAZO:	CMP FIN, 5; 5 = valor de corte para el lazo
		JNZ LAZO
		HLT
end; !