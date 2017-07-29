.Model Small
.Stack 100h
.Data
 a word 1
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
mov ax,@data
mov ds,ax

add b,48
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
mov dl,b
int 21h

cmp bx,cx
JGE s1
JMP s2
s1:
dec b
JMP l1
s2:
inc b
l1:
loop inner
add a,2


newline
mov cx,bx
loop outer

;Program Termination
mov ah,4ch
int 21h

Main Endp
End Main