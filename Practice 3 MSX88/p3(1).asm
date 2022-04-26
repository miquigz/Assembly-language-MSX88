Practica 3(Arquitectura de Computadoras UNLP):
1) Uso de las luces y las llaves a través del PIO. Ejecutar los programas bajo la configuración P1 C0 del
simulador, que conecta las llaves al puerto PA del PIO y a las luces al puerto PB.
a) * Escribir un programa que encienda las luces con el patrón 11000011, o sea, 
solo las primeras y las últimas dos luces deben prenderse, y el resto deben apagarse

PA		equ		30h
PB		equ		31h
CA		equ		32h
CB		equ		33h


		org 2000h; 
		mov	ax, 0
		mov al, 0
		out CB, al; configuro PB todo de salida, ..., va a recibir datos, y posteriormente devolver (leds)
		mov al, 0C3h; 1100 0011b (0C3h), \ tengamos PA De entrada solo los bits que queremos
		out CA, al
poll:	in al, PA ;en PA entran datos, en PB recibimos esos datos y devolvemos en leds
		out PB, al
		JMP poll
end