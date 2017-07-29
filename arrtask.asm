.Model Small
.Stack 100h
.Data

arr1 dw 10 dup(0)
msg  db "Enter Data In Array:",10,13,"$"
msg1 db "Inserted Data",10,13,"$"
msg2 db "Sorted Data",10,13,"$"

.code

Main Proc

MOV AX,@DATA
MOV DS,AX

MOV AH,9
LEA DX,msg
INT 21H

MOV SI,0
MOV CX,10

MOV BX,CX

L1:

CALL INDEC

MOV WORD PTR arr1[SI],AX

ADD SI,2

LOOP L1

;START OF ASCENDING_ORDER- SORTING LOGIC

MOV CX,9

REP_LABEL:

MOV BX,CX
MOV SI,0

COMPARE:

MOV AX,arr1[SI]
MOV DX,arr1[SI+2]

CMP AL,DL
JC NO_SWAP

MOV arr1[SI],DX
MOV arr1[SI+2],AX

NO_SWAP:

ADD SI,2
DEC BX
JNZ COMPARE

LOOP REP_LABEL

;END OF SORTING LOGIC

MOV AH,9
LEA DX,msg2
INT 21H

;printing loop starts here!

MOV CX,10
MOV SI,0

PRINT_LOOP:

MOV AX,arr1[SI]

CALL OUTDEC

MOV AH,2
MOV DL,10
INT 21H

ADD SI,2

LOOP PRINT_LOOP



;Program Termination

mov ah,4ch
int 21h

main endp

;Indec procedure

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

;Outdec Procedure

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

;mov ah,9
;lea dx,arr2
;int 21h

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