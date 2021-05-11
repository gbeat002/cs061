;=================================================
; Name: Grant Beatty
; Email:  gbeatoo2@ucr.edu
; GitHub username: gbeat002
; 
; Lab: lab 4
; Lab section: 
; TA: 
; 
;=================================================
.ORIG x3000            ; Program begins here
LD R6, DEC_10
LEA R5, ARRAY_1
DO_WHILE_LOOP

trap x20
trap x21
STR R0, R5, #0
ADD R5, R5, #1
ADD R6, R6, #-1
BRp DO_WHILE_LOOP
END_DO_WHILE_LOOP


HALT                ; Stop execution of program

ARRAY_1   .BLKW   #10
DEC_10	.FILL	#10


.END
