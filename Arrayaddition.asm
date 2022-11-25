section .data
	msg db 10,13,9,'Array addition is:'
        msglen: equ $-msg
	global x	;declaration and initialization of an array
     x:
       db 1
       db 2
       db 3
       db 1
       db 1
   sum:
       db 0
	
section .text
global _start
_start:

	mov eax,4       ;SYS Call Write
	mov ebx,1       ;STDOUT
	mov ecx,msg     ;Msg display
	mov edx,msglen  ;message length
	int 80h
	
	mov eax,x	;eax will point to the current element to be summed
	mov ebx,0       ;ebx will store result (Sum)
	mov ecx,5	;Length of an array
      t:
         add ebx,[eax]  ;add array element with ebx
         add eax,1	;move pointer to next element
         loop t         ;if counter is not zero repeat loop
         
         cmp bl,9       ;compare result with 9
         jna t1         ;jna= jump if not above or jbe= jump if below or equal
         add bl,07      ;if result is >9, add 37H to convert in to ASCII
     t1: add bl,30h     ;if result is <9, add 30H to convert in to ASCII
         
         mov [sum],bl   ;move result to sum
             
         mov edx,1      ;message length
         mov ecx,sum    ;message to write (Sum)
         mov eax,4      ;system call number (System write)
         mov ebx,1      ;stdout
         int 80h
	 	
                    
         mov eax,1      ; The system call for exit (sys-Exit)
         mov ebx,0      ; Exit with return code 0 (no error)
         int 80h
