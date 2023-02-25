.model tiny
.data
.code
.startup
    mov ax, 1133h
    mov bh,al
    mov bl,ah
    mov 20h[bx],bx
.exit
end