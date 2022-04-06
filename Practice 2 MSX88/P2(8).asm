Practica 2(Arquitectura de Computadoras UNLP):
8) Escribir un programa que efectúe la resta de dos números (de un dígito cada uno) ingresados por teclado y muestre el
resultado en la pantalla de comandos. Antes de visualizarlo el programa debe verificar si el resultado es positivo o negativo
y anteponer al valor el signo correspondiente.

		org 1000h
dig1	DB		?
dig2	DB		?
Res		DB		?

		org 2000h
		mov BX, OFFSET dig1
		int 6
		inc BX
		int 6
		inc BX; pasa a ser offset de Res
		MOV AL, dig1
		MOV AH, dig2
		SUB AL,30h
		SUB AH, 30h
		SUB AL, AH
		js conSig
		ADD AL, 30h
		mov [BX], AL
		inc BX
		mov [BX], "+"
		jmp fin		
conSig:	SUB AH, dig1; rotamos resta, pero no olvidamos el signo
		ADD AH, 30h; obtenemos dig en ascii
		MOV [BX], AH
		INC BX
		MOV [BX], "-"
fin:	mov AL, 2
		int 7
		int 0
end