.MODEL SMALL
.STACK 100h
.DATA
text1 BYTE "hello world$"
text2 BYTE  10,13,lengthof text1 dup(?)

.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX

MOV CX,lengthof text1
MOV SI,lengthof text1
SUB SI,2
MOV DI,0


L1:
MOV BL,BYTE PTR text1[SI]
MOV text2[DI],BL
DEC SI
INC DI
LOOP L1

MOV AH,9
LEA DX,text1
INT 21H

MOV text2[DI],'$'


mov ah,2
mov dl,10
int 21h


MOV AH,9
LEA DX,text2
INT 21h

MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN