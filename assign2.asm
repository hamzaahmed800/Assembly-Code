.Model Small
.stack 100h
.Data
a byte ?
b byte ?
choice byte ?

w1 byte 10,13,"ENTER FIRST NUMBER: $"
w2 byte 10,13,"ENTER SECOND NUMBER: $"
w3 byte 10,13,"WHAT DO YOU WANT TO DO? $"
w4 byte 10,13,"1- ADD 2- SUB $"
w6 byte 10,13,"ENTER YOUR CHOICE: $"
w5 byte 10,13,"INVALID OPERATION!! $"
w7 byte 10,13,"RESULT = $"

.Code

;CODIND START....

Main Proc

mov ax,@data
mov ds,ax

mov ah,9
mov dx,offset w1
int 21h

mov ah,1
int 21h

;Inserting 1st value in variable A
mov bl,al

mov ah,2
mov dl,a
int 21h  


mov ah,9
mov dx,offset w2
int 21h

mov ah,1
int 21h

;Inserting 2nd value in variable cl
mov cl,al

mov ah,2
mov dl,b
int 21h  

mov ah,9
mov dx,offset w3 
int 21h


mov ah,9
mov dx,offset w4 
int 21h

;Taking Choice Value of USER
mov ah,9
mov dx,offset w6
int 21h


mov ah,1
int 21h

mov choice,al

cmp choice,'1'
JE l1

cmp choice,'2'
JE l2

l1:

add bl,cl
sub bl,30h

mov ah,9
mov dx,offset w7
int 21h

mov ah,2 
mov dl,bl
int 21h

JMP l3

l2:

sub bl,cl
add bl,30h

mov ah,9
mov dx,offset w7
int 21h

mov ah,2 
mov dl,bl
int 21h

JMP l3



;Program Termination

l3 :

Mov ah,4ch
int 21h

;CODING ENDING

Main Endp
End Main
