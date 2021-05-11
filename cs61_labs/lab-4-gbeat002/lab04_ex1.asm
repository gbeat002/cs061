;=================================================
; Name: Grant
; Email:  gbeat002@ucr.edu
; GitHub username: gbeat002
; 
; Lab: lab 4
; Lab section: 
; TA: 
; 
;=================================================
.orig x3000



LD R5, DATA_PTR

LDR R3, R5, #0
add r3, r3, #1
STR R3, R5, #0


ADD R5, R5, #1

LDR R4, R5, #0
add r4, r4, #1
STR R4, R5, #0

HALT
DATA_PTR .FILL x4000


.orig x4000
.FILL    #65
.FILL    #20

.end
