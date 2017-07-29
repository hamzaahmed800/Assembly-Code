.model small
.stack 100h
.data
.code 
main proc

mov ax,@data
mov ds,ax

mov ah,1
int 21h

;sub al,48
mov bl,al


mov ah,2
mov dl,bl
int 21h

mov ah,4ch
int 21h

main endp 
end main
