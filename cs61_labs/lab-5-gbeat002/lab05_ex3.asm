;=================================================
; Name: 
; Email:  
; GitHub username: 
; 
; Lab: lab 5
; Lab section: 
; TA: 
; 
;=================================================
.ORIG x3F00            ; Program begins here
LD R6, DEC_10
LEA R5, ARRAY_1

LD R0, ZERO

DO_WHILE_LOOP


LD R1, ABSOLUTE
STR R0, R5, #0
DO_LOOP
ADD R1, R1, #2
ADD R0, R0, #-1
BRp DO_LOOP
END_DO_LOOP
ADD R0, R1, #0




ADD R5, R5, #1
ADD R6, R6, #-1
BRp DO_WHILE_LOOP
END_DO_WHILE_LOOP


LD R6, DEC_10
LEA R5, ARRAY_1
DO_WHILE_LOOPs

LDR R0, R5, #0
trap x21
ADD R5, R5, #1

LEA R0, NEWLINE            ; get starting address of prompt string
PUTS



ADD R6, R6, #-1
BRp DO_WHILE_LOOPs
END_DO_WHILE_LOOPs

LD R6, DEC_6
LEA R5, ARRAY_1
DO_WHILE_LOOPs1

ADD R5, R5, #1

ADD R6, R6, #-1
BRp DO_WHILE_LOOPs1
END_DO_WHILE_LOOPs1
LDR R2, R5, #0
HALT                ; Stop execution of program




.orig x3F50
DEC_10	.FILL	#10
DEC_6	.FILL	#6
ZERO	.FILL	#1
ABSOLUTE	.fill #0
.orig x3F20
NEWLINE .FILL '\n'  


.orig x4000
ARRAY_1   .BLKW   #10

.END