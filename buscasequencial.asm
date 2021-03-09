.data
	array1: .space 40 #declara um array de 10 posições
	msg: .asciiz "\t ---- Insira os valores do vetor ----- \n\n"
	msg_b: .asciiz " valor: "
.text
	
	addi $s0, $zero, 0	 #endereço base do vetor
	
		
	
	li $v0, 4 	# Mensagem para usuário
	la $a0, msg
	syscall
	
	
	li $t0, 1	# variáveis de controle do loop
	li $t1, 10	#*
	
	while:
		bgt $t0, $t1, exit
		
		li $v0, 1		# Mensagem ao usuario
		move $a0, $t0		#
		syscall			#
					#
		li $v0, 4 		#
		la $a0, msg_b		#
		syscall			# fim msg ao usuario
		
		li $v0, 5		#lê inteiro
		syscall		
		move $s3, $v0		#armazena o valor em uma variável temporária
		
		sw $s3, array1($s0)	#armazena o inteiro no vetor
		addi $s0, $s0, 4		
				
		addi $t0, $t0, 1
		j while
		
	exit:
		
	
		
		
		
		
		#li $v0, 5 # Scan inteiro
		
	
	