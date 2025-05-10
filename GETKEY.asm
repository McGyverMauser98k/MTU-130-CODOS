GETKEY RUTINE - TO GET KEY FROM KEYBOARD (OTUPUT A - CHARACTER CODE OF KEY STRUCK, X AND Y PRESERVED)

 = $021B ; SOMETHING TEMP

TEMPX = $02CD ;TEMP SAVE REGISTER X
TEMPY = $02CE ;TEMP SAVE REGISTER Y
;$0220  .byte  $05 								;'DBCDLA' - WAIT TIME IN MILLISECONDS ALLOWED FOR CONTACT BOUNCE.
;$020D  .byte  $00                   				;KEY READ TABLE OFFSET - TO DETERMINE WHICH KEY WAS PRESSED

C975   8E CD 02   GETKEY    STX $02CD						;PRESERVE X REGISTER IN $02CD  
C978   8C CE 02             STY $02CE						;PRESERVE Y REGISTER IN $02CE
C97B   20 92 D0             JSR ONTCR						;TURN TEXT CURSOR ON
C97E   20 1C D1             JSR LD11C						;TURN ON I/O AREA AND SET $02F9 "SEEIO" SEMAPHORE
C981   20 D7 CA             JSR LCAD7						;READ $BFEC INPUT PORT
C984   A9 40                LDA #$40						;LOAD 64 IN TO ACCUMULATOR
C986   8D EE BF             STA $BFEE						;SYSTEM 1 6522 INTERRUPT ENABLE REGISTER - TURN OFF INTERRUPTS
C989   AD EB BF             LDA $BFEB						;SYSTEM 1 6522 AUXILIARY CONTROL REGISTER
C98C   29 3F                AND #$3F
C98E   8D EB BF             STA $BFEB						;SYSTEM 1 6522 AUXILIARY CONTROL REGISTER
C991   A0 00                LDY #$00						;RESET INDEX Y
C993   AE 20 02   LC993     LDX $DBCDLA						;WAIT TIME IN MILLISECONDS ALLOWED FOR CONTACT BOUNCE. 'DBCDLA' X=05
C996   20 85 CA   LC996     JSR LCA85						;SCAN KEYBOARD AND RESETS COLUMN COUNTER
C999   D0 2B                BNE LC9C6					;IF SOMETHING WAS PRESSED ON KEYBOARD ??
C99B   A9 00                LDA #$00
C99D   20 8B CA             JSR LCA8B						;RESETS KEYBOARD SCAN COUNTER
C9A0   F0 1B                BEQ LC9BD
C9A2   A2 07                LDX #$07
C9A4   AD 0D 02             LDA $020D					; INITIALLY 00
C9A7   DD DE CB   LC9A7     CMP $CBDE,X					;COMPARE WITH 
C9AA   F0 05                BEQ LC9B1
C9AC   CA                   DEX
C9AD   10 F8                BPL LC9A7
C9AF   30 E2                BMI LC993
C9B1   2C 0E 02   LC9B1     BIT $020E
C9B4   30 07                BMI LC9BD
C9B6   88                   DEY
C9B7   D0 DA                BNE LC993
C9B9   38                   SEC								;SET CARRY FLAG
C9BA   6E 0E 02             ROR $020E
C9BD   AD ED BF   LC9BD     LDA $BFED						;SYSTEM 1 6522 INTERRUPT FLAG REGISTER
C9C0   29 40                AND #$40
C9C2   F0 CF                BEQ LC993
C9C4   D0 4B                BNE LCA11
C9C6   CA         LC9C6     DEX								;INITIALLY X=5 SO NOW 4
C9C7   D0 CD                BNE LC996						;SCAN KEYBOARD 4 MORE TIMES
C9C9   8E 0E 02             STX $020E						;SAVE ACTUAL X IN $020E
C9CC   20 92 D0   LC9CC     JSR ONTCR						;TURN TEXT CURSOR ON
C9CF   A9 00      LC9CF     LDA #$00
C9D1   8D CA 02             STA $02CA
C9D4   AD 22 02             LDA CURDLA						;DETERMINES CURSOR BLINK SPEED, 0-NO BLINK 'CURDLA'
C9D7   4A                   LSR A
C9D8   6E CA 02             ROR $02CA
C9DB   8D CB 02             STA $02CB
C9DE   20 E0 CA   LC9DE     JSR LCAE0						;RESET KEYBOARD SCAN COUNTER
C9E1   D0 20                BNE LCA03
C9E3   AD CA 02             LDA $02CA
C9E6   D0 15                BNE LC9FD
C9E8   CE CB 02             DEC $02CB
C9EB   10 10                BPL LC9FD
C9ED   2C 1B 02             BIT $021B
C9F0   10 DA                BPL LC9CC
C9F2   AD 22 02             LDA CURDLA						;DETERMINES CURSOR BLINK SPEED, 0-NO BLINK 'CURDLA'
C9F5   F0 E7                BEQ LC9DE
C9F7   20 8C D0             JSR OFFTCR						;TURN OFF TEXT CURSOR
C9FA   4C CF C9             JMP LC9CF
C9FD   CE CA 02   LC9FD     DEC $02CA
CA00   4C DE C9             JMP LC9DE
CA03   20 8C D0   LCA03     JSR OFFTCR						;TURN OFF TEXT CURSOR
CA06   20 BD CA             JSR LCABD
CA09   20 85 CA   LCA09     JSR LCA85
CA0C   D0 D0                BNE LC9DE
CA0E   CA                   DEX
CA0F   D0 F8                BNE LCA09
CA11   AD 21 02   LCA11     LDA RPTRAT						;INTERCHARACTER REPEAT DELAY IN 256uS UNITS. 'RPTRAT' $C3=195
CA14   8D E5 BF             STA $BFE5						;SYSTEM 1 6522 TIMER 1
CA17   20 8C D0             JSR OFFTCR						;TURN OFF TEXT CURSOR
CA1A   20 F6 CA             JSR LCAF6						;DISPLAY CHARACTER ON SCREEN??
CA1D   20 6B D1             JSR LD16B						;KEYBOARD CLICK SOUND
CA20   2C 0F 02             BIT KBECHO						;IF BIT 7=1 THAN "ECHO" EACH KEY TO THE DISPLAY. 
CA23   10 03                BPL LCA28
CA25   20 E6 CB             JSR OUTCH						;TO DISPLAY CHARACTER FROM A TO SCREEN!!
CA28   AE CD 02   LCA28     LDX $02CD						;RECOVER INDEX X
CA2B   AC CE 02             LDY $02CE						;RECOVER INDEX Y
CA2E   4C 2F D1             JMP LD12F						;TURN OFF I/O AREA AND RTS
CA31   A9 00      IFKEY     LDA #$00						;'IFKEY' ROUTINE - TO TEST IF A KEY IS PRESSED WITHOUT MULTIPLE RECOGNITION LOCKOUT
CA33   8D 0D 02             STA $020D
CA36   8E CD 02   TSTKEY    STX $02CD						;'TSTKEY' ROUTINE - TO TEST IF A KEY IS PRESSED; HAS MULTIPLE RECOGNITION LOCKOUT
CA39   8C CE 02             STY $02CE
CA3C   20 1C D1             JSR LD11C						;TURN ON I/O AREA
CA3F   20 D7 CA             JSR LCAD7						;SET OUTPUT DATA REGISTER
CA42   AD 0D 02             LDA $020D						;RECOVER INDEX A
CA45   F0 16                BEQ LCA5D
CA47   20 8B CA             JSR LCA8B
CA4A   D0 03                BNE LCA4F
CA4C   18         LCA4C     CLC
CA4D   90 2D                BCC LCA7C
CA4F   AE 20 02   LCA4F     LDX DBCDLA						;Wait time in milliseconds allowed for contact bounce. 'DBCDLA'
CA52   20 85 CA   LCA52     JSR LCA85
CA55   F0 F5                BEQ LCA4C
CA57   CA                   DEX
CA58   D0 F8                BNE LCA52
CA5A   8E 0D 02             STX $020D
CA5D   20 E0 CA   LCA5D     JSR LCAE0
CA60   F0 19                BEQ LCA7B
CA62   20 BD CA             JSR LCABD
CA65   20 85 CA   LCA65     JSR LCA85
CA68   D0 0C                BNE LCA76
CA6A   CA                   DEX
CA6B   D0 F8                BNE LCA65
CA6D   20 F6 CA             JSR LCAF6						;DISPLAY CHARACTER ON SCREEN??
CA70   20 6B D1             JSR LD16B						;KEYBOARD CLICK SOUND
CA73   38                   SEC								;SET CARRY FLAG
CA74   B0 06                BCS LCA7C
CA76   A9 00      LCA76     LDA #$00
CA78   8D 0D 02             STA $020D
CA7B   18         LCA7B     CLC
CA7C   AE CD 02   LCA7C     LDX $02CD						;RECOVER INDEX X
CA7F   AC CE 02             LDY $02CE						;RECOVER INDEX Y
CA82   4C 2F D1             JMP LD12F						;TURN OFF I/O AREA AND RTS
CA85   20 B6 CA   LCA85     JSR LCAB6						;WASTE 1mS
CA88   AD 0D 02             LDA $020D					;INITIALLY HERE SHOULD BE 0
CA8B   20 1C D1   LCA8B     JSR LD11C						;TURN ON I/O AREA AND SET $02F9 "SEEIO" SEMAPHORE
CA8E   8D C5 BF             STA $BFC5						;RESET KEYBOARD SCAN COUNTER BY STORING ANYTHING TO $BFC5
CA91   86 FA                STX $FA							;STORE INITIAL DEBOUNCE TIME 5 TEMPORARLY IN $FA 
CA93   2C 6C CB   LCA93     BIT $CB6C						;READ BIT $0F - SO 16 COLUMNS(KEYS) PER ROW
CA96   F0 08                BEQ LCAA0						;IF 0 IN A THAN GO TO $CAA0 - INITIALIZATION
CA98   8D E1 BF             STA $BFE1						;SYSTEM 1 6522 KEYBOARD PORT DATA REGISTER
CA9B   38                   SEC								;SET CARRY FLAG
CA9C   E9 01                SBC #$01						;-1 OUT OF 16 POSSIBILITY COLUMNS
CA9E   D0 F3                BNE LCA93						;GO BACK TO PULSE ON ALL 16 COLUMNS
CAA0   4A         LCAA0     LSR A
CAA1   4A                   LSR A
CAA2   4A                   LSR A
CAA3   4A                   LSR A
CAA4   AA                   TAX								;INITIAL A=X=#$00
CAA5   BD B0 CA             LDA $CAB0,X						;LOAD FIRST ROW ($04) 
CAA8   A6 FA                LDX $FA							;LOAD X=5 FORM TEMPORARY BYTE
CAAA   2D E1 BF             AND $BFE1						;SYSTEM 1 6522 KEYBOARD PORT DATA REGISTER
CAAD   4C 2F D1             JMP LD12F						;TURN OFF I/O AREA AND RTS
CAB0   .byte $04                   							;%00000100 - keyboard ROW
CAB1   .byte $08       		    							;%00001000
CAB2   .byte $10											;%00010000
cab3   .byte $20        									;%00100000
CAB4   .byte $40       										;%01000000
CAB5   .byte $80                   							;%10000000
CAB6   A9 C5      LCAB6     LDA #$C5						;197
CAB8   E9 01      LCAB8     SBC #$01						;-1
CABA   D0 FC                BNE LCAB8						;TIME WAISTING LOOP
CABC   60                   RTS								;RETURN FROM SUBRUTINE
CABD   A2 05      LCABD     LDX #$05						;GENERATES OFFSET OF KEY PRESSED TO BE IDENTIFIED - STORED IN $020D
CABF   0A         LCABF     ASL A
CAC0   B0 03                BCS LCAC5
CAC2   CA                   DEX
CAC3   10 FA                BPL LCABF
CAC5   8A         LCAC5     TXA
CAC6   0A                   ASL A
CAC7   0A                   ASL A
CAC8   0A                   ASL A
CAC9   0A                   ASL A
CACA   84 FA                STY $FA
CACC   05 FA                ORA $FA
CACE   49 0F                EOR #$0F
CAD0   8D 0D 02             STA $020D						;OFFSET GENERATED
CAD3   AE 20 02             LDX DBCDLA						;WAIT TIME IN MILLISECONDS ALLOWED FOR CONTACT BOUNCE. 'DBCDLA'
CAD6   60                   RTS								;RETURN FROM SUBRUTINE
CAD7   AD EC BF   LCAD7     LDA $BFEC						;SYSTEM 1 6522 PERIPHERIAL CONTROL REGISTER
CADA   09 0B                ORA #$0B						;SET INPUT POSITIVE ACTIVE EDGE
CADC   8D EC BF             STA $BFEC						;SYSTEM 1 6522 PERIPHERIAL CONTROL REGISTER
CADF   60                   RTS								;RETURN FROM SUBRUTINE
CAE0   8D C5 BF   LCAE0     STA $BFC5						;RESET KEYBOARD SCAN COUNTER
CAE3   AD E1 BF             LDA $BFE1						;SYSTEM 1 6522 KEYBOARD PORT DATA REGISTER
CAE6   A0 0E                LDY #$0E
CAE8   AD E1 BF   LCAE8     LDA $BFE1						;SYSTEM 1 6522 KEYBOARD PORT DATA REGISTER
CAEB   29 FC                AND #$FC
CAED   49 FC                EOR #$FC
CAEF   D0 04                BNE LCAF5
CAF1   88                   DEY
CAF2   10 F4                BPL LCAE8
CAF4   C8                   INY
CAF5   60         LCAF5     RTS								;RETURN FROM SUBRUTINE
CAF6   AE 0D 02   LCAF6     LDX $020D						;OFFSET TO READ PROPER KEY PRESSED
CAF9   BD 5C CB             LDA $CB5C,X						;LOAD PROPER KEY CODE WHICH WAS PRESSED
CAFC   85 FA                STA $FA							;SAVE IDENTIFIED CHARACTER CODE TEMPORARLY *******HERE WE COULD PUT ASCII FROM TTY BUT SOME TRIGGER IS ALSO NEEDED*******
CAFE   8D C5 BF             STA $BFC5						;RESET KEYBOARD SCAN COUNTER
CB01   AD E1 BF             LDA $BFE1						;SYSTEM 1 6522 KEYBOARD PORT DATA REGISTER
CB04   2C 7C CB             BIT $CB7C						;#$20  -- 32 SPACE??
CB07   F0 1C                BEQ LCB25
CB09   2C 7D CB             BIT $CB7D						;#$40 -- 64 @??
CB0C   F0 17                BEQ LCB25
CB0E   29 10                AND #$10						;#$00 -- NULL-CTRL/SPACE ??
CB10   F0 04                BEQ LCB16
CB12   A5 FA                LDA $FA							;CHECK IT'S NOT ZERO
CB14   D0 35                BNE LCB4B
CB16   A5 FA      LCB16     LDA $FA							;CHECK IF IT'S LOWER CASE CHARACTER OR UPPER CASE
CB18   C9 61                CMP #$61						;LOWER CASE A
CB1A   90 2F                BCC LCB4B
CB1C   C9 7B                CMP #$7B						;L.C.Z+1 - UPPER CASE
CB1E   B0 2B                BCS LCB4B
CB20   38         LCB20     SEC								;SET CARRY FLAG
CB21   E9 20                SBC #$20						;FOLD LOWER TO UPPER CASE ALPFA
CB23   D0 26                BNE LCB4B
CB25   E0 3D      LCB25     CPX #$3D						;CHECK IS IT SMALL CASE CHARACTER
CB27   A5 FA                LDA $FA							
CB29   90 04                BCC LCB2F
CB2B   09 10                ORA #$10						
CB2D   B0 1C                BCS LCB4B
CB2F   C9 61      LCB2F     CMP #$61						;LOWER CASE A
CB31   90 06                BCC LCB39
CB33   C9 7B                CMP #$7B						;L.C.Z+1
CB35   90 E9                BCC LCB20
CB37   E9 1A                SBC #$1A
CB39   C9 5B      LCB39     CMP #$5B
CB3B   90 02                BCC LCB3F
CB3D   E9 1D                SBC #$1D
CB3F   38         LCB3F     SEC								;SET CARRY FLAG
CB40   E9 27                SBC #$27
CB42   10 03                BPL LCB47
CB44   A5 FA                LDA $FA	
CB46   60                   RTS								;RETURN FROM SUBRUTINE
CB47   AA         LCB47     TAX
CB48   BD BC CB             LDA $CBBC,X
CB4B   48         LCB4B     PHA								;SAVE ACCUMULATOR
CB4C   8D C5 BF             STA $BFC5						;RESET KEYBOARD SCAN COUNTER
CB4F   AD E1 BF             LDA $BFE1						;SYSTEM 1 6522 KEYBOARD PORT DATA REGISTER
CB52   29 08                AND #$08
CB54   D0 04                BNE LCB5A
CB56   68                   PLA								;RECOVER ACCUMULATOR
CB57   29 1F                AND #$1F
CB59   60                   RTS								;RETURN FROM SUBRUTINE
CB5A   68         LCB5A     PLA
CB5B   60                   RTS								;RETURN FROM SUBRUTINE

