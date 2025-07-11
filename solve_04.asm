.model small
.stack 100h

.data
    msg1          db "Enter first character: $"
    prompt_char2  db 10,13,"Enter second character: $"
    msg2          db 10,13,"Equal$"
    msg3          db 10,13,"Not Equal$"
    char_store1   db ?
    char_store2   db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah,9
    lea dx, msg1
    int 21h
    mov ah,1
    int 21h
    mov char_store1, al

    mov ah,9
    lea dx, prompt_char2
    int 21h
    mov ah,1
    int 21h
    mov char_store2, al

    mov al, char_store1
    mov bl, char_store2
    xor al, bl

    jz are_equal

    mov ah,9
    lea dx, msg3
    int 21h
    jmp program_exit

are_equal:
    mov ah,9
    lea dx, msg2
    int 21h

program_exit:
    mov ah,4ch
    int 21h

main endp
end main
