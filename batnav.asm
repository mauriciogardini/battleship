.model small
.stack 1000h
.data
	; Mensagens
	msgErroCoor		DB		13, 10, 13, 10, "            Sequencia invalida! Formato: NNC, onde N=[0-9] e C=[H,V]", 13, 10, 13, 10, "$"
	msgErroCoorT	DB		"Sequencia invalida! Formato: NN, onde N=[0-9]", 13, 10, 13, 10, "$"
	msgErroBarc		DB		13, 10, 13, 10, "                     Ja existe um navio na posicao infomada!        ", 13, 10, 13, 10, "$"
	msgFimJogo		DB		"Fim de Jogo!", 13, 10, "$"

	; Nomes dos navios
	port_av			DB		27 DUP (32), 186, 6 DUP (32), "Porta Avioes", "$"
	nav_gue			DB		27 DUP (32), 186, 4 DUP (32), "Navio de Guerra", "$"
	submari			DB		27 DUP (32), 186, 7 DUP (32), "Submarino", "$"
	destroy			DB		27 DUP (32), 186, 7 DUP (32), "Destroyer", "$"
	barcopa			DB		27 DUP (32), 186, 5 DUP (32), "Barco Patrulha", "$"

	; Contadores
	tiros_qtde		DB		0d, "$"
	acert_qtde		DB		0d, "$"
	tirin_qtde		DB		0d, "$"
	acein_qtde		DB		0d, "$"

	; Dados
	m_barc			DB		10 DUP (10 DUP (32)), '$'
	m_tiros			DB		10 DUP (10 DUP (254)), '$'
	m_barc_in		DB		5 DUP (254), 5 DUP ("A")
					DB		6 DUP (254), 4 DUP ("B")
					DB		7 DUP (254), 3 DUP ("S")
					DB		7 DUP (254), 3 DUP ("D")
					DB		8 DUP (254), 2 DUP ("P")
					DB		5 DUP (10 DUP (254)), '$'

	; Telas
	cfg				DB		27 DUP (32), 201, 24 DUP (205), 187, 13, 10
					DB		27 DUP (32), 186, 4 DUP (32), "Matriz de Navios", 4 DUP (32), 186, 13, 10
					DB		27 DUP (32), 186, 24 DUP (205), 186, 13, 10
					DB		27 DUP (32), 186, 3 DUP (32), "0 1 2 3 4 5 6 7 8 9", 2 DUP (32), 186, 13, 10
					DB		27 DUP (32), 186, 32, "0", 22 DUP (32), 186, 13, 10
					DB		27 DUP (32), 186, 32, "1", 22 DUP (32), 186, 13, 10
					DB		27 DUP (32), 186, 32, "2", 22 DUP (32), 186, 13, 10
					DB		27 DUP (32), 186, 32, "3", 22 DUP (32), 186, 13, 10
					DB		27 DUP (32), 186, 32, "4", 22 DUP (32), 186, 13, 10
					DB		27 DUP (32), 186, 32, "5", 22 DUP (32), 186, 13, 10
					DB		27 DUP (32), 186, 32, "6", 22 DUP (32), 186, 13, 10
					DB		27 DUP (32), 186, 32, "7", 22 DUP (32), 186, 13, 10
					DB		27 DUP (32), 186, 32, "8", 22 DUP (32), 186, 13, 10
					DB		27 DUP (32), 186, 32, "9", 22 DUP (32), 186, 13, 10
					DB		27 DUP (32), 186, 24 DUP (205), 186, 13, 10
					DB		27 DUP (32), 186, 24 DUP (205), 186, 13, 10
					DB		27 DUP (32), 186, 2 DUP (32), "Digite a posicao do", 3 DUP (32), 186, 13, 10
					DB		27 DUP (32), 186, 24 DUP (32), 186, 13, 10
					DB		27 DUP (32), 186, 24 DUP (32), 186, 13, 10
					DB		27 DUP (32), 200, 24 DUP (205), 188, 13, 10, "$"

	tela			DB		201, 24 DUP (205), 187, 32, 201, 24 DUP (205), 187, 23 DUP (32), 13, 10
					DB		186, 5 DUP (32), "Matriz de Tiro", 5 DUP (32), 186, 32, 186, 4 DUP (32), "Matriz de Navios", 4 DUP (32), 186, 23 DUP (32), 13, 10
					DB		204, 24 DUP (205), 185, 32, 204, 24 DUP (205), 185, 32, 201, 20 DUP (205), 187, 13, 10
					DB		186, 3 DUP (32), "0 1 2 3 4 5 6 7 8 9", 2 DUP (32), 186, 32, 186, 3 DUP (32), "0 1 2 3 4 5 6 7 8 9", 2 DUP (32), 186, 32, 186, 32, "Voce", 15 DUP (32), 186, 13, 10
					DB		186, 32, "0", 10 DUP (32, 254), 2 DUP (32), 186, 32, 186, 32, "0", 22 DUP (32), 186, 32, 186, 4 DUP (32), "Tiros:", 9 DUP (32), 32, 186, 13, 10
					DB		186, 32, "1", 10 DUP (32, 254), 2 DUP (32), 186, 32, 186, 32, "1", 22 DUP (32), 186, 32, 186, 4 DUP (32), "Acertos:", 7 DUP (32), 32, 186, 13, 10
					DB		186, 32, "2", 10 DUP (32, 254), 2 DUP (32), 186, 32, 186, 32, "2", 22 DUP (32), 186, 32, 186, 4 DUP (32), "Afundados:", 5 DUP (32), 32, 186, 13, 10
					DB		186, 32, "3", 10 DUP (32, 254), 2 DUP (32), 186, 32, 186, 32, "3", 22 DUP (32), 186, 32, 186, 20 DUP (32), 186, 13, 10
					DB		186, 32, "4", 10 DUP (32, 254), 2 DUP (32), 186, 32, 186, 32, "4", 22 DUP (32), 186, 32, 204, 20 DUP (205), 185, 13, 10
					DB		186, 32, "5", 10 DUP (32, 254), 2 DUP (32), 186, 32, 186, 32, "5", 22 DUP (32), 186, 32, 186, 32, "Adversario", 9 DUP (32), 186, 13, 10
					DB		186, 32, "6", 10 DUP (32, 254), 2 DUP (32), 186, 32, 186, 32, "6", 22 DUP (32), 186, 32, 186, 4 DUP (32), "Tiros:", 9 DUP (32), 32, 186, 13, 10
					DB		186, 32, "7", 10 DUP (32, 254), 2 DUP (32), 186, 32, 186, 32, "7", 22 DUP (32), 186, 32, 186, 4 DUP (32), "Acertos:", 7 DUP (32), 32, 186, 13, 10
					DB		186, 32, "8", 10 DUP (32, 254), 2 DUP (32), 186, 32, 186, 32, "8", 22 DUP (32), 186, 32, 186, 4 DUP (32), "Afundados:", 5 DUP (32), 32, 186, 13, 10
					DB		186, 32, "9", 10 DUP (32, 254), 2 DUP (32), 186, 32, 186, 32, "9", 22 DUP (32), 186, 32, 186, 4 DUP (32), "Ultimo Tiro:", 3 DUP (32), 32, 186, 13, 10
					DB		200, 24 DUP (205), 188, 32, 200, 24 DUP (205), 188, 32, 200, 20 DUP (205), 188, 13, 10
					DB		13, 10
					DB		201, 74 DUP (205), 187, 13, 10
					DB		186, 32, "Mensagens:", 63 DUP (32), 186, 13, 10
					DB		204, 24 DUP (205), 203, 205, 203, 24 DUP (205), 203, 205, 203, 20 DUP (205), 185, 13, 10
					DB		186, 32, "Porta B", 16 DUP (32), 186, 32, 186, 32, "Porta C", 16 DUP (32), 186, 32, 186, 32, "Tiro", 15 DUP (32), 186, 13, 10
					DB		186, 24 DUP (32), 186, 32, 186, 24 DUP (32), 186, 32, 186, 20 DUP (32), 186, 13, 10
					DB		200, 24 DUP (205), 188, 32, 200, 24 DUP (205), 188, 32, 200, 20 DUP (205), 188, 13, 10, "$"