;KEYBOARD 96 KEYS
CB5C   00                   ;'NULL-CTRL/SPACE'
CB5D   1B                   ;'ESC'
CB5E   31 					;'1'
CB5F   32        			;'2'

CB60   33                 	;'3'
CB61   34                 	;'4'
CB62   35 					;'5'
CB63   36        			;'6'
CB64   37                 	;'7'
CB65   38        			;'8'
CB66   39					;'9'
CB67   30					;'0'
CB68   2D        			;'-'
CB69   3D					;'='
CB7A   60					;'`'
CB7B   08        			;'BACKSPACE'
CB6C   0F                 	;'SI CTRL/O'
CB6D   09 					;'TAB'
CB6E   71        			;'q'
CB6F   77                   ;'w'

CB70   65 					;'e'
CB71   72        			;'r'
CB72   74                   ;'t'
CB73   79					;'y'
CB74   75					;'u'
CB75   69        			;'i'
CB76   6F                   ;'o'
CB77   70					;'p'
CB78   5B        			;'['
CB79   5C                 	;'\'
CB7A   0A					;'LF LINE FEED'        
CB7B   7F                 	;'DELETE,RUBOUT'
CB7C   20 					;'SPACE SPACE BAR'
CB7D   40					;'@'
CD7E   61        			;'a'
CB7F   73                 	;'s'

