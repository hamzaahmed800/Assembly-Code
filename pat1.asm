.Model Small
.Stack 100h
.Data
a word 1

.Code

Main Proc

mov cx,5

outer:
mov bx,cx
 

inner:
mov bx,a

mov ah,2
mov dl,'*'
int 21h

cmp bx,a
JNE inner
inc bx

mov ah,2
mov ah,10
int 21h

loop outer




;Program Termination
Mov ah,4ch
Int 21h

Main Endp
End Main