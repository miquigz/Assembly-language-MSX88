Practica 2(Arquitectura de Computadoras UNLP):
9) Escribir un programa que aguarde el ingreso de una clave de cuatro caracteres
por teclado sin visualizarla en pantalla. En caso de coincidir con una clave 
predefinida (y guardada en memoria) que muestre el mensaje  "Acceso permitido", 
caso contrario el mensaje "Acceso denegado".

		org 1000h
PassPre	DB		"FsY4" ; Recordar el espacio OCUPA BYTES

		org 1100h
SiPass	DB		"Acceso permitido"
siFin	DB	 	?

		org 1200h
NoPass	DB		"Acceso denegado"
NoFin	DB		?

		org 1250h
PASS	DB		?

		org 2000h
		mov AX, 0
		mov BX, offset PASS ; muevo la dir a donde alojar la pass
		mov CL, 0; cl contador de char
loop:	cmp CL, 4 ; si CL = 4 , Z=1, ... = fin
		JZ fin
		int 6
		inc CL
		inc BX
		jmp loop ; al llegar a fin tengo OFFSET PASS + 4, pero quiero volver al inicio
fin:	mov BX, offset PASS; a BX muevo el inicio de la pass cargada
;COMPARACION, debo hacer una comparacion solamente usando reg BX
;fin2: SiPass, fin3: me lleva a NoPass
		cmp [BX], offset PassPre 
		JNZ	fin3; <> de 0, ... no es igual
		cmp [BX + 2], offset PassPre + 2
		JNZ	fin3
		cmp [BX + 3], offset PassPre + 3
		JNZ	fin3
		cmp [BX + 4], offset PassPre + 4
		mov AL, OFFSET siFin - offset siPass
		mov BX, offset siPass
		int 7
		jmp fin2
fin3:	mov AL, OFFSET NoFin - offset NoPass
		mov BX, offset NoPass
		int 7
fin2: 	int 0
end