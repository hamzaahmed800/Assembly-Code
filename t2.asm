.Model Small
.Stack 100h
.Data 
.Code
Main Proc

mov cx,5

Top:
mov bx,1
mov dx,bx
inside:
mov ah,2
mov dl,'*'
int 21h
cmp dx,bx
JLE inside

inc bx
loop Top

;Program TErmination
Mov ah,4ch
int 21h

Main Endp
End Main