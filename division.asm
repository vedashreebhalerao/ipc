section .data

msg db 'Enter the dividend :',10
msglen: equ $-msg

msg1 db 'Enter the divisor :',10
msglen1: equ $-msg1

msg2  db 'Quotient of division is = ',10
msglen2: equ $-msg2

msg3  db 10,'Remainder of division is = ',10
msglen3: equ $-msg3

section .bss
dividend resb 1
divisor resb 1
quotient resb 1
remainder resb 1

%macro RW 4
mov eax,%1
mov ebx,%2
mov ecx,%3          
mov edx,%4
int 80h
%endmacro

section .text
global _start

_start:

nop

RW 4,1,msg,msglen

RW 3,0,dividend,2

RW 4,1,msg1,msglen1

RW 3,0,divisor,2

call procdiv


RW 4,1,msg2,msglen2

RW 4,1,quotient,1

RW 4,1,msg3,msglen3

RW 4,1,remainder ,1


mov eax,1
mov ebx,0
int 80h

procdiv: 
mov al,[dividend]   
sub al,'0'  
mov ah,0

mov bl,[divisor]
sub bl,'0'

div bl ; Q(al) & R(ah)=ax/bl
add al,'0' ;number in to ascii
mov [quotient],al
add ah,'0' ;number in to ascii
mov [remainder],ah
ret
