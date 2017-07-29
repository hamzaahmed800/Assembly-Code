.Model Small
.Stack 100h
.386
.Data
arr DB 1,2,3,4
    DB 4,5,6,7
    DB 8,9,10,11
 arr1 byte "Sum of Row = $"
 arr2 byte "Sum of Row = $"
 arr3 byte "Sum of R3 = $"
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
mov dx,offseet msg
int 21h
ENDM

Main Proc
Mov ax,@data
Mov ds,ax

mov bx,0  ;row #
mov cx,3
outer: 
push cx
mov ax,4  ;# of col
push bx
mul bx
mov bx,ax

mov cx,4
mov si,0 ;for column addition
mov al,0
inner:
    add al,arr[bx+si]
    inc si
    loop inner

movzx ax,al
call outdec

newline
pop bx
inc bx
pop cx
loop outer

;Program Termination
Mov ah,4ch
int 21h

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