                                                                        INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
;VARIABLE DECLARATION 
N DW ? 
M DW ?  
FIRST DW ?
SECOND DW ?
COUNTER DW 0 
TEMP DW ? 
I DW ?
S DW 0
C DW ? 
J DW ? 
COUNT DB 0


.CODE
       
       ;CODE SEGMENTS
       MAIN PROC 
        
      MOV AX,@DATA
      MOV DS,AX
      
      
      
      XOR CX,CX
      XOR BX,BX
      
      ;TAKING INPUT 1
      
      FOR1:
      MOV AH,1
      INT 21H
      mov AH,0
      CMP AL,0DH
      JE END_FOR1
      SUB AL,48
      MOV N,AX
      MOV AX,10
      MUL BX
      ADD AX,N
      MOV BX,AX
      JMP FOR1
      
      END_FOR1:
     ; PRINTN
     MOV AH, 2
          ;PRINT NEW LINE 
          MOV DL, 0DH
          INT 21H
          MOV DL, 0AH
          INT 21H 
      
      
     
      
      MOV N,BX
      MOV FIRST,BX  
      
      XOR BX,BX
      XOR AX,AX  
      
      
      
      FOR2:
      MOV AH,1
      INT 21H
      MOV AH,0
      CMP AL,0DH
      JE END_FOR2
      SUB AL,48
      MOV M,AX
      MOV AX,10
      MUL BX
      ADD AX,M
      MOV BX,AX
      JMP FOR2
      
      END_FOR2:
      PRINTN 
      
       
       
       
       
       
       
      MOV M,BX
      MOV SECOND,BX
      
      
      ;
      ;
      ;CHECK THE BIGGER NUMBER
      
     ; CMP N,BX 
     ; JGE DISGUSTING
     ; JL NEXT
      
     ; DISGUSTING: ;N ER MODDHE CHHOTO VALUE R M ER MODDHE BORO VALUE
      
     ; MOV TEMP,BX
     ; MOV BX,N
     ; MOV M,BX
     ; MOV BX,TEMP
     ; MOV N,BX
      
      
      
      
       MOV BX,N
      
      NEXT: 
      MOV I,BX
      MOV CX,M 
      
      ;outer loop
      FOR:
      CMP I,CX
      JG END_FOR
      MOV C,1
      MOV BX,I
      MOV J,BX
      
      WHILE:
      CMP J,1
      JLE ENDWHILE
      ;MOV AX,J
      ;MOV BX,2
      ;DIV BX
      ;CMP DX,0
      ;JE EVEN
      ;JMP ODD
      TEST J,1
      JZ EVEN
      JMP ODD
      
      
      
      EVEN:
      MOV AX,J
      MOV BX,2
      DIV BX
      MOV J,AX
      INC C
      
      JMP WHILE
      
      
      
      ODD:
      MOV AX,J
      MOV BX,3
      MUL BX
      ADD AX,1
      MOV J,AX
      INC C
      
      JMP WHILE
      
      
     
      ENDWHILE:
      MOV BX,S
      CMP C,BX
      JG GREATER
      JLE END1
         GREATER:
         MOV BX,C
         MOV S,BX
         
         END1:
         INC I
         JMP FOR
     
     
     
     
     
     
     
      END_FOR:
      
    ;  MOV AH,2
    ;  MOV DX,S
    ;  INT 21H   
    ;  MOV DX,SECOND
    ;  INT 21H
          MOV AH, 2
          ;PRINT NEW LINE 
          MOV DL, 0DH
          INT 21H
          MOV DL, 0AH
          INT 21H  
          ;OUTPUT PRINT
           
           MOV AX,S 
           
           MOV BX,AX 
           MOV CX,10000D 
            OUTPUT_LOOP:
               
            MOV AX , BX
            MOV DX , 0D
            DIV CX
            MOV BX , DX;REM IN BX 
            MOV DX , AX;AND QUOT IN DX                
            
            
            MOV AH , 2
            ADD DX , 48
            INT 21H
            ;MOV BX , CX
            
            ;
            MOV DX , 0D
            MOV AX , CX
            MOV CX , 10D
            DIV CX
            MOV CX , AX
            CMP COUNT , 4D
            JE EXIT
            INC COUNT
            JMP OUTPUT_LOOP

     
     
     
     
       
     
    EXIT:
      
      MOV AH,4CH
      INT 21H
      MAIN ENDP
       END MAIN