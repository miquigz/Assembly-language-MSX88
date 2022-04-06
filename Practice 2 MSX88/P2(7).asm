Practica 2(Arquitectura de Computadoras UNLP):
7) * Escribir un programa que efectúe la suma de dos números (de un dígito cada uno) 
ingresados por teclado y muestre el resultado en la pantalla de comandos. 
Recordar que el código de cada caracter ingresado no coincide con el número que
representa y que el resultado puede necesitar ser expresado con 2 dígitos.

		org 1000h
dig1	DB		?
dig2	DB		?
Res		DB		?

		org 2000h
		mov BX, offset dig1
		int 6
		mov BX, offset dig2
		int 6
		mov DL, dig1
		SUB DL, 30h
		mov DH, dig2
		SUB DH, 30h
		mov BX, OFFSET Res
		ADD DL, DH ; suma de los 2 digitos	
		
		cmp CL, 10 ; 9-10 = -1 , ... 1 DIGIT, 10-10 = Z, ,,, <> S 
		JNS DosDig
		ADD DL, 30h
		mov [BX], DL
		mov AH, 0
		mov AL, 1
		JMP FIN2
		
DosDig:	mov AL, DL; movemos a AL para no modificar DL
		; dos digitos: loop hasta que DL - 10 SEA = A JZ
		mov AH, 0; inicializo en 0, por caso 10
		
loop:	CMP AL, 10
		JZ	FIN
		DEC AL; resto AL hasta que AL-10 = FLAG Z
		INC AH
		JMP loop
		
FIN:	mov [BX], "1" ; La suma entre dos digitos nos da como max 18, ... 1X 
		inc BX
		ADD AH, 30h
		mov [BX], AH ; segundo digito
		dec BX
		mov AH, 0
		mov AL, 2
FIN2:	int 7
		int 0
end
		
		
		
		