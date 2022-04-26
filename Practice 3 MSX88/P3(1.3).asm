Practica 3(Arquitectura de Computadoras UNLP):
c) * Escribir un programa que permite encender y apagar las luces mediante las llaves. El programa no
deberá terminar nunca, y continuamente revisar el estado de las llaves, y actualizar de forma
consecuente el estado de las luces. La actualización se realiza simplemente prendiendo la luz i si la llave
i correspondiente está encendida (valor 1), y apagándola en caso contrario. Por ejemplo, si solo la
primera llave está encendida, entonces solo la primera luz se debe quedar encendida.

PA		equ		30h
PB		equ		31h
CA		equ		32h
CB		equ		33h

		org 2000h
		mov ax, 0
		mov al, 0FFh
		out CA, al ; pa entrada
		mov al, 0
		out CB, al ; pb salida out, ..., recibo datos y devuelvo en leds
polling in al, PA
		out PB, al
		jmp polling
end
