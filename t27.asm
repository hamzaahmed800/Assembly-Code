.Model Small
.Stack 100h
.Data
 data byte "hamza ahmed$"
.Code



Main Proc 
mov ax,@data
mov ds,ax

mov ah,9
mov dx,offset data
int 21h

mov cx,lengthof data
dec cx
mov si,0
start:
AND data[si],11011111b

inc si
loop start
mov data[si],'$'

mov ah,2
mov dl,10
int 21h

mov ah,9
mov dx,offset data
int 21h

;program Termination
Mov ah,4ch
int 21h


Main Endp

End Main