CB80   64                 	;'d'
CB81   66					;'f'
CB82   67        			;'g'
CB83   68        			;'h'
CB84   6A        			;'j'
CB85   6B                 	;'k'
CB86   6C					;'l'
CB87   3B					;';'
CB88   27        			;'''
CB89   7B                 	;'{'
CB8A   0D					;'CR RETURN'
CB8B   00					
CB8C   00             
CB8D   00             
CB8E   20					;'SPACE SPACE BAR'
CB8F   7A					;'z'

CB90   78             		;'x'
CB91   63                   ;'c'
CB92   76					;'v'
CB93   62                	;'b'
CB94   6E					;'n'
CB95   6D 					;'m'
CB96   2C             		;','
CB97   2E 					;'.'
CB98   2F 					;'/'
CB99   A5             		;'DELETE'
CB9A   A6 					;'INSERT'
CB9b   2E                	;'.'
CB9C   00                   
CB9D   80               	;'F1'
CB9E   81 					;'F2'
CB9F   82               	;'F3'

CBA0   83               	;'F4'
CBA1   84 					;'F5'
CBA2   85               	;'F6'
CBA3   86					;'F7'
CBA4   87               	;'F8'
CBA5   A3               	;'CURSOR DOWN'
CBA6   A2					;'CURSOR RIGHT'
CBA7   8E                	;'ENTER - TRANSLATE TO $0D'
CBA8   A4					;'HOME'
CBA9   A1                	;'CURSOR LEFT'
CBAA   A0					;'CURSOR UP'
CBAB   30               	;'0'
CBAC   00                   
CBAD   8C					;'SUBTRACT '-' ON SCREEN'
CBAE   36					;'6'
CBAF   8D             		;'ADD '+' ON SCREEN'

CBB0   8B                   ;'DIVIDE '/' ON SCREEN'
CBB1   35 					;'5'
CBB2   8A                	;'MULTIPLY '*' ON SCREEN'
CBB3   39 					;'9'
CBB4   89 					;'PF2'
CBB5   31             		;'1'
CBB6   34                   ;'4'
CBB7   33                   ;'3'
CBB8   37                   ;'7'
CBB9   88                   ;'PF1'
CBBA   38              		;'8'
CBBB   32                   ;'2'

;MORE KEYS WITH SHIFT PRESSED
CBBC   22                   ;'"'
CBBD   00                   
CBBE   00                   
CBBF   00                   

CBC0   00                   
CBC1   3C                   ;'<'
CBC2   5F                   ;'_'
CBC3   3E					;'>'
CBC4   3F 					;'?'
CBC5   29             		;')'
CBC6   21					;'!'
CBC7   40                	;'@'
CBC8   23                   ;'#'
CBC9   24					;'$'
CBCA   25                	;'%'
CBCB   5E					;'^'
CBCC   26					;'&'
CBCD   2A             		;'*'
CBCE   28                   ;'('
CBCF   00                   

CBD0   3A                   ;':'
CBD1   00                   
CBD2   2B                   ;'+'
CBD3   5D					;']'
CBD4   7C					;'|'
CBD5   00             
CBD6   00             
CBD7   00             
CBD8   7E 					;'~'
CBD9   7D					;'}'
CBDA   00             
CBDB   00                   
CBDC   00                   
CBDD   7F                   ;'DELETE RUBOUT'
CBDE   0F                   ;'SI CTRL/O'
CBDF   1F                   ;'VS UNIT SEPARATOR'

CBE0   32                   ;'2'
CBE1   3D					;'='
CBE2   49					;'I'
CBE3   4A             		;'J'
CBE4   4D					;'M'
CBE5   4E 					;'N'

;SCRATCH AREA
;$02C7 - A BACKUP
;$02C8 - X BACKUP
;$02C9 - Y BACKUP


D08C   0E 1B 02   OFFTCR    ASL $021B						;'OFFTCR' ROUTINE - TO TURN THE TEXT CURSOR OFF IF IT'S ON
D08F   B0 05                BCS FLPTCR						;IF CARRY SET GO TO FLPTCR
D091   60                   RTS								;RETURN FROM SUBRUTINE
D092   38         ONTCR     SEC								;'ONTCR' ROUTINE - SET CARRY FLAG - TO TURN THE TEXT CURSOR ON
D093   6E 1B 02             ROR $021B

;'FLPTCR' ROUTINE - TO FLIP THE VIDEO SENSE OF THE CURSOR AT THE CURSOR POSITION - BASICALLY INVERTS CURSOR PIXEL POSITION 
;ARGUMENTS: COL - COLUMN NUMBER OF CHARACTER TO BE FLIPPED, LINE- LINE NUMBER OF CHARACTER TO BE FLIPPED


D096   48         FLPTCR    PHA								;PRESERVE A ON STACK
D097   8A                   TXA								
D098   48                   PHA								;PRESERVE X ON STACK
D099   98                   TYA
D09A   48                   PHA								;PRESERVE Y ON STACK
D09B   20 3B D1             JSR LD13B						;COMPUTE NEW CURSOR POSITION ON SCREEN - LOW BYTE OF VISABLE MEMORY IN A
D09E   20 A7 D0             JSR LD0A7						;DRAW ON SCREEN IN 6X10 CELLS HORIZONTALLY
D0A1   68                   PLA								
D0A2   A8                   TAY								;GET BACK Y FROM STACK
D0A3   68                   PLA								
D0A4   AA                   TAX								;GET BACK X FROM STACK						
D0A5   68                   PLA								;GET BACK A FROM STACK
D0A6   60                   RTS								;RETURN FROM SUBRUTINE


D13B   20 17 CF   LD13B     JSR LCF17						;POSITION OF TEXT CURSOR
D13E   48         LD13E     PHA								;PRESERVE A ON STACK	-	LOW BYTE OF VISABLE MEMORY IN A
D13F   A5 F2                LDA $F2							;LOW BYTE OF PLACE TO CHANGE ON VISABLE MEMORY
D141   85 F4                STA $F4							;LOW BYTE VISABLE MEMORY POINTER
D143   A5 F3                LDA $F3							;HIGH BYTE OF PAGE TO CHANGE ON VISABLE MEMORY
D145   85 F5                STA $F5							;HIGH BYTE VISABLE MEMORY PAGE
D147   68                   PLA								;GET BACK A FROM STACK
D148   60                   RTS								;RETURN FROM SUBRUTINE - LOW BYTE OF VISABLE MEMORY IN A

;$0200  .byte  $01        									;'COL' - CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80.
;$0201  .byte  $01                							;'LINE' - CURRENT LINE NUMBER OF TEXT CURSOR. 1-NLINET.
;$021E  .byte  $18                							;'NLINET' NUMBER OF TEXT LINES IN THE TEXT WINDOW. 24 LINES. 
;$021F  .byte  $00                  						;'YTDOWN' 255-(Y COORDINATE OF TOP OF THE TEXT WINDOW).
;$00FA														;TEMPORARY DATA TO COMPUTE CURSOR POSITION
;$00FC														;TEMPORARY VALUE 


;CURRENT POSITION OF THE TEXT CURSOR WITHIN THE TEXT WINDOW IS KEPT IN VARIABLES COL (1 TO 80) AND LINE (1 TO 25-10*YTDOWN)
CF17   AE 00 02   LCF17     LDX COL							;CURRENT COLUMN LOCATION OF TEXT CURSOR IN X
CF1A   F0 04                BEQ LCF20						;SKIP IF 0 SOMEHOW
CF1C   E0 51                CPX #$51						;CHECK IS IT END OF LINE - 81'ST CHARACTER
CF1E   90 05                BCC LCF25						;GO FOR NEW LINE
CF20   A2 01      LCF20     LDX #$01						;SET COLUMN 1 - FIRST 
CF22   8E 00 02             STX COL							;CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80 "COL"
CF25   AD 01 02   LCF25     LDA LINE						;CURRENT LINE NUMBER OF TEXT CURSOR - LINE
CF28   F0 07                BEQ LCF31						;SKIP IF 0 SOMEHOW
CF2A   CD 1E 02             CMP NLINET						;NUMBER OF MAX LINES IN TEXT WINDOW - 24
CF2D   90 07                BCC LCF36						;IN THE MIDDLE OF SCREEN
CF2F   F0 05                BEQ LCF36						;OR END OF LINE IF SAME
CF31   A9 01      LCF31     LDA #$01						;SET TOP OF SCREEN LINE 1
CF33   8D 01 02             STA LINE						;SAVE CURRENT LINE NUMBER OF TEXT CURSOR - LINE
CF36   85 FA      LCF36     STA $FA							;TEMP USED TO COMPUTE PROPER SCREEN POSITION VALUE
CF38   0A                   ASL A
CF39   0A                   ASL A
CF3A   65 FA                ADC $FA
CF3C   0A                   ASL A
CF3D   6D 1F 02             ADC YTDOWN						;255-(Y COORDINATTE OF TOP OF THE TEXT WINDOW - 'YTDOWN'
CF40   38                   SEC								;SET CARRY FLAG
CF41   E9 01                SBC #$01
CF43   20 63 CF             JSR LCF63						;COMPUTE SCREEN CURSOR POSITION WITH ACTUAL VALUES
CF46   CA                   DEX								;DECREMENT COLUMN LOCATION OF TEXT CURSOR
CF47   8A                   TXA								;PUT IT IN ACCUMULATOR - PREVIOUS COLUMN LOCATION IN A
CF48   E8                   INX								;INCRESE COLUMN LOCATION OF TEXT CURSOR - SO VALUE AS BEFORE
CF49   85 FA                STA $FA							;PREVIOUS CURSOR LOCATION ON SCREEN
CF4B   0A                   ASL A
CF4C   65 FA                ADC $FA
CF4E   48                   PHA								;PRESERVE PREVIOUS CURSOR LOCATION ON STACK
CF4F   0A                   ASL A
CF50   29 07                AND #$07						;ISOLATE 3 LOW BYTES
CF52   85 FC                STA $FC							;STORE IN TEMP VALUE FOR SOMETHING?
CF54   68                   PLA								;RESTORE PREVIOUS CURSOR LOCATION FROM STACK
CF55   4A                   LSR A
CF56   4A                   LSR A
CF57   18                   CLC
CF58   65 F2                ADC $F2							
CF5A   85 F2                STA $F2							;LOW BYTE OF VISABLE MEMORY 'CURSOR' PLACE
CF5C   90 02                BCC LCF60
CF5E   E6 F3                INC $F3							;UPDATE VISABLE MEMORY PAGE IF NEEDED
CF60   60         LCF60     RTS								;IN A - LOW BYTE OF VISABLE MEMORY, X - COLUMN LOCATION OF TEXT CURSOR $F2 -LOW BYTE CURSOR PLACE, $F3 -PAGE OF CURSOR PLACE

;$00FB														;TEMP VALUE TO COUNT VISABLE MEMORY POSITIONS OF LOW BYTE 

;UPDATE CURSOR POSITION ON SCREEN
CF63   48         LCF63     PHA								;PRESERVE A TO STACK
CF64   A9 00                LDA #$00						;LOAD #$00
CF66   85 FB                STA $FB							;STORE AT $FB - RESET $FB TO #$00
CF68   68                   PLA								;RESTORE A FROM STACK
CF69   0A                   ASL A
CF6A   26 FB                ROL $FB
CF6C   0A                   ASL A
CF6D   26 FB                ROL $FB
CF6F   85 FA                STA $FA							;TEMP VALUE TO COMPUTE SCREEN CURSOR POSITION
CF71   A5 FB                LDA $FB							;SECOND TEMPORARY VALUE
CF73   85 F3                STA $F3							;PAGE IN VISABLE MEMORY OF CURSOR POSITION
CF75   A5 FA                LDA $FA							;SAVE TEMP VALUE OF VISABLE MEMORY PAGE 
CF77   0A                   ASL A
CF78   26 F3                ROL $F3
CF7A   0A                   ASL A
CF7B   26 F3                ROL $F3
CF7D   0A                   ASL A
CF7E   26 F3                ROL $F3
CF80   0A                   ASL A
CF81   26 F3                ROL $F3
CF83   38                   SEC								;SET CARRY FLAG FOR SUBTRACTION
CF84   E5 FA                SBC $FA
CF86   85 F2                STA $F2						;UPDATED LOW BYTE OF VISABLE MEMORY CURSOR POSITION
CF88   A5 F3                LDA $F3							;LOAD VISABLE PAGE BYTE
CF8A   E5 FB                SBC $FB							
CF8C   18                   CLC
CF8D   69 C0                ADC #$C0						;START OF VISUAL MEMORY PAGE
CF8F   85 F3                STA $F3						;UPDATED PAGE OF CURSOR POSITION ON SCREEN`
CF91   60                   RTS								;RETURN FROM SUBRUTINE - A - PAGE OF CURSOR POSITION, $F3 - PAGE FOR CURSOR POSITION, $F2 - POINTER TO CURSOR POSITION

;DRAWING ROUTINE IN 6 BY 10 CELLS FONT/CURSOR 
;$02B2  - SCRATCH POINTER FOR FONT CELL
;$02B1	- SCRATCH POINTER FOR FONT CELL
;$F4 - LOW BYTE VISABLE MEMORY POINTER

D0A7   20 3E D1   LD0A7     JSR LD13E						;UPDATE BASE VISABLE MEMORY POINTER AND PAGE TO NEW CURSOR POSITION
D0AA   20 06 D1             JSR LD106						;CHANGE MEMORY BANK TO ENABLE SAVE TO VISABLE MEMORY AREA
D0AD   A6 FC                LDX $FC							;3 LOW BYTES OF PREVIOUS CURSOR LOCATION PLACE PRESERVED EARLIER - SO SOME PREDEFINIED CELLS POSITIONS
D0AF   BD FE D0             LDA D0FE,X
D0B2   8D B2 02             STA $02B2						;FIRST TEMP BYTE FOR DISPLAY FONT/CURSOR CELL
D0B5   BD F6 D0             LDA $D0F6,X
D0B8   8D B1 02             STA $02B1						;HIGH BYTE FOR DISPLAY FONT/CURSOR CELL
D0BB   A2 09                LDX #$09						;8 PASSES OF DRAWING
D0BD   A0 01      LD0BD     LDY #$01						;TWO BYTES UPDATE IN ONE PASS
D0BF   AD B2 02             LDA $02B2						;LOAD FIRST POINTER
D0C2   51 F4                EOR ($F4),Y						;REVERSE WHAT IS IN BYTE
D0C4   91 F4                STA ($F4),Y						;SAVE IT ON SCREEN
D0C6   88                   DEY
D0C7   AD B1 02             LDA $02B1						;SECOND POINTER PART
D0CA   51 F4                EOR ($F4),Y						;
D0CC   91 F4                STA ($F4),Y						;SAVE SECOND PART ON SCREEN
D0CE   20 49 D1             JSR LD149						;CHECK PIXEL POSITION IN LINE AND UPDATE VISABLE MEMORY PAGE IF NEEDED
D0D1   CA                   DEX								;DECREMENT X - FOR NEW CELL POSITION PART
D0D2   10 E9                BPL LD0BD						;DRAW WHOLE CELL
D0D4   4C 27 D1             JMP LD127						;GO BACK TO BANK 0 - DISABLES ACCESS TO VISABLE MEMORY
D0D7   20 3E D1   LD0D7     JSR LD13E						;UPDATE VISABLE MEMORY POINTERS TO PREVIOUS VALUES
D0DA   20 49 D1             JSR LD149						;CHECK PIXEL POSITION IN LINE AND UPDATE VISABLE MEMORY PAGE IF NEEDED
D0DD   20 06 D1             JSR LD106						;CHANGE MEMORY BANK TO ENABLE SAVE TO VISABLE MEMORY AREA
D0E0   A6 FC                LDX $FC							;3 LOW BYTES OF PREVIOUS CURSOR LOCATION PLACE PRESERVERD EARLIER - SOME PREDEFINIED CELL POSITIONS
D0E2   BD FE D0             LDA D0FE,X						;FIRST TEMP BYTE FOR DISPLAY FONT/CURSOR CELL
D0E5   A0 01                LDY #$01						;TWO BYTES UPDATE IN ONE PASS
D0E7   51 F4                EOR ($F4),Y						;REVERSE WHAT IS IN BYTE
D0E9   91 F4                STA ($F4),Y						;SAVE IT ON SCREEN
D0EB   88                   DEY
D0EC   BD F6 D0             LDA $D0F6,X						;SECOND BYTE TO UPDATE
D0EF   51 F4                EOR ($F4),Y						;REVERSE WHAT'S IN IT
D0F1   91 F4                STA ($F4),Y						;SAVE ON SCREEN
D0F3   4C 27 D1             JMP LD127						;GO BACK TO BANK 0 - DISABLES ACCESS TO VISABLE MEMORY

;EQUATES FOR CURSOR CELL POSITIONS
D0F6   FC        
D0F7   7E 
D0F8   3F 
D0F9   1F        
D0FA   0F        
D0FB   07        
D0FC   03        
D0FD   01 
;HIGH FOR CURSOR CELL POSITIONS
D0FE   00        
D0FF   00        
D100   00        
D101   80        
D102   C0 
D103   E0        
D104   F0
D105   F8        

D106   20 1C D1   LD106     JSR LD11C						;TURN ON I/O AREA SUBRUTINE - DISABLES RAM AREA BE00-BFFF -2 PAGES 512 BYTES AND TURN ON I/O AREA
D109   AD E0 BF             LDA $BFE0						;SYSTEM 1 6522 SYSTEM CONTROL PORT DATA REGISTER
D10C   09 03                ORA #$03
D10E   49 01                EOR #$01				;SWITCH TO BANK 1 - VISABLE MEMORY - FOR KIM-1 SHOULD BE 00
D110   8D E0 BF             STA $BFE0						;SYSTEM 1 6522 SYSTEM CONTROL PORT DATA REGISTER
D113   AD E2 BF             LDA $BFE2						;SYSTEM 1 6522 SYSTEM CONTROL PORT DIRECTION REGISTER
D116   09 03                ORA #$03
D118   8D E2 BF             STA $BFE2						;SYSTEM 1 6522 SYSTEM CONTROL PORT DIRECTION REGISTER
D11B   60                   RTS								;RETURN FROM SUBRUTINE


;TURN ON I/O SPACE TO ENABLE INPUT AND OUTPUTS
D11C   08         LD11C     PHP								;PUSH PROCESOR STATUS ON STACK
D11D   38                   SEC								;SET CARRY FLAG
D11E   78                   SEI								;DISABLE INTERRUPTS
D11F   6E F9 02             ROR $02F9						;ROTATE RIGHT I-O space enable semaphore ("SEEIO") - TURN ON I/O AREA - THAT'S DISABLE RAM AREA THERE.
D122   8D FE FF             STA $FFFE						;ENABLE I/O SPACE BE00-BFFF BY WRITING "ANYTHING" IN TO $FFFE
D125   28                   PLP								;PULL PROCESSOR STATUS FROM STACK
D126   60                   RTS								;RETURN FROM SUBRUTINE


D127   AD E0 BF   LD127     LDA $BFE0						;SYSTEM 1 6522 SYSTEM CONTROL PORT DATA REGISTER
D12A   09 03                ORA #$03				;GO BACK TO BANK 0
D12C   8D E0 BF             STA $BFE0						;SYSTEM 1 6522 SYSTEM CONTROL PORT DATA REGISTER
D12F   08         LD12F     PHP								;PUSH PROCESSOR STATUS ON STACK
D130   78                   SEI								;DISABLE INTERRUPTS
D131   0E F9 02             ASL $02F9						;ASL I-O space enable semaphore ("SEEIO") - SET BACK - TURN OFF I/O AREA
D134   30 03                BMI LD139						;BRANCH ON RESULT MINUS
D136   8D FF FF             STA $FFFF						;DISABLE I/O SPACE BE00-BFFF BY WRITING "ANYTHING" IN TO $FFFF - THAT'S UNCOVER RAM AREA THERE.
D139   28         LD139     PLP								;PULL PROCESSOR STATUS FROM STACK
D13A   60                   RTS								;RETURN FROM SUBRUTINE


D13E   48         LD13E     PHA								;SAVE A ON STACK
D13F   A5 F2                LDA $F2							;UPDATED VISABE MEMORY POINTER
D141   85 F4                STA $F4							;CURRENT VISABLE MEMORY POINTER
D143   A5 F3                LDA $F3							;UPDATED VISABLE MEMORY PAGE
D145   85 F5                STA $F5							;CURRENT VISABLE MEMORY PAGE
D147   68                   PLA								;RESTORE LOW BYTE OF VISABLE MEMORY FROM STACK
D148   60                   RTS								;RETURN FROM SUBRUTINE - A PRESERVED LOW VISABLE MEMORY BYTE

D149   A5 F4      LD149     LDA $F4
D14B   38                   SEC								;SET CARRY FLAG
D14C   E9 3C                SBC #$3C						;LINE END FOR CHARACTERS - #$3C - 480PIX, FOR K-1008 - #$28 - 320 PIX LINE COUNT OF PIXELS
D14E   85 F4                STA $F4							;UPDATE LOW VISABLE MEMORY POINTER
D150   B0 02                BCS LD154						;CHECK END OF PAGE
D152   C6 F5                DEC $F5							;UPDATE VISABLE MEMORY PAGE
D154   60         LD154     RTS	