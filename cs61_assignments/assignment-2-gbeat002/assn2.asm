;=================================================
; Name: Grant Beatty
; Email: gbeat002@ucr.edu
; GitHub username: gbeat002
; 
; Assignment name: Assignment 2
; Lab section: 
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team.
;
;=================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------



;----------------------------------------------
;output prompt
;----------------------------------------------	
LEA R0, intro			; get starting address of prompt string
PUTS			    	; Invokes BIOS routine to output string

;-------------------------------
;INSERT YOUR CODE BELOW
;--------------------------------
Trap x20
Trap x21
ADD R1, R0, #0
LEA R0, NEWLINE			; get starting address of prompt string
PUTS
Trap x20
Trap x21
ADD R2, R0, #0
LEA R0, NEWLINE			; get starting address of prompt string
PUTS


ADD R0, R1, #0
OUT

LEA R0, DASH			; get starting address of prompt string
PUTS

ADD R0, R2, #0
OUT

LEA R0, EQUALS			; get starting address of prompt string
PUTS

NOT R2, R2
ADD R2, R2, #1

ADD R3, R1, R2

ADD R0, R3, #0

BRzp IS_POSITIVE

LEA R0, MINUS			; get starting address of prompt string
PUTS
ADD R0, R3, #0
NOT R0, R0
ADD R0, R0, #1

IS_POSITIVE




ADD R0, R0, #12
ADD R0, R0, #12
ADD R0, R0, #12
ADD R0, R0, #12

OUT





LEA R0, NEWLINE			; get starting address of prompt string
PUTS


HALT				; Stop execution of program
;------	
;Data
;------
; String to explain what to input 
intro 	.STRINGZ	"ENTER two numbers (i.e '0'....'9')\n" 		; prompt string - use with PUTS. Note: already includes terminating newline!
NEWLINE .FILL '\n'	; newline character - use with OUT
.orig x3075
DASH	.STRINGZ	" - "
.orig x3100
EQUALS	.STRINGZ	" = "

.orig x3080
MINUS	.STRINGZ	"-"
;---------------	
;END of PROGRAM
;---------------	
.END

