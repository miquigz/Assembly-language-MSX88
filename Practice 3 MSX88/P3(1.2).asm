Practica 3(Arquitectura de Computadoras UNLP):
1) Uso de las luces y las llaves a través del PIO. Ejecutar los programas bajo la configuración P1 C0 del
simulador, que conecta las llaves al puerto PA del PIO y a las luces al puerto PB.
b) * Escribir un programa que verifique si la llave de más a la izquierda está prendida. 
Si es así, mostrar en pantalla el mensaje “Llave prendida”, 
y de lo contrario mostrar “Llave apagada”.  Solo importa el valor de la llave de más 
a la izquierda (bit más significativo). Recordar que las llaves se manejan con las teclas 0-7.

PA		equ		30h
PB		equ		31h
CA		equ		32h
CB		equ		33h
	
		org 1000h
on		DB		"Llave prendida"
finOn	DB		?
off		db		"Llave apagada"
finOff	db		?

		org 2000h
		mov ax,0
		mov al, 0FFh 
		out CA, al ; CA ff, \ sea PA de entrada
POLL:	in al, PA
		AND al, 80h ; XXXX XXXX AND 1000 0000, ..., si flag Z=0 PRENDIDA, Z=1 APAGADA
		JZ	estaOff
		mov BX, offset on
		mov al, offset finOn - offset on
		jmp IMPR
estaOff:mov bx, offset off
		mov al, offset finOff - offset off
IMPR:	INT 7
		jmp POLL
end