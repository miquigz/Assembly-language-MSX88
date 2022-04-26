Practica 2(Arquitectura de Computadoras UNLP):
13) Modificar el programa anterior para que también cuente minutos 
(00:00 - 59:59), pero que actualice la visualización en
pantalla cada 10 segundos.

cont	equ		10h
comp	equ		11h
PIC		equ 	20h
EOI		equ		20h
IMR		equ		21h
int_1	equ		25h
	
n_clk	equ		12
	
		org 48
IP_clk	dw	Rut_clck

		org 1000h
seg		DB		30h	 ; 0XXX PRIMER DIGITO  (seg) Minutos Decenas
		DB		30h	 ; X0XX SEGUNDO DIGITO (seg + 1) Minutos
		DB		30h	 ; xx0X TERCER DIGITO  (seg + 2) Segundos Decenas
		DB		30h	 ; XXX0	CUARTO	DIGITO (seg + 3) Segundos
fin		DB		?
	
		org	3000h
Rut_clck:push ax
		INC seg + 2
		cmp SEG + 2, 36h ; XX:6X Si no llego a 6 sigo imprimendo, sino:
		JNZ	IMPR
		MOV SEG + 2, 30h ; vuelvo segundo de decenas a 0, ..., XX:0X
		INC SEG + 1
		cmp seg + 1, 3Ah ; vemos si minutos - ":" nos da 0 
		JNZ IMPR ; X9:XX, si no paso el min 9 sigo imprimendo, sino:
		mov seg + 1, 30h; vuelvo minutos a 0
		inc seg; e incremento una decena de min
		cmp seg, 36h ; 6X:XX si esto no llego a 6 sigo imprimendo, sino:
		JNZ IMPR
		mov seg, 30h
IMPR:	int 7
		mov al, 0
		out cont, 0
		mov al, EOI
		out pic, eoi
		pop ax
		IRET 
		
		org 2000h
		mov ax,0
		CLI
		mov al, 0FDh 
		out IMR, al ;desenmask int_1 pic (21h)
		mov al, n_clk
		out int_1, al ; configuro int_1 del pic (25h)
		mov al,	10
		out comp, al ; configuro reg comp del timer (11H)
		mov al, 0
		out cont, 0; inicializo en 0 el reg cont del timer (10H)
		mov BX, OFFSET	seg
		mov AL, OFFSET fin - offset	seg
		STI
lazo:	jmp lazo
		end