Practica 3(Arquitectura de Computadoras UNLP):
d) Escribir un programa que solicite el ingreso de cinco caracteres por teclado y los almacene en memoria.
Una vez ingresados, que los envíe a la impresora a través del HAND-SHAKE, en primer lugar tal cual
fueron ingresados y a continuación en sentido inverso. Utilizar el HAND-SHAKE en modo consulta de
estado. ¿Qué diferencias encuentra con el ejercicio 2c?

hand	equ		40h
dato	equ		40h
estado	equ		41h




		org 1000h
msj		db		?


		org 2000h
		mov	ax,0
		out
		mov	