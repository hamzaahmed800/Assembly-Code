.Model Small
.Stack 100h
.Data
a byte '0'
res byte ?

.Code
newline MACRO
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
ENDM

PRINT MACRO msg
mov ah,9
mov dx,offset msg
int 21h
ENDM

;MAIN PROCEDURE
Main Proc

Mov ax,@data
Mov ds,ax

mov cx,255
start:
mov bl,0

mov ah,2
mov dl,a
int 21h
inc a

loop start

;Program Termination
Mov ah,4ch
Int 21h
Main Endp
End Main