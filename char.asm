.model small
.stack 100h
.data
arr byte "Enter a Character: $"
arr1 byte "invalid character$"
task byte 10,13,"Do You want to Continue:(Y/N) $"
opt byte 'y'
fok byte 'A'
.code 

main proc

l_extra:

mov ax,@data
mov ds,ax

mov ah,9
mov dx,offset arr
int 21h

mov ah,1
int 21h

mov ah,2
mov dl,al
cmp dl,fok

JL l10
JG l1

JLE l3


l10:
mov ah,9
mov dx,offset arr1
int 21h
jmp l_task

l1:
cmp dl,'Z'
JL l3
JL l0


l0:
sub dl,32
int 21h
jmp l_task

l3 :
add dl,32
int 21h
jmp l_task



l_task:

mov ah,9
mov dx,offset task
int 21h

mov ah,1
int 21h
mov bl,al
cmp bl,opt
JE l_extra
JNE l4
int 21h

l4:

mov ah,4ch
int 21h

main endp 
end main