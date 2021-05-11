;=================================================
; Name: Grant Beatty
; Email:  gbeat002
; GitHub username: gbeat002
; 
; Lab: lab 3
; Lab section: 
; TA: 
; 
;=================================================
.orig x3000

LD R0, DEC_65
LD R1, HEX_41

DO_WHILE_LOOP
Trap x21
ADD R0, R0, #1
ADD R1, R1, #-1

BRp DO_WHILE_LOOP
END_DO_WHILE_LOOP



HALT

DEC_65	.FILL	x61
HEX_41	.FILL	x1A

.end