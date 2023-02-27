.model tiny
.data
op1 db 'The character entered is a $'
op2 db 'not a $'
nl dw 0ah
.code
.startup
    lea bx, op1
    mov ah, 08h
    int 21h
    cmp al, 61h
    je x1
    cmp al, 41h
    je x1
    lea dx, op2
    jmp x2
    x1:
    lea dx, op1
    x2:
    mov ah, 9h
    int 21h
    mov dx, nl; or 'dl' for 'db'
    mov ah, 2h
    int 21h 
    MOV dl, 13 ;13d(odh) for CR
    MOV ah, 02h
    INT 21h
.exit
end