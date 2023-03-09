.ModeL Tiny
.dAta

    dat1 db '1', '2', '3', '4'
    res db 6 dup(0)
    stack1 dw 10 dup('xy')
    top_stack1 label word

.coDe
.staRtup

    lea sp,top_stack1
    lea si,dat1
    lea di,res
    mov cx,4
    x1: lodsb
    call mask1
    loop x1

.exIt

mask1 proc near
    and al,0fh
    stosb
    ret
mask1 endp

end