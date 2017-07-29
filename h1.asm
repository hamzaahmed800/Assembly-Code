.Model Small
.Stack 100h
.Data

arr dw 10,12,13,14
arr2 byte "Number is =  $"
.Code

Main Proc

mov ax,@data
mov ds,ax

xor ax,ax
mov si,offset arr

mov cx,4
add_loop:

add ax,[si]
add si,2

loop add_loop

call outdec


;Program Termination
Mov ah,4ch
Int 21h

Main Endp

;OutDec procedure Begining

outdec proc

push ax
push bx
push cx
push dx

mov cx,0
cmp ax,0
jge else_label

push ax
mov ah,2
mov dl,'-'
int 21h
pop ax
neg ax

else_label:

mov bx,10
mov dx,0

div bx
push dx
inc cx
cmp ax,0
jne else_label

mov ah,9
lea dx,arr2
int 21h
mov ah,2
jmp print

print:
pop dx
add dx,30h
int 21h

loop print

pop dx
pop cx
pop bx
pop ax

ret

outdec endp


END MAIN