.model tiny
.data

    file1 db 'name.txt', 0
    file2 db 'id.txt', 0
    file3 db 'splice.txt', 0
    
    handle1 dw ?
    handle2 dw ? 
    handle3 dw ? 

    inp1statement db 'enter your name: $'
    inp2statement db 'enter your id: $'

    inp1max db 7h
    actinp1 db ?
    inp1 db 7 dup(?) ; if i keep this 6, it is not ok

    inp2max db 14
    actinp2 db ?
    inp2 db 14 dup(?)

.code
.startup

    ; create file1
    mov ah, 03ch
    lea dx, file1
    mov cl, 00h
    int 21h
    mov handle1, ax

    ;create file2
    mov ah, 03ch
    lea dx, file2
    mov cl, 00h
    int 21h
    mov handle2, ax

    ; ask first input statement
    lea dx, inp1statement
    mov ah, 09h
    int 21h

    ; take input1
    lea dx, inp1max
    mov ah, 0ah
    int 21h

    ;; new line
    mov dx, 0ah ; or 'dl' for 'db'
    mov ah, 2h
    int 21h 
    MOV dl, 13 ;13d(0dh) for CR
    MOV ah, 02h
    INT 21h

    ; ask second input satement
    lea dx, inp2statement
    mov ah, 09h
    int 21h

    ; take input2
    lea dx, inp2max
    mov ah, 0ah
    int 21h

    ; new line
    mov dx, 0ah ; or 'dl' for 'db'
    mov ah, 2h
    int 21h 
    MOV dl, 13 ;13d(0dh) for CR
    MOV ah, 02h
    INT 21h

    ;open file1
    ; mov ah, 3dh
    ; mov al, 1
    ; mov dx, offset file1
    ; mov handle1, ax

    ; now we write data to file1 and file2 and close them
    mov ah, 40h
    mov bx, handle1
    mov cl, actinp1
    mov dx, offset inp1
    int 21h
    ;close
    mov ah, 3eh
    int 21h

    mov ah, 40h
    mov bx, handle2
    mov cl, actinp2
    mov dx, offset inp2
    int 21h
    ;close
    mov ah, 3eh
    int 21h
    
    ;make the third file
    mov ah, 03ch
    lea dx, file3
    mov cl, 00h
    int 21h
    mov handle3, ax

    ; write to file3
    mov ah, 40h
    mov bx, handle3
    mov cl, actinp2
    mov ch, 00
    lea dx, inp2
    int 21h
    mov ah, 40h
    mov cl, actinp1
    lea dx, inp1
    int 21h
    ; close
    mov ah, 3eh
    int 21h

.exit
end