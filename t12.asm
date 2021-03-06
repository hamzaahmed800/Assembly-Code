.Model Small
.Stack 100h
.Data
arr byte "hamzaahmed$"
arr1 byte "String is Palindrome $"
arr2 byte "Not Palindrome $"
arr3 byte lengthof arr 
.Code 
printer MACRO msg
mov ah,9
mov dx,offset msg
int 21h
ENDM

Main Proc
mov ax,@data
mov ds,ax

mov cx,lengthof arr
mov si,lengthof arr
sub si,2
xor di,di

copying:
mov bl,arr[si]
mov arr3[di],bl

dec si
inc di
loop copying
mov arr3[di],'$'


mov cx,lengthof arr
sub cx,1
mov si,0
check:
mov bl,arr[si]
cmp arr3[si],bl
JNE Error

inc si
loop check
printer arr1
JMP Done
Error:
printer arr2

Done:

;Program Termination
Mov ah,4ch
Int 21h

Main Endp

pow PROC

mov bp,sp
mov ax,[bp+2]
cmp ax,1
JE calculation
mov dx,[bp+4]
dec ax 
push dx
push ax
call pow
mov bp,sp
mov bx,[bp+4]
mul bx 
ret 4

calculation:
mov ax,[bp+4]
ret 4

pow ENDP

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

;Indec Procedure Begining 

indec proc

PUSH BX
PUSH CX
PUSH DX

BEGIN:

MOV BX,0
MOV CX,0 

MOV AH,1
INT 21H

CMP  AL,'-'
JE MINUS
CMP AL,'+'
JE PLUS
JMP REP_LOOP

MINUS:
MOV CX,1

PLUS:
INT 21H

REP_LOOP:

CMP AL,'0'
JL INVALID
CMP AL,'9'
JG INVALID
SUB AL,30H
MOV AH,0
PUSH AX

MOV AX,10
MUL BX
POP BX 
ADD BX,AX

MOV AH,1
INT 21H
CMP AL,13
JNE REP_LOOP

MOV AX,BX
CMP CX,0
JE EXIT
NEG AX

EXIT:
POP DX
POP CX
POP BX
RET

INVALID:
MOV AH,2
MOV DL,10
INT 21H
MOV DL,13
INT 21H
JMP BEGIN

indec endp
End Main 