.Model Small
.Stack 100h
.Data
a word 1
s word 5
.Code
newline MACRO
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
ENDM

Main Proc
mov ax,@data
mov ds,ax

mov cx,5

outer:
mov bx,cx

space:
mov ah,2 
mov dl,32
int 21h
loop space

mov cx,a
inner:
mov ah,2
mov dl,'*'
int 21h

loop inner
add a,2

newline
mov cx,bx
loop outer

;Program Termination
Mov ah,4ch
Int 21h

Main Endp
End Main