.model tiny
.data
ARR1 DB 91H,02H,83H,0AH,075H,0AH,47H,12H,76H,61H
CNT1 DW 0AH
.code
.startup
    LEA bx,ARR1
    MOV CX, CNT1
    MOV DH, 45H
    MOV AH, 0AH
    X2:
    CMP [bx], AH
    JNZ X1
    MOV [bx], DH
    X1:
    INC bx
    DEC CX
    JNZ X2
.exit
end