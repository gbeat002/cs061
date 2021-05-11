;=================================================
; Name: Grant Beatty
; Email: gbeat002
; GitHub username: gbeat002
; 
; Assignment name: Assignment 4
; Lab section: 
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team.
;
;=================================================================================
;THE BINARY REPRESENTATION OF THE USER-ENTERED DECIMAL NUMBER MUST BE STORED IN R1
;=================================================================================

.ORIG x3000			; Program begins here
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
HALT
;---------------	
;Data
;---------------
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

;---------------
;END of PROGRAM
;---------------
.END
;-------------------
;PURPOSE of PROGRAM
;-------------------
