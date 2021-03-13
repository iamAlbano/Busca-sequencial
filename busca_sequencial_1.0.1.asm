.data
	array1: .space 40 	#declara um array de 10 posições
	msg_inicial: .asciiz "\t ----> GRUPO 08 - Busca Sequencial <-----\n\n"
	msg_leitura: .asciiz " Insira os valores do vetor\n"
	msg_busca: .asciiz " Insira o valor a ser buscado no vetor: --- \n\n"
	msg_aux: .asciiz " valor: "
	msg_encontrado: .asciiz "\n\n Valor encontrado: "
	msg_posicao: .asciiz "\n Valor alocado na posição: "
	msg_naoEncontrado: .asciiz "\n\n Valor não encontrado... \n "
	
	
	msg_resultado: .asciiz "\n Resultado da busca:"
	
.text
	li $v0, 4
	la $a0, msg_inicial  #imprime msg inicial
	syscall
	
	jal leitura	
	
	
	
	li $v0, 4   
	la $a0, msg_busca   #pede ao usuário para inserir o valor a ser buscado no vetor
	syscall

	li $v0, 5  #ler o valor inserido pelo usuário
	syscall
	move $a1, $v0

	jal buscaSequencial
	
	#encerra o programa
	li $v0, 10
	syscall
	
	
	
	leitura:
		#subrotina para ler os dados e armazenar no vetor
		
		li $v0, 4 
		la $a0, msg_leitura   #imprime msg para o usuário
		syscall
		
		li $t0, 1    #variável de controle do while
		li $t1, 10   #variável de controle do while
		addi $s0, $zero, 0   #endereço base do vetor
		
		while1:
			bgt $t0, $t1, exit1  #enquanto t0 < t1
			
			# indica a posição do vetor para o usuário
			li $v0, 1 
			move $a0, $t0  
			syscall
			
			li $v0, 4
			la $a0, msg_aux
			syscall
			
			li $v0, 5  #lê um inteiro
			syscall
			
			move $s3, $v0  #guarda o valor armazenado
			
			sw $s3, array1($s0)   #armazena o inteiro no vetor
			addi $s0, $s0, 4   #aponta $s0 para a próxima posição do vetor
			addi $t0, $t0, 1  #atualiza variável de controle do while
			
			j while1
			
		exit1:
			jr $ra #retorna para onde a subrotina foi chamada


	buscaSequencial:
		#subrotina buscaSequencial	
		li $v0, 4
		la $a0, msg_resultado
		syscall
		
		addi $t0, $zero, 0    #variável de controle do while
		addi $s0, $zero, 0   #endereço base do vetor
		
		while2:
			bgt $t0, $t1, exit2  #enquanto t0 < t1			
			lw $s3, array1($s0)
		
			beq $a1, $s3, encontrado  #compara o valor buscado pelo usuário com o valor recuperado do vetor
										
			addi $s0, $s0, 4
			addi $t0, $t0, 1 
				
			nop		
			j while2
			
		exit2:
			li $v0, 4
			la $a0, msg_naoEncontrado
			syscall
			jr $ra	
					
		encontrado:
			#retorna ao usuário que o valor foi encontrado
			li $v0, 4
			la $a0, msg_encontrado
			syscall
				
			li $v0, 1
			move $a0, $a1   #valor buscado 
			syscall   
			
			#retorna a posição em que o valor se encontra no vetor
			li $v0, 4
			la $a0, msg_posicao
			syscall
			
			#realiza a divisão do valor contido em $s0 por 4 para encontrar a posição do vetor
			li $s6, 4
				
			div $s0, $s6
			mflo $s0
			addi $s0, $s0, 1  #soma 1 ao valor posição para exibir de 1-10 posições ao invés de 0-9
			
			#imprime a posição do valor encontrado
			li $v0, 1
			move $a0, $s0
			syscall
			jr $ra #retorna para onde a subrotina foi chamada
				
		
			
				
