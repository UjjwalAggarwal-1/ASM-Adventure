.model tiny
.data
.code 
.startup
    ; even these commands go into the debugx
    N L21.txt ; set name
    L 200 ; load name file at adress 0100h
    d 200 ; check data at 0100h
    ; then move to appropriate position
.exit
end