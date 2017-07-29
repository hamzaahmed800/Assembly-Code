.model small
.stack 100h
.data
VAR WORD ?
s1 byte ?
task byte 10,13,"Enter The Size: $"
.code

;Starting Program

main proc
mov ah,1
int 21h


mov cx,ax
l1: 

mov bx,cx

MOV VAR,CX
l2:

mov ah,2
mov dl,'*'
int 21h

loop l2
DEC VAR
mov ah,2
mov dl,10
int 21h

mov cx,bx

loop l1

;program termination 

mov ah,4ch
int 21h

main endp
end main
