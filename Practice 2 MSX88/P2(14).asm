Practica 2(Arquitectura de Computadoras UNLP):
14) * Implementar un reloj similar al utilizado en los partidos de básquet,
 que arranque y detenga su marcha al presionar sucesivas veces la tecla F10 
 y que finalice el conteo al alcanzar los 30 segundos.
 

cont	Equ		10h
comp	Equ		11h	
PIC		Equ		20h
EOI		Equ		20h
IMR		equ		21h
int_0	equ		24h
int_1	equ		25h
	
nF10	equ		10
n_clck	equ		11
	
		org 40
IP_f10	DW	RUT_f10	
	
		org 44
IP_clck	DW	RUT_clck
	
		org 1000h 
seg		DB		30h; 0X Primer digito (seg, decenas de segundos)
		DB		30h; X0 Segundo digito (seg+1, segundos)
fin 	DB		?
 ;Arrancar y detener su marcha significa enmascarar el PIC la interrupcion 1 del timer
 ;al alcanzar los 30 finaliza su conteo.  
		ORG 3000h	
RUT_clck:push ax
		inc seg+1
		CMP seg+1, 3Ah
		JNZ	IMPR
		mov seg +1, 30h
		inc seg
		CMP seg, 33h
		JNZ	IMPR ; si me pase de 30 seg, finalizo el conteo.
		mov al, 16
		out int_1, al ; llevo int_1 a una direccion del vec que no contiene nada
		mov al,	0FEh 
		out IMR, al ; desenmascaro int_1
		JMP FIN
IMPR:	int7
		mov al, 0
		out cont, al
FIN:	mov al, EOI
		out PIC, al
		POP AX
		IRET
		
		ORG 3500h
RUT_F10:push ax
		IN al, IMR
		AND al, 2 ;RES: 1= Apagado, 0: Prendido
		JNZ Prender; si NO esta prendido SALTO, ..., si es 0 NO SALto
		mov al, 0FEh; 1111 1110 ENMASCARO INT_1 (Apagamos contador)
		jmp finF10
prender:mov al, 0FCh ;1111 1100 Desenmascaro int_1 (Prendemos)
finF10:	out	IMR, al
		mov al, EOI
		out PIC, al
		POP AX
		IRET
	
		org 2000h
		mov ax, 0
		CLI
		mov al, nF10 
		out int_0, al
		mov al, n_clck
		out int_1, al
		mov al,	0FCh
		out IMR, al ; activo int1 e int0	
		mov al, 1
		out comp, al
		mov al, 0
		out cont, al
		mov BX, OFFSET seg
		mov al, OFFSET fin - OFFSET seg
		STI
lazo:	jmp lazo
end