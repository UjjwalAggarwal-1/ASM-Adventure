.model tiny
.data
    f0 db 0
    f1 db 1
    count1 db 7
.code
.startup

    mov ah, 0
    mov al, 03h
    int 10h

    ; mov ah, 01h
    ; mov ch, 126
    ; mov cl, 7
    ; int 10h

    ConstantForTheDeed:
    mov dl,0
    mov dh, 0
    mov bh, 0
    mov bl, 00000101b
    mov ch, 0

    doTheDeed:
    mov al, f1
    add al, f0
    mov ah, f1
    mov f0, ah
    mov f1, al

    mov ah, 02
    int 10h

    mov cl, al
    add al, 40h
    mov ah, 09h
    int 10h

    inc dh

    dec byte ptr[count1] 
    jnz doTheDeed

    mov ah, 07
    persist: int 21h
    cmp al, "x"
    jnz persist
    
    endProg:

.exit
end