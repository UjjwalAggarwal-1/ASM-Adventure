.model tiny
.data
string1 db 'BITSIOTLAB'
string2 db 'IOT'
string1length db 0ah
string2length db 3h
star db 2ah

.code
.startup
    lea si, string1
    lea di, string2
    mov cl, string2length
    mov bx, 0
    cld
    dec si
    x1:
    inc si
    lea di, string2
    mov cl, string2length
    repe cmpsb
    cmp cx, bx
    jnz x1
    sub si, offset string1 ; why is si 7?
    ; to get index
    ; dec si ; not this 
    mov ah, 0
    mov al, string2length
    sub si, ax
    ; again going to the address of "I" in string1
    add si, offset string1
    mov al, star
    mov [si], al
 ; ab aage ke 2 character replace kar do
 ; ya null kar do 
 ; ya ek backspace daal do
 ; ya kuch naya soch lo
    mov ch, 0
    mov cl, string2length
    mov di, si
    inc di
    add si, cx ; its from 'si' to 'di'
    rep movsb
.exit
end
