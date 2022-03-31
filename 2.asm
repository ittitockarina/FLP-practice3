.data 
text_0: .asciiz "Ingrese la cantidad de numeros:\n"
text_1: .asciiz "\nIngrese un numero :\n"
text_2: .asciiz "\nLa suma es:"
text_3: .asciiz "\nEl promedio es:"
text_4: .asciiz "\nEl mayor es:"
text_5: .asciiz "\nEl menor es:"
.text 
main: 
    la $a0, text_0
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    add $t0, $v0, $zero

    li $t1, 0  
    li $t3, 0
    li $t4, 0
    li $t5, 0   
    li $t6, 99   
	Loop:
		beq $t0,$t1, Exit 
		
		li $v0, 4
		la $a0, text_1
		syscall

		li $v0, 5
        syscall
        add $t3, $t3, $v0

        bge $v0, $t5, LABEL_IFA
        
        LABEL_ELSEA:
            b END_LABEL_IFA

        LABEL_IFA:
	        add $t5, $v0, $zero
        
        END_LABEL_IFA:
            blt $v0, $t6, LABEL_IFB
        
        LABEL_ELSEB:
            b END_LABEL_IFB
        LABEL_IFB:
	        add $t6, $v0, $zero
        
        END_LABEL_IFB:
		    add $t1, $t1, 1   # i++			
		
		j Loop
	Exit:		

    la $a0, text_2
    li $v0, 4
    syscall

    la $a0, ($t3)
    li $v0, 1
    syscall	

    la $a0, text_3
    li $v0, 4
    syscall

    div $t7, $t3, $t0

    la $a0, ($t7)
    li $v0, 1
    syscall	

    la $a0, text_4
    li $v0, 4
    syscall

    la $a0, ($t5)
    li $v0, 1
    syscall

    la $a0, text_5
    li $v0, 4
    syscall

    la $a0, ($t6)
    li $v0, 1
    syscall

jr $ra