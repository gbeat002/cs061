;=================================================
; Name: Grant Beatty
; Email: gbeat002@ucr.edu 
; GitHub username: gbeat002
; 
; Lab: lab 2
; Lab section: 
; TA: 
; 
;=================================================
.ORIG x3000
LD R1, DEC_0
LD R2, DEC_12
LD R3, DEC_6

DO_WHILE_LOOP
ADD R1, R1, R2
ADD R3, R3, #-1
BRp DO_WHILE_LOOP
END_DO_WHILE_LOOP
HALT

DEC_0	.FILL	#0
DEC_12	.FILL	#12
DEC_6	.FILL	#6

.end