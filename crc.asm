.Model Small
.Stack 100h
.Data
msg byte 16 dup(0)
msgDivisor byte 5 dup(0)
text2 byte "Enter the divisor: $"
dataText byte "Enter the data in Binary: $"
var1 byte "Error in Data Transfering!!!! $"
var2 byte "No Errors!!!!!$"
z word 5
d1 byte 5 dup(0)
d2 byte ?

.Code

;Starting of MACROS

inputDivisor MACRO       ;taking divisor input
mov cx,lengthof msgDivisor 
mov si,0
start1:
mov ah,1
int 21h

cmp al,13
JE stop1
mov msgDivisor[si],al

inc si
loop start1
stop1:
mov msgDivisor[si],'$'
ENDM


inputData MACRO              ;taking input of data message
mov cx,lengthof msg 
mov si,0
start:
mov ah,1
int 21h

cmp al,13
JE stop
mov msg[si],al

inc si
loop start

stop:
mov cx,lengthof msgDivisor
sub cx,1                                   
insert:
mov msg[si],'0'
inc si
loop insert
mov msg[si],'$'
ENDM

newline MACRO           ;newline MACRO
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

;END OF MACROS

Main Proc           ;Starting of Main Procedure
mov ax,@data
mov ds,ax

    printer text2       ;taking input in divisor using MACRO
    inputDivisor
    newline
    printer msgDivisor

    newline
    printer dataText
    inputData
    newline
    printer msg


checkStart:          

    mov cx,lengthof d1
    xor si,si                       ;transfering 5 elemets of msg into another array
check1:
    mov bl,msg[si]
    mov d1[si],bl

    inc si
loop check1
    mov cx,12

working:
    push cx
    xor si,si
    mov cx,5
    cmp d1[si],'0'
    JE work1
work:
    mov bl,d1[si]
    mov dl,msgDivisor[si]

     xor bl,dl
    add bl,30h
    mov d1[si],bl

    inc si
loop work
    JMP next

work1:                  ;this will run when first element of d1 is 0    
    mov bl,d1[si]
    mov dl,'0'

    xor bl,dl
    add bl,30h
    mov d1[si],bl
    inc si
loop work1

    next:                   ;after xor performing left shift in Msg
    mov di,z
    mov bl,msg[di]
    mov d1[si],bl

    mov cx,5
    mov si,1                    
    mov di,0
    task:
    mov bl,d1[si]
    mov d1[di],bl
    inc si
    inc di                  
    loop task

    mov d1[di],'$'
    newline
    printer d1

    mov di,z
    inc z
    cmp msg[di],'$'         ;this is to check end of msg
    JE terminateAll
     
    pop cx
  loop working


terminateAll:
    mov cx,5
    sub cx,1
    xor si,si
lastChecking:

    cmp d1[si],'0'
    JNE Error
    inc si
loop lastChecking

noError:
    newline
    printer var2
    JMP goEnd

Error:
    newline
    printer var1
    
   
 goEnd:


    ;Program Termination

    Mov ah,4ch
    Int 21h

Main Endp

END MAIN