.Model Small
.Stack 100h
.Data
a word 1
b word 5
s word 5
.Code
free MACRO
mov cx,10
s1:
mov ah,2
mov dl,32
int 21h
loop s1
mov ah,2
mov dl,'*'
int 21h
ENDM
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

mov cx,10

outer:
mov bx,cx

cmp bx,5
JLE newinner
JMP oldinner

oldinner:
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

JMP Done

newinner:
mov cx,s
newspace:
mov ah,2 
mov dl,32
int 21h
loop newspace
inc s

mov cx,a
new_inner:
mov ah,2
mov dl,'*'
int 21h
loop new_inner
sub a,2

Done:
newline
mov cx,bx

loop outer
free
;Program Termination
Mov ah,4ch
Int 21h

Main Endp
End Main