.Model Small
.Stack 100h
.386
.Data
msg1 byte "Enter your #:  $"
arr2 byte "#'s Binary is = $"
.Code
printer MACRO msg
mov ah,9
mov dx,offset msg
int 21h
ENDM
newline MACRO 
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
ENDM
Main Proc
mov ax,@data
mov ds,ax

printer msg1
call indec
mov bx,ax

printer arr2

mov cx,16
start:
ROL bx,1
JC one
JMP zero

one:
mov ah,2
mov dl,31h
int 21h
JMP done

zero:
mov ah,2
mov dl,30h
int 21h

done:

loop start


;Program Termination
mov ah,4ch
int 21h

Main Endp

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