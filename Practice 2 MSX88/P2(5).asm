Practica 2(Arquitectura de Computadoras UNLP):
5) Modificar el programa anterior agregando una subrutina llamada ES_NUM que verifique si el caracter ingresado es
realmente un número. De no serlo, el programa debe mostrar el mensaje “CARACTER NO VALIDO”. La subrutina debe
recibir el código del caracter por referencia desde el programa principal y debe devolver vía registro el valor 0FFH en caso
de tratarse de un número o el valor 00H en caso contrario. Tener en cuenta que el código del “0” es 30H y el del “9” es
39H.

		ORG	1000h
msj		DB		"Ingrese un numero"
finMsj	DB		?

		org 1300h
msj2	DB		"CARACTER NO VALIDO"
finMsj2	DB		?

		org 1500H ; 0 > digito < 9
num		DB		?

		ORG 3000h
es_num	cmp [BX], "0" ; si me da con signo es porq num es  0<  
		JS NoEs
		cmp "9", [BX]
		JNS SiEs
NoEs:	SUB DH, DL ; OFFSET FinMsj2 - OFFSET msj2
		mov AL, DH
		mov BX, DL ; movemos offset msj2 
		mov CL, 00h
		jmp FIN
SiEs:	mov CL, 0FFh ; resultado es guardado en CL
FIN:	RET

		ORG 2000h
		mov AH, 0
		mov AL, offset finMsj - offset msj
		mov BX, offset msj
		int 7
		mov BX, OFFSET	num ; va cargado en offset de num
		mov AL, 1
		int 6; pedimos una tecla, esto se carga en [BX]
		mov DL, offset msj2
		mov DH, offset FinMsj2
		CALL es_num
		int 0
end
