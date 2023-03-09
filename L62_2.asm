.ModEl TinY
.data

    stack1 dw 50 dup('xy')
    top_stack1 label word
    
    file1 db 'file1.txt', 0
    handle1 dw ?
    file2 db 'file2.txt', 0
    handle2 dw ?

    actinp1 db 10
    inp1 db 'ujjwalBoSs'

.code
.startup

    ; create file1
    lea dx, file1
    call fcreate1
    pop word ptr handle1
    ;create file2
    lea dx, file2
    lea si, handle2
    push si
    call fcreate2
    
    ; write to file1
    push word ptr handle1
    mov al, actinp1
    mov ah, 00
    push ax
    lea ax, inp1
    push ax
    call fwrite
    ;close
    push handle1
    call fclose

    ; write to file2
    push word ptr handle2
    mov al, actinp1
    mov ah, 00
    push ax
    lea ax, inp1
    push ax
    call fwrite
    ;close
    push handle2
    call fclose

.exit

fcreate1 proc near; issme address return karta hu by stack
    pop bp
    mov ah, 03ch
    mov cl, 00h
    int 21h
    push ax
    push bp
    ret
fcreate1 endp

fcreate2 proc near; issme address store kar dunga, at the address of file handle which i passed
    pop bp
    mov ah, 03ch
    mov cl, 00h
    int 21h
    pop bx
    mov [bx], ax
    push bp
    ret
fcreate2 endp

fwrite proc near
    pop bp
    pop dx
    pop cx
    pop bx
    mov ah, 40h
    int 21h
    push bp
    ret
fwrite endp

fclose proc near
    pop bp
    mov ah, 3eh
    pop bx
    int 21h
    push bp
    ret
fclose endp

newline proc near
    mov dx, 0ah ; or 'dl' for 'db'
    mov ah, 2h
    int 21h 
    MOV dl, 13 ;13d(0dh) for CR
    MOV ah, 02h
    INT 21h
    ret
newline endp

end
