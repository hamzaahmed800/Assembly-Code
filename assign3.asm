.model small
.stack 100h
.data 
a byte "progra is workin"
v byte 10,13,"Vowels = $"
d byte 10,13,"Digits = $"
c1 byte 10,13,"Consonant = $"
s byte 10,13,"Spaces = $"
a1 byte '0' ;for vowel 
a2 byte '0' ;for consonant
a3 byte '0'  ;fro digit
a4 byte '0' ;for spaces
.code
;Starting of Program
main proc
mov ax,@data
mov ds,ax

mov cx,lengthof a 
mov bx,cx
mov si,0

l_start:
mov bl,byte ptr a[si]
cmp bl,32
JE l_space
JG l_check

l_space:
Inc a4
JMP l_empty
l_check:
cmp bl,48
JE l_digit

l_digit:
cmp bl,57
JLE l_digi1
JG l_alpha

l_digi1:
Inc a3
JMP l_empty

l_alpha:
cmp bl,65
JL l_empty
JGE l_check_vowel_conso 

l_check_vowel_conso:
cmp bl,122
JG l_empty
cmp bl,65
JE l_vowel;for a
cmp bl,97
JE l_vowel
cmp bl,69
JE l_vowel;for e
cmp bl,101
JE l_vowel
cmp bl,73
JE l_vowel;for i
cmp bl,105
JE l_vowel
cmp bl,79
JE l_vowel;for o
cmp bl,111
JE l_vowel
cmp bl,85
JE l_vowel;for u
cmp bl,117
JE l_vowel
cmp bl,122
JLE l_consonant

l_vowel:
Inc a1
JMP l_empty

l_consonant:
cmp bl,90
JLE l_conso1
JG l_check_conso

l_empty:    ;empty Label     
inc si
loop l_start
jmp l_end

l_conso1:
Inc a2
JMP l_empty

l_check_conso:
cmp bl,97
JL l_empty
JGE l_conso2

l_conso2:
cmp bl,122
JLE l_conso21
JG l_empty

l_conso21:
Inc a2
JMP l_empty

l_end:
mov ah,9
mov dx,offset v
int 21h
mov ah,2
mov dl,a1
int 21h

mov ah,9
mov dx,offset d
int 21h
mov ah,2
mov dl,a3
int 21h

mov ah,9
mov dx,offset c1
int 21h
mov ah,2
mov dl,a2
int 21h

mov ah,9
mov dx,offset s
int 21h
mov ah,2
mov dl,a4
int 21h
;Termination of program
mov ah,4ch
int 21h
main endp 
end main

