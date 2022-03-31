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
	
            la $a0, num_2
            li $v0, 4
            syscall

	          li $v0, 5
            syscall
            move $a0, $v0
            add $t1, $v0, 0

            li $v0, 1	
            syscall

            la $a0, enld
            li $v0, 4
            syscall
	
            la $a0, suma
            li $v0, 4
            syscall

            add $a0, $t1, $t0
            li $v0, 1
            syscall

            la $a0, enld
            li $v0, 4
            syscall
	

            la $a0, dif
            li $v0, 4
            syscall

            sub $a0, $t0, $t1
            li $v0, 1
            syscall

            la $a0, enld
            li $v0, 4
            syscall
	

            la $a0, multiplicacion
            li $v0, 4
            syscall

            mul $a0, $t0, $t1
            li $v0, 1
            syscall

            la $a0, enld
            li $v0, 4
            syscall
	
            la $a0, division
            li $v0, 4
            syscall

            div $a0, $t0, $t1
            li $v0, 1
            syscall

            la $a0, enld
            li $v0, 4
            syscall
	
            la $a0, prom
            li $v0, 4
            syscall

            add $t3, $t0, $t1
            div $a0, $t3, 2
            li $v0, 1
            syscall
	
            jr $ra     
