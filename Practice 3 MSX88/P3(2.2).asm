Practica 3(Arquitectura de Computadoras UNLP):
2) Uso de la impresora a través de la PIO. 
b) * Escribir un programa para imprimir el mensaje “ORGANIZACION Y ARQUITECTURA DE
COMPUTADORAS” utilizando la impresora a través de la PIO.

PA		equ		30h
PB		equ		31h
CA		equ		32h
CB		equ		33h

		org 1000h
msj		DB		"ORGANIZACION Y ARQUITECTURA DE COMPUTADORAS"
finMsj	DB		?
		
		org 2000h
		mov ax, 0
		out CB, al
		mov al, 0FDH
		out CA, al
		;fuerzo Strobe a 0
		in al, PA
		and al, 0fdh
		out PA, al
		;
		mov bx, offset msj
		mov DL, offset finMsj - offset msj		
poll:	in al, PA
		and al, 1h
		JNZ poll
		mov al, [bx]; Cargamos CHAR, en PB
		out PB, al
		;pulso strobe
		in al, PA
		or al, 2h
		out PA, al
		in al, PA
		and al, 0FDh
		out PA, al
		;
		DEC DL
		JZ	FIN
		INC	BX
		JMP poll
FIN:	HLT
end