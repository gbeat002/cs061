;=================================================
; Name: Grant Beatty
; Email:  gbeat002@ucr.edu
; GitHub username: gbeat002
; 
; Lab: lab 3
; Lab section: 
; TA: 
; 
;=================================================
.orig x3000



LD R5, DEC_65_PTR
LD R6, HEX_65_PTR
LDR R3, R5, #0
LDR R4, R6, #0
ADD R3, R3, #1
ADD R4, R4, #1
STR R3, R5, #0
STR R4, R6, #0

HALT
DEC_65_PTR .FILL x4000
HEX_65_PTR .FILL x4001

.orig x4000
.FILL	#65
.FILL	x41

.end