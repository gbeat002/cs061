;=================================================
; Name: Grant Betty
; Email:  gbeat002
; GitHub username: gbeat002 
; 
; Lab: lab 7
; Lab section: 
; TA: 
; 
;=================================================
;help
.orig x3000
;Main
LEA	R0,input
PUTS
trap x20
OUT
ADD	R1,R0,#0
	
LD	R5,address
JSRR	R5	
LD	R0,ENTER
OUT


LEA	R0,ones_message
	PUTS
LD	R4,num48
ADD	R0,R2,R4
	OUT
LD	R0,ENTER
	OUT
	
	HALT
;DATA
ones_message	.STRINGZ	"The amount of 1's is: "
ENTER		.FILL		#10
input	.STRINGZ	"Enter a character: "
address	.FILL		x4000
num48		.FILL		#48
.orig x4000

;counter

ST	R7,sa5e	
LD	R4,number_16
AND	R2,R2,#0		
REPEAT
ADD	R1,R1,#0

BRn	NPOS


NEGCHECK

ADD	R1,R1,R1	
ADD	R4,R4,#-1	
BRz	FINISH	
BRnp	REPEAT	

NPOS

ADD	R2,R2,#1	
BRnzp	NEGCHECK

FINISH
	
LD	R7,sa5e
RET
;data chart
sa5e		.FILL		x0
number_16		.FILL		#16
.end