.model tiny
.data
    ques1 db 'Enter your name:$'
    max1 db 30
    act1 db ?
    inp1 db 30 dup(?)
    file db 'myName.txt',0
.code
.startup
    lea dx, ques1
    mov ah, 9
    int 33
    lea dx, max1
    mov ah, 10
    int 33
    mov ah, 3ch
    lea dx, file
    mov cl, 0
    int 33
    mov bx, ax
    mov ah, 40h
    mov cl, act1
    mov ch, 0
    lea dx, inp1
    int 33
    mov ah, 3eh
    int 33
.exit
end