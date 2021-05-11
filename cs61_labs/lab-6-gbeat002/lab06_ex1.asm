;=================================================
; Name: Grant Beatty
; Email:  gbeat002
; GitHub username: gbeat002
; 
; Lab: lab 6
; Lab section: 
; TA: 
;=================================================
.ORIG x3000            ; Program begins here
LD R6, ARRAY10
LEA R5, ARRAY_1
DO_WHILE_LOOP

trap x20

STR R0, R5, #0
ADD R5, R5, #1



ADD R4, R4, #-1
BRp WHILE_LOOP
ENDDO_WHILE_LOOP


LD R6, DEC_10
LEA R5, ARRAY_1
DO_WHILE_LOOP

LDR R0, R5, #0
trap x21
ADD R5, R5, #1

LEA R0, NEWLINE            ; get starting address of prompt string
PUTS



ADD R6, R6, #-1
BRp DO_WHILE_LOOP
END_DO_WHILE_LOOP

HALT                ; Stop execution of program

ARRAY_1   .BLKW   #10
DEC_10    .FILL    #10
.orig x3020
NEWLINE .FILL '\n'  

.END