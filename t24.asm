.Model Small
.Stack 100h
.Data
a word 5
s byte 1
b byte 5
d byte 5
.Code
newline MACRO 

mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
ENDM

Main Proc
Mov ax,@data
Mov ds,ax

add d,30h
add b,30h
add s,30h
mov cx,5
outer:
mov bx,cx

mov cx,a
inner:
mov ah,2
mov dl,b
int 21h
dec b
loop inner
dec a

newline
mov cx,bx
mov dl,d
mov b,dl
loop outer


;Program Termination
Mov ah,4ch
int 21h

Main Endp
END MAIN