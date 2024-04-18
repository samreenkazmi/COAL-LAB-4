TITLE ARRAY and loop
INCLUDE Irvine32.inc
.data

    array1 WORD 2h,3h,4h,5h ; Initializing array with values 2,3,4,5
    array2 WORD 3h,4h,5h,6h ; Initializing array with values 3,4,5,6
    array3 WORD lengthof(array1) DUP(0h) ; uninitialized array of size equal to array1 
    message BYTE " The sums of the elements of the arrays are shown below:",0  ; Defining a string 

.code
main PROC
    
    MOV edx, OFFSET message 
    call writestring       ; Write message
    call crlf              ; inserting new line

    MOV ecx, lengthof array1 ; Set Count 
    MOV eax, 0h 
    MOV ESI, OFFSET array1 ; Set ESI Register to offset of array1
    MOV EDI, OFFSET array2 ; Set EDI Register to offset of array2
    MOV EDX, OFFSET array3 ; Set EDX Register to offset of array3
    L1: 
    MOV eax, 0h
    ADD al, [esi] ; Adding values of array1 to al
    ADD al, [edi] 
    MOV [EDX], EAX ; Storing sum value of first two array in the third array
    ADD ESI, 2 ; Incrementing the value of offset by 2
    ADD EDI, 2
    ADD EDX, 2
    LOOP L1

    ; For Printing the Array 3
    Mov esi, offset array3 
    Mov ecx ,lengthof array3 ; Set count to length of array3
    Mov ebx , type array3 
    Call dumpmem ; Printing the memory locations on string
    exit 
main ENDP 
END main

