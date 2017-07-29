.Model Small
.Stack 100h
.386
.Data
arr1 byte "Hi this hamza ahmed$"
arr2 byte lengthof arr1

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

mov cx,lengthof arr1
mov si,lengthof arr1
sub si,2
mov di,0
copying:

mov bl,arr1[si]
mov arr2[di],bl

dec si
inc di

loop copying
mov arr2[di],'$'
newline
printer arr2


;Program Termination
Mov ah,4ch
int 21h

Main Endp
End Main
