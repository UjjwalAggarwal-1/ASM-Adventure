.model tiny
.data
    max1 db 48 ; includes 0dh(CR)
    act1 db ? ; not includes 0dh(CR)
    inp1 db 48 dup(?)
.code
.startup

    lea bx, max1
    lea bx, act1
    lea bx, inp1
    ; input
    lea dx, max1
    mov ah, 0ah
    int 21h
    ; output
    lea bx, act1
    mov cl, [bx]
    ; char by char
    mov ah, 02h
    inc bx ; or use lea bx, inp1
    x2:
    mov dl, [bx]
    sub dx, 20h
    int 21h
    inc bx
    dec cx
    jcxz x1
    jmp x2
    x1:
    ; new line
    mov dx, 0ah; or 'dl' for 'db'
    mov ah, 2h
    int 21h 
    MOV dl, 13 ;13d(0dh) for CR
    MOV ah, 02h
    INT 21h

.exit
end
