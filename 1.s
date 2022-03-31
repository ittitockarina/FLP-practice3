.data
num_1:     .asciiz "Ingrese un numero: "
num_2:     .asciiz "Ingrese otro numero: "
suma:     .asciiz "La suma es: "
dif:     .asciiz "La diferencia es: "
multiplicacion:     .asciiz "La multiplicacion es: "
division:     .asciiz "La division es: "
prom:     .asciiz "El promedio es: "
enld:     .asciiz "\n"
.text

main:
	#Imprime el string para pedir num_1
    la $a0, num_1
    li $v0, 4
    syscall
	#Lee num_1 por teclado
	li $v0, 5
    syscall
    move $a0, $v0
	add $t0, $v0, 0
	#Imprime num_1
    li $v0, 1	
    syscall
	#Imprime el salto de línea
	la $a0, enld
    li $v0, 4
	syscall
	
	#Imprime el string para pedir num_2
    la $a0, num_2
    li $v0, 4
    syscall
	#Lee num_2 por teclado
	li $v0, 5
    syscall
    move $a0, $v0
	add $t1, $v0, 0
	#Imprime num_2
    li $v0, 1	
    syscall
	#Imprime el salto de línea
	la $a0, enld
    li $v0, 4
	syscall
	
	#Imprime el string de la suma
    la $a0, suma
    li $v0, 4
    syscall
	#Imprime la suma de num_1+num_2
	add $a0, $t1, $t0
    li $v0, 1
    syscall
	#Imprime el salto de línea
	la $a0, enld
    li $v0, 4
	syscall
	
	#Imprime el string de la diferencia
    la $a0, dif
    li $v0, 4
    syscall
	#Imprime la diferencia de num_1-num_2
	sub $a0, $t0, $t1
	li $v0, 1
    syscall
	#Imprime el salto de línea
	la $a0, enld
    li $v0, 4
	syscall
	
	#Imprime el string de la multiplicacion
    la $a0, multiplicacion
    li $v0, 4
    syscall
	#Imprime la multiplicacion de num_1*num_2
	mul $a0, $t0, $t1
	li $v0, 1
    syscall
	#Imprime el salto de línea
	la $a0, enld
    li $v0, 4
	syscall
	
	#Imprime el string de la division
    la $a0, division
    li $v0, 4
    syscall
	#Imprime la division de num_1/num_2
	div $a0, $t0, $t1
	li $v0, 1
    syscall
	#Imprime el salto de línea
	la $a0, enld
    li $v0, 4
	syscall
	
	#Imprime el string del promedio
    la $a0, prom
    li $v0, 4
    syscall
	#Imprime el promedio de num_1 y num_2
	add $t3, $t0, $t1
	div $a0, $t3, 2
	li $v0, 1
	syscall
	
	jr $ra