.code

	INICIAR					PROC	; Inicia o programa.
		MOV AX, @DATA
		MOV DS, AX
		RET
	INICIAR					ENDP

	ENCERRAR				PROC	; Termina o programa.
		MOV AH, 04CH				; 4C - Encerra o programa
		INT 21H						; Habilita a IRQ 21 (DOS)
		RET
	ENCERRAR				ENDP

	LIMPATELA				PROC	; Limpa todos os caracteres da tela.
		PUSH AX
		MOV AH, 00h					; 00 - Definir o modo de video
		MOV AL, 3					; 80x25, 16 cores, 8 paginas)
		INT 10h						; Habilita a IRQ 10 (video)
		POP AX
		RET
	LIMPATELA				ENDP

	POSCCFG					PROC	; Posiciona o cursor na posicao correta para se escrever as coordenadas do navio
		PUSH DX
		MOV DH, 18					; Linha
		MOV DL, 39					; Coluna
		CALL POSCURSOR
		POP DX
		RET
	POSCCFG					ENDP

	POSCNAV					PROC	; Posiciona o cursor na posicao correta para se escrever o nome do navio
		PUSH DX
		MOV DH, 17					; Linha
		MOV DL, 0					; Coluna
		CALL POSCURSOR
		POP DX
		RET
	POSCNAV					ENDP

	POSCTELA				PROC	; <DH, DL> Posiciona o cursor na posicao correta para se escrever o XY do tiro
		PUSH DX
		MOV DH, 20					; Linha
		MOV DL, 56					; Coluna
		CALL POSCURSOR
		POP DX
		RET
	POSCTELA				ENDP

	POSCTELAERR				PROC	; <DH, DL> Posiciona o cursor na posicao correta para se escrever o erro de validacao de XY
		PUSH DX
		MOV DH, 17					; Linha
		MOV DL, 13					; Coluna
		CALL POSCURSOR
		POP DX
		RET
	POSCTELAERR				ENDP

	POSCURSOR				PROC	; Posiciona o cursor no XY em DX (DH - Linha; DL - Coluna).
		PUSH AX
		PUSH BX
		MOV AH, 02h					; 02 - Definir a posicao do cursor
		MOV BH, 00h					; Pagina de video
		INT 10h
		POP BX
		POP AX
		RET
	POSCURSOR				ENDP

	POSCTI					PROC	; Posiciona o cursor na posicao correta para se escrever a quantidade de tiros
		PUSH DX
		PUSH AX
		MOV DH, 4					; Linha
		MOV DL, 72					; Coluna
		CALL POSCURSOR
		POP AX
		POP DX
		RET
	POSCTI					ENDP

	POSCAC					PROC	; Posiciona o cursor na posicao correta para se escrever a quantidade de acertos
		PUSH DX
		PUSH AX
		MOV DH, 5					; Linha
		MOV DL, 72					; Coluna
		CALL POSCURSOR
		POP AX
		POP DX
		RET
	POSCAC					ENDP

	POSCTIIN				PROC	; Posiciona o cursor na posicao correta para se escrever a quantidade de tiros do inimigo
		PUSH DX
		PUSH AX
		MOV DH, 10					; Linha
		MOV DL, 72					; Coluna
		CALL POSCURSOR
		POP AX
		POP DX
		RET
	POSCTIIN				ENDP

	POSCACIN				PROC	; Posiciona o cursor na posicao correta para se escrever a quantidade de acertos do inimigo
		PUSH DX
		PUSH AX
		MOV DH, 11					; Linha
		MOV DL, 72					; Coluna
		CALL POSCURSOR
		POP AX
		POP DX
		RET
	POSCACIN				ENDP

	ESC_CARAC				PROC	; Escreve um caractere na saida padrao.
		PUSH AX
		MOV AH, 2h					; 02 - Imprimir um caracter na saida padrao
		INT 21h						; Habilita a IRQ 21 (DOS)
		POP AX
		RET
	ESC_CARAC				ENDP

	ESC_STRING_ALT			PROC	; Implementacao alternativa ao metodo para escrever string - Sera usado para poder escrever caracteres coloridos
		PUSH CX
		PUSH DX
		PUSH BX
		PUSH AX
		XOR CX, CX
		XOR BX, BX
		XOR AX, AX
		XOR DX, DX
		MOV BX, OFFSET m_barc_in
		MOV DL, 0
		CMP CX, 1
	ESC_CARAC_S:
		MOV AL, DL
		XLAT m_barc_in
		INC DL
		CMP AL, "$"
		JE FIM_STRING
		CMP AL, "O"
		JE ESC_O_COL
		CMP AL, "X"
		JE ESC_X_COL
		MOV CL, DL
		MOV DL, AL
		MOV AL, CL
		CALL ESC_CARAC
		MOV CL, DL
		MOV DL, AL
		MOV AL, CL
		MOV CX, 2
		JMP LOOP_STRING
	ESC_X_COL:
		MOV CL, DL
		MOV DL, AL
		MOV AL, CL
		CALL ESC_CARAC
		MOV CL, DL
		MOV DL, AL
		MOV AL, CL
		MOV CX, 2
		JMP LOOP_STRING
	ESC_O_COL:
		MOV CL, DL
		MOV DL, AL
		MOV AL, CL
		CALL ESC_CARAC
		MOV CL, DL
		MOV DL, AL
		MOV AL, CL
		MOV CX, 2
		JMP LOOP_STRING
	FIM_STRING:
		MOV CX, 1
	LOOP_STRING:
		LOOP ESC_CARAC_S
		POP BX
		POP DX
		POP CX
		RET
	ESC_STRING_ALT			ENDP

	ESC_STRING				PROC	; Escreve uma string na saida padrao
		PUSH DX
		MOV DX, OFFSET AX			; DX possui o offset do array a ser escrito
		PUSH AX
		MOV AH, 09h					; 09 - Imprimir a string em DS:DX
		INT 21h						; Habilita a IRQ 21 (DOS)
		POP AX
		POP DX
		RET
	ESC_STRING				ENDP

	ESC_NNAV				PROC	; Escreve o nome do navio a ser configurado na tela
		PUSH AX
		CALL POSCNAV				; Antes de escrever, posiciona o cursor na linha correta
		CMP CX, 5					; Caso seja o primeiro, e um Porta-Avioes (5, A)
		JE PORT
		CMP CX, 4					; Caso seja o segundo, e um Navio de Guerra (4, B)
		JE NAVG
		CMP CX, 3					; Caso seja o terceiro, e um Submarino (3, S)
		JE SUBM
		CMP CX, 2					; Caso seja o quarto, e um Destroyer (3, D)
		JE DEST
		CMP CX, 1					; Caso seja o quinto, e um Navio Patrulha (2, P)
		JE PAT
	PORT:
		MOV AX, OFFSET port_av
		MOV DH, 5
		MOV BH, "A"
		JMP ESCREVE
	NAVG:
		MOV AX, OFFSET nav_gue
		MOV DH, 4
		MOV BH, "B"
		JMP ESCREVE
	SUBM:
		MOV AX, OFFSET submari
		MOV DH, 3
		MOV BH, "S"
		JMP ESCREVE
	DEST:
		MOV AX, OFFSET destroy
		MOV DH, 3
		MOV BH, "D"
		JMP ESCREVE
	PAT:
		MOV AX, OFFSET barcopa
		MOV DH, 2
		MOV BH, "P"
	ESCREVE:
		CALL ESC_STRING
		POP AX
		RET
	ESC_NNAV				ENDP

	ESC_CFG					PROC	; Escreve a tela de configuracoes
		PUSH AX
		MOV AX, OFFSET cfg
		CALL ESC_STRING
		POP AX
		RET
	ESC_CFG					ENDP

	ESC_TELA				PROC	; Escreve a tela principal
		PUSH AX
		MOV AX, OFFSET tela
		CALL ESC_STRING
		POP AX
		RET
	ESC_TELA				ENDP

	ESC_MERR				PROC	; Escreve a mensagem de coordenada invalida e posiciona o cursor
		PUSH AX
		CMP CX, 10
		JE ERRO_POS_BCO
		MOV AX, OFFSET msgErroCoor
		JMP CONT_ERRO
	ERRO_POS_BCO:
		MOV AX, OFFSET msgErroBarc
	CONT_ERRO:
		CALL ESC_STRING
		CALL POSCCFG
		POP AX
		RET
	ESC_MERR				ENDP

	ESC_MERR_T				PROC	; Escreve a mensagem de coordenada de tiro invalida e posiciona o cursor
		PUSH AX
		MOV AX, OFFSET msgErroCoorT
		CALL POSCTELAERR
		CALL ESC_STRING
		CALL POSCTELA
		POP AX
		RET
	ESC_MERR_T				ENDP

	ESC_FIM_JOGO			PROC	; Escreve a mensagem de fim de jogo e posiciona o cursor
		PUSH AX
		MOV AX, OFFSET msgFimJogo
		CALL POSCTELAERR
		CALL ESC_STRING
		CALL POSCTELA
		POP AX
		RET
	ESC_FIM_JOGO			ENDP

	ESC_NUM					PROC	; Escreve o numero contido em AX
		PUSH CX
		PUSH DX
		PUSH BX
		MOV CX, 10d
		DIV CX						; Divide o numero pelo que esta em CX - O quociente fica em AX e o resto em DX
		MOV CX, DX
		MOV DX, AX
		ADD DL, 48d					; Adiciona o valor em ASCII referente ao '0' para escrever o caractere correto
		CALL ESC_CARAC
		MOV DL, CL
		ADD DL, 48d					; Adiciona o valor em ASCII referente ao '0' para escrever o caractere correto
		CALL ESC_CARAC
		POP BX
		POP DX
		POP CX
		RET
	ESC_NUM					ENDP

	ESC_PLACAR				PROC	; Escreve os dados do placar na tela
		PUSH AX
		PUSH BX
		PUSH CX
		PUSH DX
		CALL POSCAC
		XOR AX, AX
		XOR BX, BX
		XOR CX, CX
		XOR DX, DX
		MOV AL, [acert_qtde]
		CALL ESC_NUM
		CALL POSCTIIN
		XOR AX, AX
		XOR BX, BX
		XOR CX, CX
		XOR DX, DX
		MOV AL, [tirin_qtde]
		CALL ESC_NUM
		CALL POSCTI
		XOR AX, AX
		XOR BX, BX
		XOR CX, CX
		XOR DX, DX
		MOV AL, [tiros_qtde]
		CALL ESC_NUM
		CALL POSCACIN
		XOR AX, AX
		XOR BX, BX
		XOR CX, CX
		XOR DX, DX
		MOV AL, [acein_qtde]
		CALL ESC_NUM
		POP DX
		POP CX
		POP BX
		POP AX
		RET
	ESC_PLACAR				ENDP

	VER_FIM					PROC	; Verifica se e o fim do jogo
		PUSH AX
		MOV AL, [acert_qtde]
		CMP AL, 17d					; Compara o valor de acertos com 17 - Caso o valor seja igual ou maior, o jogador ja acertou todos os barcos
		JGE FIM_JOGO
		JMP CONT_JOGO
	FIM_JOGO:
		MOV CX, 1
	CONT_JOGO:
		POP AX
		RET
	VER_FIM					ENDP

	VER_FIM_IN				PROC	; Verifica se o inimigo terminou o jogo
		PUSH AX
		MOV AL, [acein_qtde]
		CMP AL, 17d					; Compara o valor de acertos com 17 - Caso o valor seja igual ou maior, o jogador ja acertou todos os barcos
		JGE FIM_JOGO_IN
		JMP CONT_JOGO_IN
	FIM_JOGO_IN:
		MOV CX, 1
	CONT_JOGO_IN:
		POP AX
		RET
	VER_FIM_IN				ENDP

	LE_TIROS				PROC	; Le as coordenadas de tiros dos jogadores ate que um deles ganhe a partida
		PUSH CX
		MOV CX, 10000
	LETIRO:
		CALL LE_TIRO				; Le o tiro
		CALL LIMPATELA				; Limpa a tela
		CALL POS_BAR_TELA			; Posiciona os barcos na tela
		CALL ESC_TELA				; Escreve a tela
		CALL ESC_PLACAR				; Escreve o placar
		CALL VER_FIM				; Verifica se o jogador ganhou o jogo
		CMP CX, 1
		JE VENC
		CALL LE_TIRO_IN				; Le o tiro
		CALL LIMPATELA				; Limpa a tela
		CALL POS_BAR_TELA			; Posiciona os barcos na tela
		CALL ESC_TELA				; Escreve a tela
		CALL ESC_PLACAR				; Escreve o placar
		CALL VER_FIM_IN				; Verifica se o jogador ganhou o jogo
	VENC:
		LOOP LETIRO
		CALL ESC_FIM_JOGO			; Escreve a mensagem de fim de jogo
		POP CX
		RET
	LE_TIROS				ENDP

	LE_TIRO					PROC	; Le as coordenadas de um tiro
		PUSH CX
		MOV CX, 2
		CALL POSCTELA				; Posiciona o cursor na posicao correta para leitura
	LEPOST:
		CALL LE_COOR_T				; Le uma das coordenadas
		CALL POS_TLI_TELA
		LOOP LEPOST
		POP CX
		RET
	LE_TIRO					ENDP

	LE_TIRO_IN				PROC	; Le as coordenadas de um tiro do inimigo
		PUSH CX
		MOV CX, 2
		CALL POSCTELA				; Posiciona o cursor na posicao correta para leitura
	LEPOSTIN:
		CALL LE_COOR_TIN
		CALL POS_BAR_TELA
		LOOP LEPOSTIN
		POP CX
		RET
	LE_TIRO_IN				ENDP

	LE_COOR_T				PROC	; Le uma coordenada digitada pelo usuario
		PUSH AX
		MOV AH, 01h					; 01 - Le um caractere da entrada padrao com echo, armazena em AL
		INT 21h						; Habilita a IRQ 21 (DOS)
		MOV DL, AL					; DL possui o caractere lido
		CALL VALIDA_COOR_T			; Valida a coordenada
		CMP CX, 3
		JE FIM_LE_COOR_T
		CMP CX, 2
		JE FIM_LE_COOR_T
		CALL VER_ACERT
	FIM_LE_COOR_T:
		POP AX
		RET
	LE_COOR_T				ENDP

	LE_COOR_TIN				PROC	; Le uma coordenada digitada pelo inimigo
		PUSH AX
		MOV AH, 01h					; 01 - Le um caractere da entrada padrao com echo, armazena em AL
		INT 21h						; Habilita a IRQ 21 (DOS)
		MOV DL, AL					; DL possui o caractere lido
		CALL VALIDA_COOR_T
		CMP CX, 3
		JE FIM_LE_COOR_TIN
		CMP CX, 2
		JE FIM_LE_COOR_TIN
		CALL VER_ACERTIN
	FIM_LE_COOR_TIN:
		POP AX
		RET
	LE_COOR_TIN				ENDP

	VALIDA_COOR_T			PROC	; Valida a coordenada de um tiro
		CMP DL, "0"					; Se for menor que o ascii "0" gera erro
		JL ERROVALT
		CMP DL, "9"					; Se for maior que o ascii "9" gera erro
		JG ERROVALT
		CMP CX, 2
		JE PRIM_NUMT
		CMP CX, 1
		JE SEGU_NUMT
	PRIM_NUMT:
		MOV BH, DL
		JMP FVALCHART
	SEGU_NUMT:
		MOV BL, DL
		JMP FVALCHART
	ERROVALT:
		CALL ESC_MERR_T
		MOV CX, 3					; MOVe 4 para o contador CX pois ir?ecrementar 1 no LOOP, mas precisa ler os 3 caracteres novamente
		JMP FVALCHAR
	FVALCHART:
		RET
	VALIDA_COOR_T			ENDP

	VER_ACERT				PROC	; Verifica se voce acertou o tiro
		XOR AX, AX
		XOR DX, DX
		MOV AL, 10
		MUL BH						; Multiplica A linha pelo tamanho da linha (5)
		ADD AL, BL					; Soma o resultado com a coluna para obter o deslocamento
		SUB AL, 16d
		MOV DL, AL
		MOV BX, OFFSET m_barc_in	; BX recebe o inicio do array
		XLAT m_barc_in				; Armazena o valor da posicao requerida em AL
		CMP AL, 254
		JE ERROU
		CMP AL, 79
		JE ERROU
		CMP AL, 88
		JE ERROU
		MOV BX, DX
		MOV m_tiros[BX], 79
		CALL INC_TIR
		CALL INC_ACERT
		JMP FIM_VER
	ERROU:
		CMP AL, 79
		JE JA_ACERT
		MOV BX, DX
		MOV m_tiros[BX], 88
	JA_ACERT:
		CALL INC_TIR
	FIM_VER:
		RET
	VER_ACERT				ENDP

	INC_ACERT				PROC	; Incrementa o contador de acertos
		PUSH AX
		PUSH BX
		PUSH DX
		PUSH CX
		MOV AL, [acert_qtde]
		ADD AL, 1d
		MOV BX, 0
		MOV acert_qtde[BX], AL
		POP CX
		POP DX
		POP BX
		POP AX
		RET
	INC_ACERT				ENDP

	INC_TIR					PROC	; Incrementa o contador de tiros
		PUSH AX
		PUSH BX
		PUSH DX
		PUSH CX
		MOV AL, [tiros_qtde]
		ADD AL, 1d
		MOV BX, 0
		MOV tiros_qtde[BX], AL
		POP CX
		POP DX
		POP BX
		POP AX
		RET
	INC_TIR					ENDP

	VER_ACERTIN				PROC	; Verifica se o inimigo acertou o tiro
		XOR AX, AX
		XOR DX, DX
		MOV AL, 10
		MUL BH						; Multiplica A linha pelo tamanho da linha (5)
		ADD AL, BL					; Soma o resultado com a coluna para obter o deslocamento
		SUB AL, 16d
		MOV DL, AL
		MOV BX, OFFSET m_barc		; BX recebe o inicio do array
		XLAT m_barc					; Armazena o valor da posicao requerida em AL
		CMP AL, 32
		JE ERROUIN
		CMP AL, 79
		JE ERROUIN
		CMP AL, 88
		JE ERROUIN
		MOV BX, DX
		MOV m_barc[BX], 79
		CALL INC_TIRIN
		CALL INC_ACERTIN
		JMP FIM_VERIN
	ERROUIN:
		CMP AL, 79
		JE JA_ACERTIN
		MOV BX, DX
		MOV m_barc[BX], 88
	JA_ACERTIN:
		CALL INC_TIRIN
	FIM_VERIN:
		RET
	VER_ACERTIN				ENDP

	INC_ACERTIN				PROC	; Incrementa o contador de acertos do inimigo
		PUSH AX
		PUSH BX
		PUSH DX
		PUSH CX
		MOV AL, [acein_qtde]
		ADD AL, 1d
		MOV BX, 0
		MOV acein_qtde[BX], AL
		POP CX
		POP DX
		POP BX
		POP AX
		RET
	INC_ACERTIN				ENDP

	INC_TIRIN				PROC	; Incrementa o contador de tiros do inimigo
		PUSH AX
		PUSH BX
		PUSH DX
		PUSH CX
		MOV AL, [tirin_qtde]
		ADD AL, 1d
		MOV BX, 0
		MOV tirin_qtde[BX], AL
		POP CX
		POP DX
		POP BX
		POP AX
		RET
	INC_TIRIN				ENDP

	LE_BARCOS				PROC	; Le as coordenadas dos 5 barcos a serem posicionados
		PUSH CX
		MOV CX, 5					; Quantidade de barcos a terem suas coordenadas lidas
	LECOORDS:
		CALL ESC_NNAV				; Escreve o nome do navio atual
		CALL LE_BAR_COO				; Le as coordenadas do barco
		CALL LIMPATELA				; Limpa a tela
		CALL POS_BAR_CFG
		CALL ESC_CFG				; Escreve a tela de configuracoes
		LOOP LECOORDS
		POP CX
		RET
	LE_BARCOS				ENDP

	LE_BAR_COO				PROC	; Le as 3 coordenadas de um barco
		PUSH CX
		MOV CX, 3
		CALL POSCCFG				; Posiciona o cursor na posicao correta para leitura
		MOV AH, BH					; AH possui a letra equivalente ao barco atual
	LEPOS:
		CALL LE_COOR				; Le uma das coordenadas
		LOOP LEPOS
		POP CX
		RET
	LE_BAR_COO				ENDP

	LE_COOR					PROC	; Le uma coordenada digitada pelo usuario
		PUSH AX
		MOV AH, 01h					; 01 - Le um caractere da entrada padrao com echo, armazena em AL
		INT 21h						; Habilita a IRQ 21 (DOS)
		MOV DL, AL					; DL possui o caractere lido
		CALL VALIDA_COOR
		CMP CX, 1
		JE VER
		POP AX
		JMP FLE_COOR
	VER:
		POP AX
		CALL VER_COOR
	FLE_COOR:
		RET
	LE_COOR					ENDP

	VALIDA_COOR				PROC	; Valida os dados dados como coordenada de um barco
		CMP CX, 1					; Se for a ultima leitura, valida a direcao
		JE VALCHAR
		CMP DL, "0"					; Se for menor que o ascii "0" gera erro
		JL ERROVAL
		CMP DL, "9"					; Se for maior que o ascii "9" gera erro
		JG ERROVAL
		CMP CX, 3
		JE PRIM_NUM
		CMP CX, 2
		JE SEGU_NUM
	PRIM_NUM:
		MOV BH, DL
		JMP FVALCHAR
	SEGU_NUM:
		MOV BL, DL
		JMP FVALCHAR
	VALCHAR:
		CMP DL, 'H'					; Valida H e h. Se encontrar, pula diRETamente para o RET
		JE VAL_H
		CMP DL, 'h'
		JE VAL_H
		CMP DL, 'V'					; Valida V e v. Se encontrar, pula diRETamente para o RET
		JE VAL_V
		CMP DL, 'v'
		JE VAL_V
		JMP ERROVAL
	ERROVAL:
		CALL ESC_MERR
		MOV CX, 4					; MOVe 4 para o contador CX pois ir?ecrementar 1 no LOOP, mas precisa ler os 3 caracteres novamente
		JMP FVALCHAR
	VAL_H:
		MOV DL, 'H'
		JMP FVALCHAR
	VAL_V:
		MOV DL, 'V'
		JMP FVALCHAR
	FVALCHAR:
		RET
	VALIDA_COOR				ENDP

	VER_COOR				PROC	; Verifica se o barco pode ser colocado na coordenada informada
		CMP DL, 'H'
		JE VALIDA_H
		CMP DL, 'V'
		JE VALIDA_V
		JMP ERRO
	VALIDA_H:
		MOV CL, BL
		ADD BL, DH
		CMP BL, 58
		JLE GVALH
		JMP ERRO
	VALIDA_V:
		MOV CL, BH
		ADD BH, DH
		CMP BH, 58
		JLE GVALV
		JMP ERRO
	GVALH:
		MOV BL, CL
		CALL GRAVA_H
		CMP CX, 10					; compara CX com 10, que e apenas um indicador de que existe barco na posicao informada
		JE ERRO
		MOV CX, 1
		JMP FIM
	GVALV:
		MOV BH, CL
		CALL GRAVA_V
		CMP CX, 10					; compara CX com 10, que e apenas um indicador de que existe barco na posicao informada
		JE ERRO
		MOV CX, 1
		JMP FIM
	ERRO:
		CALL ESC_MERR
		MOV CX, 4					; MOVe 4 para o contador CX pois ir?ecrementar 1 no LOOP, mas precisa ler os 3 caracteres novamente
	FIM:
		RET
	VER_COOR				ENDP

	GRAVA_H					PROC	; Grava um barco em m_barc na horizontal
		PUSH CX
		PUSH AX
		MOV AL, 10
		MUL BH
		ADD BL, AL					; Soma o resultado com a coluna para obter o deslocamento -> BL = Y, AL = X*10
		XOR BH, BH					; Zera a parte alta para poder usar o BX no MOV
		SUB BX, 16
		XOR CX, CX					; limpa CX
		MOV CL, DH					; move o tamanho do barco para CL
		MOV AL, BL					; move a posicao inicial do barco para AL
		PUSH BX
		PUSH DX
		MOV DL, AL					; move a posicao inicial do barco para DL, que será incrementado para verificar a proxima posicao
		MOV BX, OFFSET m_barc		; coloca em BX a posicao inical do vetor
	VALIDA_POSH:					; loop que valida se nao tem barcos nas coordenadas informadas
		MOV AL, DL					; coloca a posicao inicial do barco em AL. AL nao e incrementado no loop pois seu novo valor contem o retorno do XLAT
		XLAT m_barc					; busca o conteudo da posicao e joga em AL
		INC DL						; incrementa DL para ir para a proxima coluna
		CMP AL, 32					; compara com ASCII(32) = espaco em branco
		JNE ERRO_VAL_H				; se ja tiver conteudo, aborta o processo
		LOOP VALIDA_POSH
		POP DX
		POP BX						; desempilha BX, que contem a posicao em que o barco deve ser colocado
		XOR CX, CX					; limpa CX
		MOV CL, DH					; move o tamanho do barco para CL
		POP AX						; desempilha AX, pois AH contem a letra do barco a ser inserido
	LOOP_H:
		MOV m_barc[BX], AH
		INC BL
		LOOP LOOP_H
		POP CX
		RET
	ERRO_VAL_H:
		POP DX
		POP BX
		POP AX
		POP CX
		MOV CX, 10					; move 10 para CX, apenas para ter um valor controlador de que existe barco na posicao
		RET
	GRAVA_H					ENDP

	GRAVA_V					PROC	; Grava um barco em m_barc na vertical
		PUSH CX
		PUSH AX
		XOR CX, CX
		MOV CL, DH
		MOV AL, 10
		MUL BH
		ADD BL, AL					; Soma o resultado com a coluna para obter o deslocamento
		XOR BH, BH					; Zera a parte alta para poder usar o BX no MOV
		SUB BX, 16
		XOR CX, CX					; limpa CX
		MOV CL, DH					; move o tamanho do barco para CL
		MOV AL, BL					; move a posicao inicial do barco para AL
		PUSH BX
		PUSH DX
		MOV DL, AL					; move a posicao inicial do barco para DL, que será incrementado para verificar a proxima posicao
		MOV BX, OFFSET m_barc		; coloca em BX a posicao inical do vetor
	VALIDA_POSV:					; loop que valida se nao tem barcos nas coordenadas informadas
		MOV AL, DL					; coloca a posicao inicial do barco em AL. AL nao e incrementado no loop pois seu novo valor contem o retorno do XLAT
		XLAT m_barc					; busca o conteudo da posicao e joga em AL
		ADD DL, 10					; soma 10 para pular para a proxima linha
		CMP AL, 32					; compara com ASCII(32) = espaco em branco
		JNE ERRO_VAL_V				; se ja tiver conteudo, aborta o processo
		LOOP VALIDA_POSV
		POP DX
		POP BX						; desempilha BX, que contem a posicao em que o barco deve ser colocado
		XOR CX, CX					; limpa CX
		MOV CL, DH					; move o tamanho do barco para CL
		POP AX						; desempilha AX, pois AH contem a letra do barco a ser inserido
	LOOP_V:
		MOV m_barc[BX], AH
		ADD BL, 10
		LOOP LOOP_V
		POP CX
		RET
	ERRO_VAL_V:
		POP DX
		POP BX
		POP AX
		POP CX
		MOV CX, 10					; move 10 para CX, apenas para ter um valor controlador de que existe barco na posicao
		RET
	GRAVA_V					ENDP

	POS_BAR_CFG				PROC	; Posiciona os barcos do array na tela de configuracoes
		PUSH AX
		PUSH BX
		PUSH CX
		PUSH DX
		XOR DX, DX
		XOR AX, AX
		MOV DL, 0					; Primeira posicao da matriz m_barc
		MOV BX, 220					; Inicializa o deslocamento com 220 (Inicio da primeira linha a ser editada)
		MOV CX, 10					; Quantidade de linhas em m_barc
	IT_LINHA:
		ADD BX, 31					; Deslocamento para a primeira posicao a ser escrita
		CALL POS_BCO				; Itera por todas as colunas de cada linha
		LOOP IT_LINHA
		POP DX
		POP CX
		POP BX
		POP AX
		RET
	POS_BAR_CFG				ENDP

	POS_BAR_TELA			PROC	; Posiciona os barcos do array na tela de configuracoes
		PUSH AX
		PUSH BX
		PUSH CX
		PUSH DX
		XOR DX, DX
		XOR AX, AX
		MOV DL, 0					; Primeira posicao da matriz m_barc
		MOV BX, 312					; Inicializa o deslocamento com 220 (Inicio da primeira linha a ser editada)
		MOV CX, 10					; Quantidade de linhas em m_barc
	IT_LINHA_TELA:
		ADD BX, 31					; Deslocamento para a primeira posicao a ser escrita
		CALL POS_BCO_TELA			; Itera por todas as colunas de cada linha
		LOOP IT_LINHA_TELA
		POP DX
		POP CX
		POP BX
		POP AX
		RET
	POS_BAR_TELA			ENDP

	POS_BCO_TELA			PROC	; Itera pelas colunas de uma linha de m_barc, lendo o valor e gravando na tela de configuracao
		PUSH CX
		MOV CX, 10					; Quantidade de colunas em m_barc
	IT_COL_TELA:
		CALL GR_BT
		MOV tela[BX], DH			; Grava o valor de DH na matriz
		ADD BX, 2					; Incrementa o deslocamento
		INC DL						; Incrementa a posicao de m_barc
		LOOP IT_COL_TELA
		ADD BX, 27					; Incrementa o deslocamento com os caracteres para se chegar no fim da linha
		POP CX
		RET
	POS_BCO_TELA			ENDP

	POS_BCO					PROC	; Itera pelas colunas de uma linha de m_barc, lendo o valor e gravando na tela de configuracao
		PUSH CX
		MOV CX, 10					; Quantidade de colunas em m_barc
	IT_COL:
		CALL GR_BT
		MOV cfg[BX], DH				; Grava o valor de DH na matriz
		ADD BX, 2					; Incrementa o deslocamento
		INC DL						; Incrementa a posicao de m_barc
		LOOP IT_COL
		ADD BX, 4					; Incrementa o deslocamento com os caracteres para se chegar no fim da linha
		POP CX
		RET
	POS_BCO					ENDP

	GR_BT					PROC	; Le o valor de uma posicao do m_barc
		PUSH BX
		PUSH AX
		MOV BX, OFFSET m_barc		; BX recebe o inicio do array
		MOV AL, DL					; AL recebe a posicao a ser acessada
		XLAT m_barc					; Armazena o valor da posicao requerida em AL
		MOV DH, AL					; Passa o valor para DH
		POP AX
		POP BX
		RET
	GR_BT					ENDP

	POS_TLI_TELA			PROC	; Posiciona os barcos do array na tela de configuracoes
		PUSH AX
		PUSH BX
		PUSH CX
		PUSH DX
		XOR DX, DX
		XOR AX, AX
		MOV DL, 0					; Primeira posicao da matriz m_barc
		MOV BX, 312					; Inicializa o deslocamento com 312 (Inicio da primeira linha a ser editada)
		MOV CX, 10					; Quantidade de linhas em m_barc
	IT_LINHA_TELAT:
		ADD BX, 4					; Deslocamento para a primeira posicao a ser escrita
		CALL POS_TCO_TELA			; Itera por todas as colunas de cada linha
		LOOP IT_LINHA_TELAT
		POP DX
		POP CX
		POP BX
		POP AX
		RET
	POS_TLI_TELA			ENDP

	POS_TCO_TELA			PROC	; Itera pelas colunas de uma linha de m_barc, lendo o valor e gravando na tela de configuracao
		PUSH CX
		MOV CX, 10					; Quantidade de colunas em m_barc
	IT_COL_TELAT:
		CALL GR_BTT
		MOV tela[BX], DH			; Grava o valor de DH na matriz
		ADD BX, 2					; Incrementa o deslocamento
		INC DL						; Incrementa a posicao de m_barc
		LOOP IT_COL_TELAT
		ADD BX, 54					; Incrementa o deslocamento com os caracteres para se chegar no fim da linha
		POP CX
		RET
	POS_TCO_TELA			ENDP

	GR_BTT					PROC	; Le o valor de uma posicao do m_barc
		PUSH BX
		PUSH AX
		MOV BX, OFFSET m_tiros		; BX recebe o inicio do array
		MOV AL, DL					; AL recebe a posicao a ser acessada
		XLAT m_tiros				; Armazena o valor da posicao requerida em AL
		MOV DH, AL					; Passa o valor para DH
		POP AX
		POP BX
		RET
	GR_BTT					ENDP

PROGRAMA:
	CALL INICIAR

	XOR AX, AX
	XOR BX, BX
	XOR CX, CX
	XOR DX, DX

	; Configuracao
	CALL LIMPATELA					; Limpa a tela
	CALL ESC_CFG					; Escreve a tela de configuracoes
	CALL POSCCFG					; Posiciona o cursor
	CALL LE_BARCOS					; Le as coordenadas dos 5 barcos

	;Debug
	CALL POS_BAR_CFG				; Posiciona os barcos
	CALL ESC_CFG					; Escreve a tela de configuracao
	CALL LIMPATELA					; Limpa a tela
	CALL POS_BAR_TELA				; Posiciona os barcos na tela
	CALL POS_TLI_TELA				; Posiciona os barcos do inimigo na tela
	CALL ESC_TELA					; Escreve a tela

	;Jogo
	CALL LE_TIROS					; Comeca a ler os tiros

	CALL ENCERRAR
END PROGRAMA
