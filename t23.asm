.Model Small
.Stack 100h
.Data
a word 1
s byte 1
b byte 1
d word 5
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


add b,30h
add s,30h
mov cx,5
outer:
mov bx,cx

;spcae loop
mov cx,d
space:
mov ah,2
mov dl,32
int 21h
loop space
dec d

mov cx,a
inner:
mov ah,2
mov dl,b
int 21h
mov dl,32
int 21h
inc b
loop inner 
inc a
inc s
newline
mov cx,bx
mov dl,s
mov b,dl
loop outer


;Program Termination
Mov ah,4ch
int 21h

Main Endp
END MAIN