.model tiny
.data
name1 db 'u' ,'j' ,'j' ,'w' ,'a' ,'l'
len1 db 6

.code 
.startup

lea si, name1
add si, 10
std
mov cx, len1
x1:
push [si]
sub si, 2
loop x1

add si, 12
mov cx, len1
x2:
pop [si]
sub si, 2
loop x2

nop
nop
nop


.exit
end
