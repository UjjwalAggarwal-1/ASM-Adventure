; ; Remember to close the file as well **credits: Arkya ProDev Aditya**

; This Assembly Language Program (ALP) checks the entered username and password, and displays a custom message accordingly.

.model tiny
.data

; Data section contains the messages, the correct username, and password for comparison.

maxLength dw 20h ; Maximum length for input

msg1 db "enter User Name: $" ; Message 1: Prompt to enter the username
usn1 db 20h dup("$") ; Correct username for comparison
inp1 db 20h dup("$") ; Buffer to store user's input for username

msg2 db "enter password:$" ; Message 2: Prompt to enter the password
pass1 db 20h dup("$") ; Correct password for comparison
inp2 db 20h dup("$") ; Buffer to store user's input for password

msg3 db "hello $" ; Message 3: Greeting message when both inputs are correct
msg4 db "wrong username$" ; Message 4: Wrong username input
msg5 db "wrong password$" ; Message 5: Wrong password input
nline db 0ah, 0dh, "$" ; New line characters

file1 db 'user.txt',0
file2 db 'pswd.txt',0

.code
.startup

    ; open file1 and save data in memory at usn1

    lea dx, file1
    mov ah, 3dh
    mov al, 0
    int 21h
    mov bx, ax
    mov ah, 3fh
    mov cx, 20h ; i can give a larger number, no problem
    lea dx, usn1
    int 21h
    
    ; open file2 and save data in memory at pass1

    lea dx, file2
    mov ah, 3dh
    mov al, 0
    int 21h
    mov bx, ax
    mov ah, 3fh
    mov cx, 20h
    lea dx, pass1
    int 21h

    ; Display message 1 on the screen and go to the next line.

    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Add a new line after the message.

    lea dx, nline
    mov ah, 09h
    int 21h

    ; Take input from the user and store it in inp1.
            ; old approach, this allows for a 0dh character (enter key) to be inputted in the data which is not desired
            ; lea dx, max1
            ; mov ah, 0ah
            ; int 21h

    mov cx, maxLength
    lea di, inp1
    nameInput:
    mov ah, 01h
    int 21h
    cmp al, 0dh
    jz afterNameEntered
    mov [di], al
    inc di
    dec cx
    jnz nameInput

    afterNameEntered:
    ; Compare the entered username with the stored username.
            ; ;first check for length ,,, this was reqd when using old approach to take input for username
            ; cmp act1, 10
            ; jnz wrongName
            ; ;now check the first 10 chars
    cld
    lea di, inp1
    lea si, usn1
    mov cx, maxLength
    repe cmpsb
    jcxz l1

    ; If the username is incorrect, display the "wrong username" message and exit.
    wrongName:
    lea dx, msg4
    mov ah, 09h
    int 21h

    mov ah, 4ch
    int 21h

    ; If the username is correct, display the "enter password" message.

    l1:
    lea dx, msg2
    mov ah, 09h
    int 21h

    lea dx, nline
    mov ah, 09h
    int 21h

    ; Take password input from the user, masking the characters.

    mov cx, maxLength
    lea di, inp2
    l2:
    mov ah, 08h
    int 21h
    cmp al, 0dh
    jz checkPassword
    mov [di], al
    mov dl, '*'
    mov ah, 02h
    int 21h
    inc di
    dec cx
    jnz l2

    ; Compare the entered password with the stored password.
    checkPassword:
    cld
    mov cx, maxLength
    lea di, inp2
    lea si, pass1
    repe cmpsb
    jcxz l3

    ; If the password is incorrect, display the "wrong password" message and exit.

    lea dx, nline
    mov ah, 09h
    int 21h

    lea dx, msg5
    mov ah, 09h
    int 21h

    mov ah, 4ch
    int 21h

    ; If the password is correct, display the greeting message and the username.

    l3:
    lea dx, nline
    mov ah, 09h
    int 21h

    lea dx, msg3
    mov ah, 09h
    int 21h

    lea dx, usn1
    mov ah,09h
    int 21h

    lea dx, nline
    mov ah, 09h
    int 21h

.exit
end
