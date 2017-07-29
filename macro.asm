.Model Small
.Stack 100h
.Data

arr byte "Hamza Ahmed$"
arr1 byte ?
msg byte "Enter The Character: $"
msg1 byte "Enter The Index: $"
a byte ?
.Code

Main Proc
mov ax,@data
mov ds,ax

;Creation Of Macro
newline MACRO
mov ah,2
mov dl,10
int 21h

mov dl,13
int 21h

EndM


;msg
mov ah,9
mov dx,offset msg
int 21h

mov ah,1 
int 21h

mov a,al

newline

;msg1
mov ah,9
mov dx,offset msg1
int 21h

mov ah,1
int 21h

sub al,48
mov bl,al

mov ch,0
mov cl,lengthof arr
mov si,0
mov di,0
add cl,1
startloop:

cmp cl,bl
JE continue

mov dl,arr[si]
mov arr1[di],dl
JMP addmore

continue:
mov dl,a
mov arr1[di],dl
JMP addmore1

addmore:
inc si

addmore1:
inc di


loop startloop

mov arr1[si],"$"

newline

mov ah,9
mov dx,offset arr1
int 21h





;Program Termination
Mov ah,4ch
Int 21h

Main Endp

End Main