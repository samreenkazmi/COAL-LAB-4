TITLE initialize array 
;three arrays to hold four one-word integers each. Keep 3rd array uninitial-ized.  
INCLUDE Irvine32.inc 
.data 
array1 WORD 2h,3h,4h,5h     ;array declared as a of type WORD and initialized 
array2 WORD 3h,4h,5h,6h
array3 WORD ?                      ;uninitialized array
message1 BYTE " The sums of the arrays are shown in the registers EAX and EBX: ",0 ;string
message2 BYTE " The sum of the array1 is shown : ",0 
message3 BYTE " The sum of the array2 is shown : ",0 


.code 
main PROC 
Mov ecx, lengthof array1
Mov esi, OFFSET array1
Mov eax,0h                                
L1:
ADD al,[esi]
ADD ESI,2
LOOP L1

Mov ecx, lengthof array2
Mov esi, OFFSET array2
Mov ebx,0h                                
L2:
ADD bl,[esi]
ADD ESI,2
LOOP L2

MOV edx, OFFSET message1 
call writestring         ; Printing an instruction on screen to display sum of array1
call crlf                ; Indicate a new line

MOV edx, OFFSET message2 
call writestring         ; Printing an instruction on screen to display sum of array2
call crlf                 
call writeInt            ; Printing Sum of array1
call crlf

MOV edx, OFFSET message3 
call writestring       
call crlf        
MOV eax, 0h
MOV al, bl             ; Moving the value of bl to al to call writeInt on it
call writeInt          ; printing sum of array2
call crlf

call DumpRegs
exit 	
main ENDP 
END main