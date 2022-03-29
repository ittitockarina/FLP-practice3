.data
    primer_lado: .asciiz  "Ingrese el primer lado del triangulo : "
    segundo_lado: .asciiz "Ingrese el segundo lado del triangulo: "
    tercer_lado: .asciiz  "Ingrese el tercer lado del triangulo : "
    out_string: .asciiz "\nEl triangulo es valido\n"
    out_string2: .asciiz "\nEl triangulo no es valido\n"
.text
    main:
        # Inicializamos variables
        li $t1, 0
        li $t2, 0
        li $t3, 0

        li $t0, 0 # -> index
        li $t4, 3 # -> Iteraciones
        Loop:
            beq $t4, $t0, Exit

            # Primer lado
            beq $t0, 0, LABEL_IF
            b ELSE_2
            LABEL_IF:
            li $v0, 4
            la $a0, primer_lado
            syscall
            
            li $v0, 5
            syscall
            move $t1, $v0
            b LABEL_ELSE

            ELSE_2:
            # Segundo lado
            beq $t0, 1, LABEL_IF2
            b ELSE_3
            LABEL_IF2:
            li $v0, 4
            la $a0, segundo_lado
            syscall
            
            li $v0, 5
            syscall
            move $t2, $v0
            b LABEL_ELSE
            
            ELSE_3:
            # Tercer lado
            beq $t0, 2, LABEL_IF3
            LABEL_IF3:
            li $v0, 4
            la $a0, tercer_lado
            syscall
            
            li $v0, 5
            syscall
            move $t3, $v0
            b LABEL_ELSE
            LABEL_ELSE:
            add $t0, $t0, 1     # t0++
            
            j Loop
        Exit:

        blez $t1, ERROR_FIGURE
        blez $t2, ERROR_FIGURE
        blez $t3, ERROR_FIGURE
        
        FIGURE_VALID:
        la $a0, out_string
        b FIN_PROGRAMA
        ERROR_FIGURE:
        la $a0, out_string2
        FIN_PROGRAMA:
        li $v0, 4
        syscall

        # Terminar programa
        li $v0, 10
        syscall

        jr $ra