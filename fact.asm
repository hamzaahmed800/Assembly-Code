.Model Small
.Stack 100
.Data
arr2 byte "Factorial = $"
.Code

Main Proc

mov ax,@data
mov ds,ax

mov ax,5
push ax
call fact
call outdec



;Program Termination
Mov ah,4ch
Int 21h
Main Endp

fact proc

mov bp,sp
mov ax,word ptr[bp+2]
cmp ax,1
je l2
dec ax
push ax
call fact
mov bp,sp
mov bx,word ptr[bp+2]
mul bx
ret 2

l2:

mov ax,1
ret 2

fact endp

;Outdec Program
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

End Main