section .data

msg db "Enter the first number " , 10
msglen : equ $-msg

msg1 db "Enter the second number " , 10
msg1len : equ $-msg1

msg2 db "The subtraction is : " , 10
msg2len : equ $-msg2

section .bss

num1 resb 2
num2 resb 2
res resb 2

%macro RW 4
mov eax , %1
mov ebx , %2
mov ecx , %3
mov edx , %4
int 80h
%endmacro

section .text 
global _start
_start:

RW 4,1,msg,msglen
RW 3,0,num1,2
RW 4,1,msg1,msg1len
RW 3,0,num2,2

mov eax , [num1]
sub eax , 30h
mov ebx , [num2]
sub ebx , 30h
sub eax , ebx 

add eax , 30h
mov [res] , eax

RW 4,1,msg2,msg2len
RW 4,1,res,1

mov eax , 01
mov ebx , 10
int 80h

