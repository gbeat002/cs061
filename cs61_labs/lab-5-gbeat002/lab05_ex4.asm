;=================================================
; Name: Grant Beatty
; Email:  gbeat002
; GitHub username: gbeat002
; 
; Lab: lab 5
; Lab section: 
; TA: 
; 
;=================================================

.orig x3000

;-------------
;Instructions
;-------------

LD 	R1,VALUE_TO_ENTER	;
LD	R2,DATA_PTR		;
LD	R5,max			;
LOOP
STR	R1,R2,#0		;
ADD	R2,R2,#1		;
ADD	R1,R1,R1		; 
ADD	R3,R1,R5		;
BRnp	LOOP			;
LD	R4,DATA_PTR		;
ADD	R4,R4,#6		;

LDR	R2,R4,#0		;
					;
begin_exercise_4	
LD	R3,DATA_PTR		;
LD	R5,ASCII
	LD	R4,outCounter
LOOP_X
LD	R6,counter		;
	LDR	R1,R3,#0		;

PRINT_BRANCH	
ADD	R1,R1,#0		;
BRzp	PRINT_0			;
ADD	R1,R1,#0		;
BRn	PRINT_1			;
NEXT_CHAR
ADD	R1,R1,R1		;
ADD	R6,R6,#-1		;

LD	R7,space1
ADD	R7,R6,R7
BRz	PRINT_SPACE
LD	R7,space2
ADD	R7,R6,R7
BRz	PRINT_SPACE
LD	R7,space3
ADD	R7,R6,R7
BRz	PRINT_SPACE
POST_SPACE
ADD	R6,R6,#0	
BRp	PRINT_BRANCH
LD	R0,NEWLINE
OUT
ADD	R3,R3,#1
ADD	R4,R4,#-1
BRp	LOOP_X
	BRnzp	END
PRINT_0
	AND	R0,R0,#0
	ADD	R0,R0,R5
	OUT
	BRnzp	NEXT_CHAR
PRINT_1	
	AND	R0,R0,#0
	ADD	R0,R0,#1
	ADD	R0,R0,R5
	OUT
	BRnzp	NEXT_CHAR
PRINT_SPACE
	LD	R0,space_char
	OUT
	BRnzp	POST_SPACE
	
END
	HALT
;------------
;data
;------------
VALUE_TO_ENTER	.FILL	x1	;
DATA_PTR	.FILL	ARRAY	;
max		.FILL	#-1024	; 
outCounter	.FILL	#10	;
counter		.FILL	#16	;
space1		.FILL	#-12	;
space2		.FILL	#-8	;
space3		.FILL	#-4	;	
NEWLINE		.FILL	#10	;
ASCII		.FILL	#48
space_char	.FILL	#32	;
.orig x4000
ARRAY	.BLKW	#10		;

.end