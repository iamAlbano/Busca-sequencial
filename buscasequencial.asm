.data
	Hello: .asciiz "Busca sequencial!" # Cria uma label

.text
	li $v0,4        # Carrega o servi�o (ver Help)
	la $a0,Hello    # carrega o endere�o da label (ver Help)
	syscall         # chamada do sistema
