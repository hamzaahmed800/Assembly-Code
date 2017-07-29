.Model Small
.Stack 100h
.Data
arr1 byte "Enter First Digit: $"
arr2 byte "Enter Second Digit: $"
arr3 byte "What Operation do you want to perform?$"
arr4 byte "1- ADDITION  2- SUBTRACTION$"
arr5 byte "Enter Your Choice: $"
arr6 byte "Result = $"
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

newline
PRINT arr3
newline
PRINT arr4
newline
PRINT arr5

mov ah,1
int 21h
sub al,30h
cmp al,1
JE ADDITION
cmp al,2
JE SUBTRACTION

ADDITION:
mov bl,a
add bl,b
sub bl,30h
JMP done

SUBTRACTION:
mov bl,a
sub bl,b
add bl,30h


done:
newline
PRINT arr6
mov ah,2
mov dl,bl
int 21h

;Program Termination
Mov ah,4ch
Int 21h
Main Endp
End Main