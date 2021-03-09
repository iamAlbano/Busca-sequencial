.data
	array1: .space 40 	#declara um array de 10 posições
	msg: .asciiz "\t ---- Insira os valores do vetor ----- \n\n"
	msg_busca: .asciiz "\t --- Insira o valor a ser buscado no vetor: --- \n\n"
	msg_b: .asciiz " valor: "
	msg_encontrado: .asciiz "\n\n Valor encontrado: "
	msg_posicao: .asciiz "\n Valor alocado na posição: "
	msg_naoEncontrado: .asciiz "\n\n Valor não encontrado... "
	
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
	
	
		
	# Inserir o valor a ser buscado
	li $v0, 4 	# Mensagem para usuário
	la $a0, msg_busca
	syscall	
	
	li $v0, 5 #ler valor inserido pelo usuario
	syscall
	move $s4, $v0
	
	# algoritmo de busca sequencial.
	li $t0, 1
	move $s0, $zero
	
	while2:
		bgt $t0, $t1, exit2
		lw $s5, array1($s0)
		
		beq $s4,$s5 encontrado	#compara o valor inserido com o valor buscado
		
		addi $s0, $s0, 4 	#aponta para a proxima posição do vetor
		addi $t0, $t0, 1 	# $t++
	
		j while2
			

	encontrado:
		li $v0, 4
		la $a0, msg_encontrado	
		syscall
		
		li $v0, 1	
		move $a0, $s4
		syscall
		
		li $v0, 4
		la $a0, msg_posicao
		syscall
		
		li $t9, 4
		
		div $s0, $t9 	#divisão
		mflo $s0
		addi $s0, $s0, 1
		
		li $v0, 1
		move $a0, $s0
		syscall
		
		li $v0, 10
		syscall
	
	exit2:	
		li $v0, 4
		la $a0, msg_naoEncontrado		
		syscall
	 	
	 	#"retorno para o usuario"	
	 
		
		
	
	