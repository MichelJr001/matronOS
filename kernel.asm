; @author: Michel Anderson
; @github: MichelJr001

[BITS 64] ; Define a arquitetura do processador
[ORG 0x7C00]

mov ah, 2 ; Comando para ler o disco que originou o boot
mov al, 1 ; Total de setores lidos
mov ch, 0 ; Numero do cilindro
mov cl, 2 ; Numero do setor para começar a ler
mov dh, 1 ; Numero da cabeça a ser lida
mov es, [main]
mov bx, 0
int 13h
jmp main ; Executar a função main


; ---------------- Funções do sistema -----------------

main:
    header: db "---MatronOS---", 13, 10, 0
    xor ax, ax ; Melhora a performace do codigo
    mov si, header
    jmp escrever
escrever:
    lodsb
    or al, al ; Checa se o valor é zero
    jz loop_str; Se for zero execute a função loop_str
    mov ah, 0x0E
    int 0x10
    jmp escrever ; Executa a função escrever
loop_str:
    jmp loop_str

times 510 - ($-$$) db 0
dw 0xAA55

