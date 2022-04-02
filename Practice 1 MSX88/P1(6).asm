Practica1(Arquitectura de Computadoras UNLP):
6) Escribir una subrutina SWAP que intercambie dos datos de 16 bits almacenados
en memoria. Los parámetros deben ser pasados 
por referencia desde el programa principal a través de la pila.

		org 1000h
dato1	DW		AEF9h
dato2	DW		CD23h
	
		org 3000h
		BX, SP
		ADD BX, 2 ;salteo direccion de retorno
		mov AX, [BX] ; muevo a AX, lo apuntado por BX, dato2
		ADD BX, 2
		mov DX, [BX] ; dato 1
		mov [BX], AX ; cambio donde estaba dato1 por dato2
		SUB BX, 2
		mov [BX], DX ; cambio en la dir de dato2, por dato1
		SUB BX,2 ; vuelvo a dir de retorno
		RET		
		
		org 2000h
		mov AX, OFFSET dato1
		PUSH AX
		mov AX, OFFSET dato2
		PUSH AX
		CALL SWAP
		HLT
end