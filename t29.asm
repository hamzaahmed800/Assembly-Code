.Model Small
.Stack 100h
.Data
msg1 byte "Enter Data in Array: $"
msg2 byte "Unsorted List$"
msg3 byte "Sorted List$"
arr1 word ?
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
printer msg1
newline

mov cx,10
mov si,0
insert:
call indec
mov arr1[si],ax
add si,2
loop insert

mov cx,9
mov si,0
sorting:
mov bx,cx

rep_loop:
mov ax,arr1[si]
mov dx,arr1[si+2]
cmp ax,dx
JC convert
mov arr1[si],dx
mov arr1[si+2],ax

Convert:
add si,2
dec bx
JNZ rep_loop

loop sorting

;program Termination
Mov ah,4ch
Int 21h

Main Endp

Indec Proc
push bx
push cx 
push dx

Begin:
xor cx,cx
xor bx,bx

mov ah,1
int 21h

cmp al,'-'
JE minus
cmp al,'+'
JE plus
JMP continue

minus:
mov cx,1

plus:
int 21h

continue:
cmp al,'0'
JL invalid
cmp al,'9'
JG invalid

AND ax,000fh
mov ax,10
mul bx
pop bx
add bx,ax

mov ah,1
int 21h
cmp al,0dh
JNE continue

mov ax,bx
or cx,cx
JE exit
neg ax

exit:
push dx
push cx
push bx

ret

invalid:
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

JMP Begin

indec endp

outdec PROC
push ax
push bx
push cx
push dx

or ax,ax
JGE continue

push ax
mov ah,2
mov dl,'-'
int 21h
pop ax
neg ax

continue:
xor cx,cx
mov bx,10d

loopfor:
xor dx,dx
div bx
push dx
inc cx
or ax,ax
JNE loopfor

mov ah,2
printloop:
pop dx
or dx,30h
int 21h
loop printloop

pop dx
pop cx
pop bx
pop ax

ret 

outdec endp
End Main