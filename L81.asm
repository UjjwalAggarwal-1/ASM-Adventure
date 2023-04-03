.model tiny
.data
    name1 db "Ujjwal Aggarwal",0
    start1 dw ?
.code
.startup

    mov ah, 0
    mov al, 03h
    int 10h
    
    lea si, name1
    cmp byte ptr[si], 0
    jz endProg

    dec si
    mov start1, si
    
    findEnd:
    inc si
    cmp byte ptr[si], 0
    jne findEnd
    dec si

    mov dh, 00
    mov dl, 00
    mov bh, 00
    mov bl, 00000101b
    mov cx, 1
    printOutChar:
    mov ah, 02h
    int 10h
    mov ah, 09h
    mov al, [si]
    int 10h
    inc dh
    inc dl
    dec si
    cmp si, start1
    jnz printOutChar

    mov ah, 07
    persist: int 21h
    cmp al, "x"
    jnz persist

    endProg:

.exit
end