.Model Small
.Stack 100h
.Data

D1 DB ?
D2 DB ?
RD DB ?
MSG1 DB "ENTER THE DIVIDENT: $"
MSG2 DB 10,13,"ENTER THE DIVISOR : $"
MSG3 DB 10,13,"RESULT: $"

.Code

main Proc

MOV AX,@DATA
MOV DS,AX

MOV DX,0
SUB DX,48

MOV AX,80
SUB AX,48

MOV BX,2
SUB BX,48

DIV BX

MOV BH,AL
MOV DL,BH
ADD DL,48 
INT 21H


;Program Termination
mov ah,4ch
int 21h

main endp

end main