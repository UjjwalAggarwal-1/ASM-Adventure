.model tiny
.data
    ARR1 DW 1221h, 4324h, 1234h, 9863h, 8881h, 8234h, 7h
    CNT1 Dw 07
    NEG1 DB ?
.code
.startup
    lea di, NEG1
    mov bx, 0
    mov cx, CNT1
    LEA SI, ARR1
    mov ax, 0
    x2:
    cmp [si], ax
    jge x1
    inc bx
    x1:
    inc si
    inc si
    dec cx
    jnz x2
    mov [di], bx
.exit
end