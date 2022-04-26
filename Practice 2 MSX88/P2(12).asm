Practica 2(Arquitectura de Computadoras UNLP):
12) Interrupción por hardware: TIMER.
Implementar a través de un programa un reloj segundero que muestre en pantalla los segundos transcurridos (00-59 seg)
desde el inicio de la ejecución.

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
seg		DB		30h	 ; 0X  PRIMER DIGITO (seg)
		DB		30h	 ; X0  SEGUNDO DIGITO (seg + 1)
fin		DB		?
	
		org	3000h
Rut_clck: push ax ; salvar AX, el cual contiene cant char para INT7
		INC seg + 1; incremento la direccion de una etiqueta, y luego sumo 1
		cmp seg + 1, 3Ah; 3AH = ":" , 39h = "9", ... si es = ":" +1 seg dig
		JNZ	RESET ; Si: ( SEGUNDO dig <= 9 ) sigo imprimendo. 
		
		; SI PASO UN DECIMAL sumamos PRIMER digito, y volvemos a 0 el SEGUNDO.
		mov	seg + 1,	30h ; vuelvo a 0 el SEGUNDO digito
		INC seg; incremento en 1 el PRIMER digito
		
		CMP	seg, 36h; COMPARO CON 6 el primer digito
		JNZ	RESET;	SI es <> a 6, Sigo imprimendo
		mov SEG, 30h ; si ya me pase de 59 segundos, vuelvo a comenzar.
		
RESET:	int 7 ; imprimo los segundos (PRI Y SEG DIGITO)
		mov al, 0
		out cont, al; vuelvo a 0 el reg cont
		mov al, EOI ; Vuelvo el reg ISR a 0, ... puedo volver a interrumpir en el PIC
		out PIC, al
		POP AX
		IRET
		
		org 2000h
		mov ax,0
		CLI
		mov al, 0FDh; desenmask int_1 pic
		out IMR, al
		mov al, n_clk
		out int_1, al
		mov al,	1
		out comp, al
		mov al, 0
		out cont, 0
		mov BX, OFFSET	seg
		mov AL, OFFSET fin - offset	seg
		STI
lazo:	jmp lazo		
		
		end