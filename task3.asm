.model small 
.stack 100h
.data
a byte 2
src byte "tibbit$"
des byte lengthof src dup(?)
error byte 10,13,"NOT PALINDROME$"
correct byte 10,13,"PALINDROME$"
 
.code

main proc

mov ax,@data
mov ds,ax

mov cx,lengthof src
mov si,lengthof src
mov di,0

;copying elements
sub si,2

l1:
mov bl,byte ptr src[si]
mov des[di],bl
dec si
inc di

loop l1
sub di,1
mov des[di],'$'

;new line

mov ah,2
mov dl,10
int 21h

;printing src
mov ah,9
mov dx,offset src
int 21h

;new line
mov ah,2
mov dl,10
int 21h

;printing destination
mov ah,9
mov dx,offset des
int 21h

mov si,lengthof src
sub si,2
l2: 
mov bl,byte ptr src[si]
cmp byte ptr des[si],bl
JNE l4
loop l2

mov ah,9
mov dx,offset correct
int 21h
JMP l6

l4:

mov ah,9
mov dx,offset error
int 21h
JMP l6



l6:
;program Termination

mov ah,4ch
int 21h

main endp
end main