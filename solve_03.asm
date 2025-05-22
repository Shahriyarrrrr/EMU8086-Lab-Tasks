.model small
.stack 100h

.data
    msg1              db "Enter a hexadecimal character: $"
    msg_result_header db 10,13,"Modified character: $"
    msg3              db 10,13,"Invalid hexadecimal character$"
    num               db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah,9
    lea dx, msg1
    int 21h

    mov ah,1
    int 21h
    mov num, al

    mov al, num

    cmp al, '0'
    jl not_letter
    cmp al, '9'
    jle valid_hex_char

    cmp al, 'A'
    jl not_letter
    cmp al, 'F'
    jle valid_hex_char

    cmp al, 'a'
    jl not_letter
    cmp al, 'f'
    jle valid_hex_char

    jmp not_letter

valid_hex_char:
    mov ah,9
    lea dx, msg_result_header
    int 21h

    mov bl, num
    and bl, 0F0h
    jmp conv

conv:
    mov ah,2
    mov dl,bl
    int 21h
    jmp exit

not_letter:
    mov ah,9
    lea dx, msg3
    int 21h

exit:
    mov ah,4ch
    int 21h

main endp
end main



