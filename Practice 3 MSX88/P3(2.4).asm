Practica 3(Arquitectura de Computadoras UNLP):
2) Uso de la impresora a través de la PIO. 
d) * Escribir un programa que solicite ingresar caracteres por teclado y que
 recién al presionar la tecla F10 los envíe a la impresora a través de la PIO. 
 No es necesario mostrar los caracteres en la pantalla.

EOI		equ		20h
PIC		equ		20h
IMR		equ		21h
int_0	equ		24h

PA		equ		30h
PB		equ		31h
CA		equ		32h
CB		equ		33h

n_f10	equ		10

		org 40
ip_f10	DW		Rut_f10

		org 1000h
corte	DB		0
cadena	DB		?

		org	3000h
Rut_f10:SUB BX, DX ; FIN - COMIENZO 
		mov CL, BX ; muevo a CL el total
		mov BX, DX; Muevo a BX el puntero primero
		
poll:	in al, PA
		and al, 1
		JNZ	poll
		mov al, [BX]
		inc BX
		out PB, al
		;pulso strobe
		in al, pa
		or al, 2
		out pa, al
		in al, pa
		and al, 0fdh
		out pa, al			
		;
		DEC CL
		JNZ	poll
		mov al, 0FFh
		out IMR, al
		mov al, EOI
		out PIC, al
		mov corte, 5 ; valor de corte para la consulta de estado
		IRET
 
		org 2000h
		mov ax,0
		out CB, al
		mov al, 0FDh
		out CA, al
		CLI
		mov al, n_f10
		out int_0, al
		mov al, 0FEh
		out IMR, al
		STI
		in al, PA
		and al, 0FDh
		out PA, al
		mov DX, offset cadena; puntero inicial
		mov BX, offset cadena
pedido:	int 6
		inc BX
		cmp corte, 5
		JNZ pedido
		hlt
end