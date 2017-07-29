.Model Small
.Stack 100h
.386
.Data
divisor byte ?
divident byte ?
quotient byte ?
remainder byte ?
arr1 byte "Enter the Numbr: $"
arr2 byte "Enter the Divisor: $"
arr3 byte "Quotient = $"
arr4 byte "Remainder = $"

.Code
printer macro msg
mov ah,9
mov dx,offset msg
int 21h
endm
newline macro
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
endm

Main Proc
mov ax,@data
mov ds,ax

printer arr1
mov ah,1
int 21h
sub al,30h
mov divident,al

newline
printer arr2
mov ah,1
int 21h
sub al,30h
mov divisor,al

mov bl,divisor
movzx ax,divident
div bl

add al,30h
add ah,30h

mov quotient,al
mov remainder,ah
newline

printer arr3
mov ah,2
mov dl,quotient
;add dl,30h
int 21h

newline
printer arr4
mov ah,2
mov dl,remainder
;add dl,30h
int 21h



;Program Termination
Mov ah,4ch
int 21h

Main Endp
End Main
