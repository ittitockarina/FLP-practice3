.data 
    ingres_numero: .asciiz "Ingrese un numero: "
    string: .asciiz "\nEl numero "
    no_mult: .asciiz " no es multiplo de " 
    if_mult: .asciiz " si es multiplo de "
    break_line: .asciiz "\n"
.text
    .globl main
    main:
        li $v0, 4
        la $a0, ingres_numero
        syscall

        li $v0, 5
        syscall
        move $t2, $v0
    
        li $t1, 21 # Iteraciones
        li $t0, 1  # Index
        Loop:
            beq $t1, $t0, Exit

            div $t0, $t2
            mfhi $t3
            
            bne $t3, $zero, NO_MULTIPLO
            li $v0, 4
            la $a0, string
            syscall

        
            li $v0, 1
            move $a0, $t0
            syscall

            li $v0, 4
            la $a0, if_mult
            syscall

            li $v0, 1
            move $a0, $t2
            syscall
            b FIN_SI

            NO_MULTIPLO:
            li $v0, 4
            la $a0, string
            syscall

            li $v0, 1
            move $a0, $t0
            syscall

            li $v0, 4
            la $a0, no_mult
            syscall

            li $v0, 1
            move $a0, $t2
            syscall

            FIN_SI:
            add $t0, $t0, 1 

            j Loop
        Exit:

        li $v0, 4
        la $a0, break_line
        syscall

        li $v0, 10
        syscall

        jr $ra