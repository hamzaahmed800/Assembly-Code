.Model Small
.Stack 100h
.Data
arr1 byte "Enter First Digit: $"
arr2 byte "Enter Second Digit: $"
arr3 byte "Result = $"
a byte ?
b byte ?
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

PRINT arr1
mov ah,1
int 21h
mov a,al

newline
PRINT arr2
mov ah,1
int 21h
mov b,al

mov bl,a
sub bl,b
add bl,30h

newline
PRINT arr3
mov ah,2
mov dl,bl
int 21h

;Program Termination
Mov ah,4ch
Int 21h
Main Endp
End Main