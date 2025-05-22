.model small
.stack 100h

.data
    msg1         db "Enter char: $"
    msg2         db 10,13,"Changed to upper: $"
    msg3         db 10,13,"Not Letter$ "
    msg_to_lower db 10,13,"Changed to lower: $"
    msg_digit    db 10,13,"Converted letter: $"
    num          db ?

.code
  
  main proc
    mov ax, @data
    mov ds, ax

    mov ah,9
    lea dx,msg1
    int 21h

    mov ah,1
    int 21h
    mov num,al

    mov al, num

    cmp al, 'A'
    jl check_lowercase_path

    cmp al, 'Z'
    jg check_lowercase_path

    mov ah,9
    lea dx, msg_to_lower
    int 21h
    jmp upper
    
check_lowercase_path:
   
    cmp al, 'a'
    jl check_digit_path

    cmp al, 'z'
    jg check_digit_path

    mov ah,9
    lea dx, msg2
    int 21h
    mov bl, num
    and bl, 0DFh
    jmp conv

check_digit_path:
  
    cmp al, '0'
    jl not_letter

    cmp al, '9'
    jg not_letter

    mov ah,9
    lea dx, msg_digit
    int 21h
    mov bl, num
    jmp conv

upper:
   
    mov bl,num
    or bl,20h
    jmp conv

conv:
   
    mov ah,2
    mov dl,bl
    int 21h
    jmp exit

not_letter:
   
    mov ah,9
    lea dx,msg3
    int 21h

exit:
    mov ah,4ch
    int 21h

main endp
end main



