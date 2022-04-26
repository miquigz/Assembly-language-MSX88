Practica 3(Arquitectura de Computadoras UNLP):
2) Uso de la impresora a través de la PIO. Ejecutar los programas en la configuración P1 C1 
del simulador. En esta configuración, el puerto de datos de la impresora se conecta al 
puerto PB del PIO, y los bits de busy y strobe de la misma se conectan a los bits 0 y 1 
respectivamente del puerto PA. Presionar F5 para mostrar la salida en papel. 
El papel se puede blanquear ingresando el comando BI.
a) * Escribir un programa para imprimir la letra “A” utilizando la impresora a través de la PIO.
		
PA		equ		30h
PB		equ		31h
CA		equ		32h
CB		equ		33h

		org 1000h
char	DB		"A"


		org 2000h
		mov ax, 0
		out CB, al;PB => RECIBE CHAR, ..., TODO OUT
		mov al, 0FDh;
		out CA, al; Hago bit de salida nada mas el strobe, 1111 1101
		mov bx, offset char
		
		in al, PA
		and al, 0FDh
		out PA, al
		
poll:	in al, PA
		and al, 1
		JNZ poll
		mov al, [bx]
		out PB, al ; CARGO CHAR
		in al, PA
		OR AL, 2
		out PA, al
		;Strobe =1, ..., aviso a impresora q tiene datos disp para imprimir.
		in AL, PA
		and 0FDh, al
		out PA, al ; fuerzo strobe a 0, ..., hice un pulso
		hlt
end