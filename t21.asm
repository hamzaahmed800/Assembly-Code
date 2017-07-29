.Model Small
.Stack 100h
.Data
a word 5
s byte 1
b byte 1
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

add b,48
add s,48
mov cx,5
outer:
mov bx,cx


mov cx,a
inner:
mov ah,2
mov dl,b
int 21h
inc b
loop inner 
dec a

newline
mov cx,bx
inc s
mov dl,s
mov b,dl
loop outer


;Program Termination
Mov ah,4ch
int 21h

Main Endp
END MAIN