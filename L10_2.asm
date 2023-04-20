.model tiny
.data 
num1 db 5
num2 db 2
fact1 db ?
fact2 db ?

.code
.startup
    mov bl, num1 

    mov dl, num2
    neg dl
    add dl, bl
    mov ax, 1
    call fact

    nop

    fact proc 
        inc dl 
        mul dl
        cmp dl, bl
        je end_fact
        call fact
        end_fact: ret
    fact endp


.exit
end
