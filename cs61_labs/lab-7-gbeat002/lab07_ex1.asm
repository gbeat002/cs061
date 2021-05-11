;=================================================
; Name: grant
; Email:  gbeat002
; GitHub username: 
; 
; Lab: lab 7
; Lab section: 
; TA: 
;=================================================



.orig x3000
LD R7, SBRTN
JSRR R7

add r1, r1, #1
LD R7, SBRTN2
JSRR R7


HALT

SBRTN2 .fill x5000
SBRTN .fill x4000

.ORIG x4000
st r7, LOCR7
; Program begins here
;-------------
;Instructions
;-------------

;-------------------------------
;INSERT CODE STARTING FROM HERE 
;--------------------------------
BSTART
  LD R0, introMessagePtr
  PUTS
  
  
and r1, r1, #0; Sum
and r3, r3, #0; Sign
  LD R2, counter6
  
REPEAT
  GETC
  
  LD r6, N_NEWLINE
  add r4, r6, r0
  BRz ENTER
  
OUT_CHARACTER
OUT
POST_O
  
  LD r6, MPLUSS
  add r4, R0, r6
   BRz SSYMBOL
   
   LD r6, MMINUS
  add r4, R0, r6
   BRz SMSYMBOL

   LD r6, MAX
   add r4, r0, r6
   BRp EWNL
   
   LD r6, MIN
   add r4, r0, r6
   BRn EWNL
   
   ;within number range
   
   add r4, r2, #-6
   BRz FIRST
   
   ADD r1, r1, r1
   ADD r6, r1, r1
   ADD r6, r6, r6
   ADD r1, r1, r6
   ;add input to r5
   LD r6, MIN
   add r0, r0, r6
   add r1, r1, r0
   ;decrease counter
   add r2, r2, #-1
   BRp REPEAT
   BRz FINISH
   
   
   
SMSYMBOL
   add r3, r3, #1; set negative trigger to one
SSYMBOL
   Add r4, r2, #-6
   BRnp EWNL ;if not zero not first char
   add r2, r2, #-1
   BRnzp REPEAT
   
   ENTER
   Add r4, r2, #-5
   BRzp EWNL
   BRn FINISH
   
   
   
FIRST
   LD r6, MIN
   add r0, r0, r6
   add r1, r1, r0
   add r2, r2, #-2
   BRnzp REPEAT
   
EWNL 
  LD R0, NEWLINE
  OUT

TRUE_ERROR
  LD R0, errorMessagePtr
  PUTS
BRnzp BSTART

FINISH
add r4, r3, #0
BRz END_2

NOT r1, r1
ADD r1, r1, #1

END_2
LD R0, NEWLINE
OUT




and r0, r0, #0
and r2, r2, #0
and r3, r3, #0
and r4, r4, #0
and r6, r6, #0
LD r7, LOCR7
  RET
;---------------	
;Data
;---------------
LOCR7 .fill x0
counter6 .fill #6
N_NEWLINE .fill #-10
NEWLINE .fill #10
MPLUSS .fill #-43
MMINUS .fill #-45
MAX .fill #-57
MIN .fill #-48
introMessagePtr		.FILL x6000
errorMessagePtr		.FILL x6100

;------------
;Remote data
;------------
.ORIG x6000
;---------------
;messages
;---------------
intro .STRINGZ	"Input a positive or negative decimal number (max 5 digits), followed by ENTER\n"
;---------------
;error_messages
;---------------
.ORIG x6100	
error_msg1	.STRINGZ	"ERROR INVALID INPUT\n"

.orig x5000
st r7, LOCATR7

add r1, r1, #0
BRzp NNGO
ld r0, num48
add r0, r0,#-3
OUT
not r1,r1
add r1,r1, #1
NNGO



add r4, r1, #0
FIRST_LOOP
LD R5,TEN_G 
add r3, r3, #1
add r4, r4, r5
BRp FIRST_LOOP
BRz NEXT_ONE
add r3, r3, #-1
ld r5, TEN_GP
add r4, r4, r5
NEXT_ONE
ld r0, num48
add r0, r0,r3
out


and r3, r3,#0
SEC_LOOP
LD R5,ONEG 
add r3, r3, #1
add r4, r4, r5
BRp SEC_LOOP
BRz NEXT_ONE2
add r3, r3, #-1
ld r5, ONEGP
add r4, r4, r5
NEXT_ONE2
ld r0, num48
add r0, r0,r3
out


and r3, r3,#0
THR_LOOP
LD R5,HUN 
add r3, r3, #1
add r4, r4, r5
BRp THR_LOOP
BRz NEXT_ONE3
add r3, r3, #-1
ld r5, HUNP
add r4, r4, r5
NEXT_ONE3
ld r0, num48
add r0, r0,r3
out

and r3, r3,#0
FOR_LOOP
LD R5,TEN 
add r3, r3, #1
add r4, r4, r5
BRp FOR_LOOP
BRz NEXT_ONE4
add r3, r3, #-1
ld r5, ENTER2
add r4, r4, r5
NEXT_ONE4
ld r0, num48
add r0, r0,r3
out


and r3, r3,#0
FI_LOOP
LD R5,ONE 
add r3, r3, #1
add r4, r4, r5
BRp FI_LOOP
BRz NEXT_ONE5
add r3, r3, #-1
add r4, r4,#1
NEXT_ONE5
ld r0, num48
add r0, r0,r3
out










  LD r7, LOCATR7
  RET
  HUN		.FILL	#-100
  HUNP	.fill #100
LOCATR7 .fill #0
ONEG	.FILL	#-1000
ONEGP	.FILL	#1000
TEN_G	.FILL	#-10000
TEN_GP	.FILL	#10000
ONE		.FILL	#-1
ENTER2	.FILL	#10
TEN		.FILL	#-10
  num48	.fill #48

.END
;-------------------
;PURPOSE of PROGRAM
;-------------------
