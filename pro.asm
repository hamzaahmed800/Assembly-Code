;TITLE Hamming Distance   (Hami.asm)
;includelib   \masm32\lib\Irvine32.lib
;include      \masm32\include\Irvine32.inc
.Model Small
.Stack 200h                      
.data
BUFFERSIZE = 128  ;set maximum buffer size
;input declaration
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
;Starting of MACROS
newline MACRO
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
ENDM

printer MACRO msg
mov ah,9
mov dx,offset msg
int 21h
ENDM

inputString1 MACRO
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

inputString2 MACRO
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
main PROC
Mov ax,@data
Mov ds,ax
printer PmtString1		      	  	
inputString1       

printer PmtString2					      	
inputString2       		

xor cx,cx ; set cx to zero

mov si,lengthof FirstStr
mov di,lengthof SecStr

		

Find:	             ; Find identifies the string with the least number of characters and outputs the appropiate message 
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
	
	
	




LoopMain: 		; loopmain computes the hamming distance by using a nested loop and the stack
mov  al,FirstStr[si]			
mov  dl,SecStr[si]				

XOR  al,dl					

push cx				
call GetNumberOfZeros
;mov dx,8
;sub dx,bx					
add di,dx
	pop cx
	inc si
	loop LoopMain
	
	mov ax,di
	mov hammy,ax
;print out the necesaary info
				
;printer OutPutMsg			
	mov ax,hammy		
	call outdec
	newline

Mov ah,4ch
int 21h
main ENDP

GetNumberOfZeros PROC ; this fuction its main objective is to count the number of zeros in a byte, because  XOR unequal bits return a 1 but equal ones return 0
         xor bx,bx  		
         mov  cx,8
CountZeros:
        test al,1
        jnz Skip
         inc  bx
        			
Skip:
        shr al,1		
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