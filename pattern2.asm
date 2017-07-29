.model small
.stack 100h
.data
VAR WORD ?
s byte  ?
task byte "Enter The Size: $"
.code

;Starting Program

main proc

mov ax,@data
mov dx,ax

mov ah,9
mov dx,offset task
int 21h

mov ah,1
int 21h

mov s,al

mov cl,s
l1: 

mov bl,cl

MOV VAR,cl
l2:

mov ah,2
mov dl,'*'
int 21h

loop l2
DEC VAR
mov ah,2
mov dl,10
int 21h

mov cl,bl

loop l1

;program termination 

mov ah,4ch
int 21h

main endp
end main
