.Model Small
.Stack 100h
.Data
arr byte 10 dup(?)
arr1 byte "Enter the String: $"
.Code
;Macro making line of code
newline MACRO
mov ah,2
mov dl,10
Int 21h
mov ah,13
int 21h
ENDM
;Starting of Main PROCEDURE
Main Proc

mov ax,@data
mov ds,ax

mov ah,9
mov dx,offset arr1
int 21h

mov cx,lengthof arr1
mov si,0
input:

mov ah,1
int 21h

cmp al,13
JE done

mov arr[si],al

inc si
loop input

done:

;Program Termination
Mov Ah,4ch
Int 21h

Main Endp
End Main