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

LDI R3, DEC_65_PTR
LDI R4, HEX_65_PTR
ADD R3, R3, #1
ADD R4, R4, #1
STI R3, DEC_65_PTR
STI R4, HEX_65_PTR

HALT
DEC_65_PTR .FILL x4000
HEX_65_PTR .FILL x4001

.orig x4000
.FILL	#65
.FILL	x41

.end