;=================================================
; Name: grant Beatty
; Email:  gbeat002
; GitHub username: gbeat002
; 
; Lab: lab 6
; Lab section: 
; TA: 
; 
;=================================================
.orig x3000
  JSR	mstart ;Jump-skip to mstart

B_CHECK
LD	R7,checkb ;loads -98 opposite of ascii b into r7
ADD	R0,R0,R7  ;adds input to -98 to check if zero to check for b
BRz	LOOP	;if b then R0 is 0 go to loop if not next
LD	R0,NEWLINE2     ;output |
OUT			;Newline|
LEA	R0,error	;output |
PUTS			;Error  |
LD	R0,NEWLINE2	;output |
OUT			;Newline

BRnzp	mstart ;Restart code at mstart resetting counter

NOT_ZERO
	ADD	R6,R6,#-1 ;make -48 into -49 -(ascii 1)
	ADD	R5,R0,R6  ;add negative ascii 1 to input and place into r5
	BRz	CONTINUE  ;if zero jump to continue
NOT_ONE
	LD	R6,ASCII  ;make R6 back into negative ascii zero
	ADD	R5,R0,R6  ;add negative ascii 0 to input and place into r5
	BRz	CONTINUE  ;if zero jump to continue
INVALID
	LD	R0,NEWLINE2 ;place
	OUT		    ;newline
	LEA	R0,wrong_num;place
	PUTS		    ;error message 
			    ;continue to SPACE_ENTERED automatically
			    ;this allows us to turn back the counter 1 for the wrong input
SPACE_ENTERED
	ADD	R1,R1,#1 ;digit counter goes up 1
	BRnzp	LOOP     ; no matter what jump to LOOP


    mstart


LD	R1,max ;We load 17 into r1 because we have 17 digits (b0000 0000 0000 0000)
AND	R4,R4,#0 ;We AND(logical operation) R4 with 0 to place 0 in R4.
    LOOP ;loop used regularly after sucessful b digit
  GETC ;take input number from user
  OUT	;output what was just typed onto the consol
ADD	R1,R1,#-1 ;subtract 1 from our digits counter
ADD	R2,R1,#-16 ;subtract 16 from our counter and place number into R2 (first digit checking)
ADD	R2,R2,#0	;make R2 last register used

  BRz		B_CHECK	; if first digit go to B_CHECK if not continue

LD	R7,space_char2 ; load negative ascii value space into r7
ADD	R6,R0,R7	; take input and add negative ascii space store value in r6

  BRz		SPACE_ENTERED	;check if space entered (if zero go to SPACE_ENTERED)

  
  
LD	R6,ASCII; load negative ascii zero(-48) into r6
ADD	R5,R0,R6; add ascii zero to input and place into r5

  BRnp	NOT_ZERO; if not zero got to not zero
  
		;this branch is only taken if the previous value was zero  
ADD	R6,R6,#-1;make (-48) into (-49)
ADD	R5,R0,R6 ;add input to negative ascii 1

  BRnp	NOT_ONE	 ; if not zero go to not 1

  
  
CONTINUE

ADD	R5,R0,R6 ;no matter which branch is taken R0+R6=0;zero stored in r5
ADD	R3,R1,#0 ;digit number from r1 stored in r3
LD	R2,ASCII ;negative ascii zero loaded into r2
ADD	R0,R0,R2 ;R0 striped of ascii goes from 49 to 1 or from 48 to zero

LOOP2

ADD	R3,R3,#0	;make r3 (digit number copy) last register used
BRz	post_compute	;if digit is not zero dont skip loop to post_compute
ADD	R0,R0,R0	;double the value (continued on nextline)
ADD	R3,R3,#-1	;as many times as the digit

BRp	LOOP2		;once copy counter digit runs out continue to nextline

post_compute		
ADD	R4,R4,R0	;store doubled value R0 into r4 progressively ;2^15=-32768
ADD	R1,R1,#0	;make R1 (digit counter) last register used
BRp	LOOP		;counter check if not last digit go back to LOOP

ADD	R2,R4,#0	;move the final value to R2
ADD 	R1,R2,#0	;also place into R1
LD	R5,toASCII	; R5=48
LD	R3,SUB_ADDR	; make r3 an adress 
LD	R0,NEWLINE2	; output newline
OUT			;
JSRR	R3		;jump to x5000

HALT
;---------DATA-main-----------------
max	.FILL	#17
ASCII	.FILL	#-48
toASCII	.FILL	#48
SUB_ADDR	.FILL	x5000
NEWLINE2	.FILL	#10
checkb	.FILL	#-98
error	.stringz	"not b\n"
wrong_num	.stringz	"1 or 0 or space\n"
space_char2	.FILL	#-32



.orig x5000
;---------------
; subroutine Instructions
;--------------
SUBROUTINE

BACKUP_INIT

ST	R7,backup_R7 ; create backup for r7
LD 	R6,char16    ;load 16 into R6 to create digit counter

PRINT_BRANCH

ADD	R1,R1,#0		;make r1 the last register used  
BRzp	PRINT_0			; if r1 is positive or 0 print 0
ADD	R1,R1,#0		;
BRn	PRINT_1			; if r1 is negative print 1 
NEXT_CHAR

ADD	R1,R1,R1	;double r1(copy of decimal value)	
ADD	R6,R6,#-1	;subtract 1 from counter	

LD	R7,space1   ;space
ADD	R7,R6,R7    ;space
BRz	PRINT_SPACE ;space
LD	R7,space2   ;space
ADD	R7,R6,R7    ;space
BRz	PRINT_SPACE ;space
LD	R7,space3   ;space
ADD	R7,R6,R7    ;space
BRz	PRINT_SPACE ;space

POST_SPACE

ADD	R6,R6,#0	;make digit counter last register used
BRp	PRINT_BRANCH    ;if counter positive go to PRINT_BRANCH
LD	R0,NEWLINE
OUT
BRnzp	END_SUBROUTINE

PRINT_0

AND	R0,R0,#0
ADD	R0,R0,R5
OUT
BRnzp	NEXT_CHAR; go to next char

PRINT_1	
AND	R0,R0,#0
ADD	R0,R0,#1
ADD	R0,R0,R5
OUT
BRnzp	NEXT_CHAR ;go to next char

PRINT_SPACE

LD	R0,space_char
OUT
BRnzp	POST_SPACE

END_SUBROUTINE
LD	R7,backup_R7;restore r7

RET


	
	
	
char16		.FILL	#16
space1		.FILL	#-12	
space2		.FILL	#-8	
space3		.FILL	#-4	
NEWLINE		.FILL	#10	
space_char	.FILL	#32	
backup_R7	.FILL	x0


.end