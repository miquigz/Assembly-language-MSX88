Practica 3(Arquitectura de Computadoras UNLP):
3) Uso de la impresora a través del HAND-SHAKE. Ejecutar los programas en config P1 C2.
a) * Escribir un programa que imprime “INGENIERIA E INFORMATICA” en la impresora 
a través del HAND-SHAKE. La comunicación se establece por consulta de estado (polling). ¿Qué diferencias
encuentra con el ejercicio 2b?

HAND	Equ		40h
DATO	Equ		40h	
EST		Equ		41h

		org 1000h
msj		DB		"INGENIERIA	E INFORMATICA"
finMsj	DB		?

		org 2000h
		mov ax, 0
		in al, EST
		and al, 7FH; bit de INT del hand lo dejamos en 0
		out EST, al
		
		mov BX, offset msj
		mov CL, offset finMsj - offset msj
POLL:	in al, EST
		and al, 1; Consulto por bit de busy del reg EST
		jnz poll 
		mov al, [BX]
		OUT HAND, al; cargamos en registro DATO el char a imprimir
		;El hand automaticamente hace el pulso strobe, luego de recibir el dato
		INC BX
		DEC	CL
		JNZ POLL
		HLT
end