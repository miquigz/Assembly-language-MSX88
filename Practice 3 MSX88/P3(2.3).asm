Practica 3(Arquitectura de Computadoras UNLP):
2) Uso de la impresora a través de la PIO. 
c) * Escribir un programa que solicita el ingreso de cinco caracteres por teclado
 y los envía de a uno por vez a la impresora a través de la PIO a medida que se 
 van ingresando. No es necesario mostrar los caracteres en la pantalla.
 
PA		equ		30h
PB		equ		31h
CA		equ		32h
CB		equ		33h
 
		org 1000h
char	DB		?
  
		org 2000h
		mov bx, offset char
		mov ax, 0
		mov CL, 5
		out CB, al
		mov al, 0FDh
		out CA, al
		
		in al, PA
		and al, 0FDh
		out PA, al
		
poll:	in al, PA
		and al, 1
		JNZ poll
		int 6
		mov al, [bx]
		out PB, al
		;pulso strobe
		in al, PA
		or al, 2
		out pa, al
		in al, PA
		and al, 0FDh
		out pa, al
		;
		dec CL
		JNZ poll
		hlt
end