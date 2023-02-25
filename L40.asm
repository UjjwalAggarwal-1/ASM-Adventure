.model tiny
.data
array1 db 1,2,3,4,5,6,7,8,9,10h
res dw 0
.code
.startup
    lea si,res
    lea di, array1
    mov al,7
    mov cx, 10
    cld
    ; so what scasb is doing is
    ; compare al with es:di
    ; and then inc/dec 
    ; so it will be one step ahead when its matched
    repne scasb
    sub di, offset array1
    mov bx, di
    dec bx
    mov [si],bx
.exit
end