.Model Small
.Stack 200h                      
.data
BUFFERSIZE = 128  ;limit of string size

FirstStr   BYTE   BUFFERSIZE dup(2 dup(?))
SecStr   BYTE  BUFFERSIZE dup(2 dup(?))
OutPutMsg BYTE "Hamming distance is : $"	
PmtString1 BYTE "Enter first string : $"
PmtString2 BYTE "Enter second string: $"
Short1StrMsg byte "The first string is shorter than the Second string$"
Short2StrMsg byte "The second string is shorter than the First string$"
equalStrMsg byte "Both strings are of the same length$"

   					
hammy word 80 dup(0)
.code
;Starting of MACROS	 ;newline macro
newline MACRO
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
ENDM

printer MACRO msg        ;msg printing MACRO
mov ah,9
mov dx,offset msg
int 21h
ENDM

inputString1 MACRO     ;taking input in First String MACRO
mov  cx,BUFFERSIZE
xor si,si
input:
mov ah,1
int 21h
cmp al,13
JE endLoop
mov FirstStr[si],al
inc si
loop input
endLoop:
mov FirstStr[si],'$'
ENDM

inputString2 MACRO 	;taking input in Second String
mov cx,BUFFERSIZE
xor si,si
input1:
mov ah,1
int 21h
cmp al,13
JE endinput
mov SecStr[si],al
inc si
loop input1
endinput:
mov SecStr[si],'$'
ENDM
;Ending of MACROS

Main PROC		;MAIN PROCEDURE START FROM HERE
Mov ax,@data
Mov ds,ax
printer PmtString1		      	  	
inputString1       

printer PmtString2					      	
inputString2       		

xor cx,cx 



mov si,0 
mov di,0

LoopFirst:		;this label count the number of First string
	mov al,FirstStr[si]
	push cx				
call GetNumberOfZeros
mov dx,8
sub dx,bx					
	pop cx
	cmp dx,0
	je LoopSec
	inc si
	loop LoopFirst
		
LoopSec:		;this label count the Second string length
	mov  al,SecStr[di]
	push cx				
call GetNumberOfZeros
mov dx,8
sub dx,bx					
	pop cx
	cmp dx,0
	je Find
	inc di
	loop LoopSec
		

Find:	 		;this label compare the length of both string and set CX value 
	mov ax,si
	cmp ax,di
	jl TL
	jg TL2
	je TL3
	
	TL3:	
	printer equalStrMsg
	newline		
	mov cx,si
	mov si,0
	mov di,0
	jmp LoopMain
	
	TL:	
	printer Short1StrMsg
	newline
	mov cx,si
	mov si,0
	mov di,0
	jmp LoopMain
	
	TL2:	
	printer Short2StrMsg	
	newline
	mov cx,di
	mov si,0
	mov di,0
	jmp LoopMain
	


LoopMain: 		;this label calculate the hamming distance by byte by byte calculation
mov  al,FirstStr[si]			
mov  dl,SecStr[si]				

XOR  al,dl			;XOR return 1 on unequal bits and return 0 on equal bits		

push cx				
call GetNumberOfZeros
mov dx,8
sub dx,bx					
add di,dx
	pop cx
	inc si
	loop LoopMain
	
	mov ax,di
	mov hammy,ax
		
	mov ax,hammy	
	call outdec
	newline

Mov ah,4ch
int 21h
Main ENDP

GetNumberOfZeros PROC 	;this procedure is to count the number of zeros in a byte.
         xor bx,bx  		
         mov  cx,8
CountZeros:
        test al,1
        jnz  Skip
        inc  bx			
Skip:
        shr     al,1		
        loop    CountZeros
        ret	
GetNumberOfZeros Endp

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
lea dx,OutPutMsg
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
END main