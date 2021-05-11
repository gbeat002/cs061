;=================================================
; Name: Grant Beatty
; Email:  gbeat002@ucr.edu
; GitHub username: gbeat002
; 
; Lab: lab 4
; Lab section: 
; TA: 
; 
;=================================================
.ORIG x3000            ; Program begins here
LD R5, ARRAY_1
DO_WHILE_LOOP

trap x20
trap x21
STR R0, R5, #0
ADD R5, R5, #1

ADD R6, R0, #-11
BRp DO_WHILE_LOOP
END_DO_WHILE_LOOP



LD R5, ARRAY_1
DO_WHILE_LOOPs

LDR R0, R5, #0
trap x21
ADD R5, R5, #1
ADD R6, R0, #-11
LEA R0, NEWLINE            ; get starting address of prompt string
PUTS


ADD R6, R6, #0
BRp DO_WHILE_LOOPs
END_DO_WHILE_LOOPs



HALT                ; Stop execution of program

ARRAY_1 .FILL x4000

.orig x3050
NEWLINE .FILL '\n'  
.END
