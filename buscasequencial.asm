.data
	Hello: .asciiz "Busca sequencial!" # Cria uma label

.text
	li $v0,4        # Carrega o serviço (ver Help)
	la $a0,Hello    # carrega o endereço da label (ver Help)
	syscall         # chamada do sistema
