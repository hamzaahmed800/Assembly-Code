.Model Small 
.Stack 100h
.Data
key = 250
arr1 byte "Hamza Ahmed$"
arr2 byte lengthof arr1
.Code

newline MACRO
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
ENDM

printer MACRO msg
mov ah,9
mov dx,offset msg
int 21h
ENDM

Main Proc
mov ax,@data
mov ds,ax

printer arr1
newline

mov cx,lengthof arr1
mov si,0
copying:
mov bl,arr1[si]
xor bl,key
mov arr2[si],bl

inc si
loop copying
mov arr2[si],'$'

printer arr2
newline

mov cx,lengthof arr1
mov di,0
convert:
mov bl,arr2[di]
xor bl,key
mov arr2[di],bl

inc di
loop convert

printer arr2

;Program Termination
Mov ah,4ch
int 21h

Main Endp
End Main
