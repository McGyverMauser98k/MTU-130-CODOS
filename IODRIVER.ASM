; DISASSEMBLY OF CODOS 2.0 - IODRIVER.Z by Michal Starega 2025
; LOAD & INITIALIZE CONSOLE I-O DRIVERS.


COL			= $0200        	; CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80.
LINE		= $0201			; CURRENT LINE NUMBER OF TEXT CURSOR. 1-NLINET.
NLINET		= $021E			; NUMBER OF TEXT LINES IN THE TEXT WINDOW.
YTDOWN		= $021F			; 255-(Y COORDINATE OF TOP OF THE TEXT WINDOW).
CURDLA		= $0222			; DETERMINES CURSOR BLINK SPEED, 0=NO BLINK.
NOLFCR		= $0210			; IF BIT 7=1 THEN NO AUTOMATIC LINE FEED AFTER CR.
NOSCRL		= $0211			; IF BIT 7=1 THEN INSTEAD OF SCROLLING, THE TEXT WINDOW IS CLEARED AND THE CURSOR IS HOMED WHEN TEXT GOES BEYOND THE BOOTOM LINE.
UNDRLN		= $0212			; IF BIT 7=1 THEN ALL CHARACTERS UNDERLINED WHEN DRAWN.
NOBELL		= $0214			; IF BIT 7=1 THEN BEL CHARACTER IS IGNORED.
RVIDEO		= $0215			; IF BIT 7=1 THEN CHARACTERS ARE DRAWN IN REVERSE VIDEO.
SHODEL		= $0216			; IF BIT 7=1 THEN DISPLAY DEL (ROBOUT) AS A CHARACTER SHAPE
SHOUL		= $0217			; IF BIT 7=1 THEN CHARACTER CELL IS ERASED BEFORE THE UNDERLINE CHARACTER IS DRAWN.
EXCCP		= $0218			; IF BIT 7=1 THEN CALL USER CONTROL CHARACTER PROCESSOR.
EXTHI		= $0219			; IF BIT 7=1 THEN CALL USER RUTINE TO PROCESS ALL CHARACTERS WHEN BIT 7 SET.
EXFONT		= $021A			; IF BIT 7=1 THEN USE EXTERNAL FONT TABLE.
BELPER		= $0227			; BELL SOUND WAVEFORM PERIOD IN UNITS OF 200 MICROSECONDS.
BELVOL		= $0228			; BELL SOUND VOLUME, $00 = MINIMUM, $7F MAXIMUM.
BELCY		= $0229			; BELL SOUND DURATION IN UNITS OF COMPLETE WAVEFORM CYCLES.
QEXCC		= $022F			; ADDRESS OF EXTERNAL CONTROL CHARACTER PROCESSOR IF USED.
QEXFNT		= $0231			; ADDRESS OF EXTERNAL FONT TABLE IF USED.
QEXHI7		= $0233			; ADDRESS OF EXTERNAL PROCESSOR FOR CHARACTERS WITH BIT 7=1
EXFTBK		= $0237			; MEMORY BANK NUMBER CONTAINING EXTERNAL FONT TABLE.
KBECHO		= $020F			; IF BIT 7=1 THEN "ECHO" EACH KEY TO THE DISPLAY.
NOCLIK		= $0213			; IF BIT 7=1 THEN NO CLICK WHEN A KEY IS PRESSED.
DBCDLA		= $0220			; WAIT TIME IN MILLISECONDS ALLOWED FOR CONTACT BOUNCE.
RPTRAT		= $0221			; INTERCHARACTER REPEAT DELAY IN 256uS UNITS.
CLKPER		= $0224			; CLICK WAVEFORM PERIOD IN UNITS OF 200 MICROSECONDS.
CLKVOL		= $0225			; CLICK VOLUME, $00 = MINIMUM, $7F = MAXIMUM.
CLKCY		= $0226			; CLICK DURATION IN UNITS OF COMPLETE WAVEFORM CYCLES
YLNLIM		= $0238			; LINE SIZE LIMIT FOR INLINE AND ENDLINE ENTRY POINTS
UKINLN		= $023A			; IF BIT 7=1 THEN IRRECOGNIZED KEYS ARE ACCEPTED FOR ENTRY POINTS INLINE AND ENDLINE.
OUTCH		= $0309			; TO DISPLAY A PRINTABLE CHARACTER OR INTERPRET A CONTROL CHARACTER
INITIO		= $030F			; TO CLEAR THE SCREEN AND SET DEFAULT VALUES OF DISPLAY PARAMETERS



;FILE HEADER 58 00 00 00 0F 03 00 02 3E 00

;$0200-027F CONTAINS A NUMBER OF PARAMETERS THAT AFFECT THE "FEEL" OF THE CONSOLE TO A GREAT EXTENT.

* = $0200
0200  .byte  $01        						;'COL' - CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80.
0201  .byte  $01                				;'LINE' - CURRENT LINE NUMBER OF TEXT CURSOR. 1-NLINET.
0202  .byte  $00                  	 			;X COORDINATE OF THE GRAPHIC CURSOR POSITION, 2 BYTES.
0203  .byte  $00                   
0204  .byte  $00                   				;Y COORDINATE OF THE GRAPHIC CURSOR POSITION, 2 BYTES.
0205  .byte  $00                   
0206  .byte  $00                   				;X GRAPHIC COORDINATE "REGISTER", 2 BYTES.
0207  .byte  $00                   
0208  .byte  $00                   				;Y GRAPHIC COORDINATE "REGISTER", 2 BYTES.
0209  .byte  $00                   
020A  .byte  $80                  				;'GMODE' - GRAPHIC DRAWING MODE, $00=MOVE, $40=ERASE, $80=DRAW, $C0=FLIP. ADD $20 FOR DASHED LINES.
020B  .byte  $F0	                			;'DSHPAT' ;RECIRCULATING DASHED LINE PATTERN, EACH 1 BIT=DOT ON, 2 BYTES.
020C  .byte  $F0
020D  .byte  $00                   				;KEY READ TABLE OFFSET - TO DETERMINE WHICH KEY WAS PRESSED
020E  .byte  $00                   
020F  .byte  $00                				;'KBECHO' - IF BIT 7=1 THEN "ECHO" EACH KEY TO THE DISPLAY.   
0210  .byte  $00                   				;'NOLFCR' - IF BIT 7=1 THEN NO AUTOMATIC LINE FEED AFTER CR.
0211  .byte  $00                   				;'NOSCRL' - IF BIT 7=1 THEN INSTEAD OF SCROLLING, THE TEXT WINDOW IS CLEARED AND THE CURSOR IS HOMED WHEN TEXT GOES BEYOND THE BOOTOM LINE.
0212  .byte  $00                   				;'UNDRLN' - IF BIT 7=1 THEN ALL CHARACTERS UNDERLINED WHEN DRAWN.
0213  .byte  $00              					;'NOCLIK' - PRESENCE OF AUDIBLE KEY CLICK. DEFAULT VALUE: $00 - IF BIT 7=1 THEN NO CLICK WHEN A KEY IS PRESSED.
0214  .byte  $00                  	 			;'NOBELL' - IF BIT 7=1 THEN BEL CHARACTER IS IGNORED.
0215  .byte  $00                   				;'RVIDEO' - IF BIT 7=1 THEN CHARACTERS ARE DRAWN IN REVERSE VIDEO.
0216  .byte  $00                   				;'SHODEL' - IF BIT 7=1 THEN DISPLAY DEL (ROBOUT) AS A CHARACTER SHAPE
0217  .byte  $00                   				;'SHOUL' - IF BIT 7=1 THEN CHARACTER CELL IS ERASED BEFORE THE UNDERLINE CHARACTER IS DRAWN.
0218  .byte  $00                   				;'EXCCP' - IF BIT 7=1 THEN CALL USER CONTROL CHARACTER PROCESSOR.
0219  .byte  $00                   				;'EXTHI' - IF BIT 7=1 THEN CALL USER RUTINE TO PROCESS ALL CHARACTERS WHEN BIT 7 SET.
021A  .byte  $00                   				;'EXFONT' - IF BIT 7=1 THEN USE EXTERNAL FONT TABLE.
021B  .byte  $00                   
021C  .byte  $00                   
021D  .byte  $00                   
021E  .byte  $18                				;'NLINET' NUMBER OF TEXT LINES IN THE TEXT WINDOW. 24 LINES.   
021F  .byte  $00                   				;'YTDOWN' 255-(Y COORDINATE OF TOP OF THE TEXT WINDOW).
0220  .byte  $05 								;'DBCDLA' - WAIT TIME IN MILLISECONDS ALLOWED FOR CONTACT BOUNCE.
0221  .byte  $C3                				;'RPTRAT' - KEYBOARD REPEAT RATE. DEFAULT VALUE: $C3; INTERCHARACTER REPEAT DELAY IN 256uS UNITS.
0222  .byte  $06 								;'CURDLA' - CURSOR FLASH RATE. DEFAULT VALUE: $06
0223  .byte  $05                  
0224  .byte  $05 								;'CLKPER' - PITCH OF AUDIBLE KEY CLICK. DEFAULT VALUE: $05 - CLICK WAVEFORM PERIOD IN UNITS OF 200 MICROSECONDS.
0225  .byte  $20                				;'CLKVOL' - VOLUME OF AUDIBLE KEY CLICK. DEFAULT VALUE: $20	- CLICK VOLUME, $00 = MINIMUM, $7F = MAXIMUM.
0226  .byte  $02                   				;'CLKCY' - DURATION OF AUDIBLE KEY CLICK. DEFAULT VALUE: $02 - CLICK DURATION IN UNITS OF COMPLETE WAVEFORM CYCLES
0227  .byte  $05								;'BELPER' - PITCH OF AUDIBLE BELL TONE. DEFAULT VALUE: $05 - BELL SOUND WAVEFORM PERIOD IN UNITS OF 200 MICROSECONDS.
0228  .byte  $40                				;'BELVOL' - VOLUME OF AUDIBLE BELL TONE. DEFAULT VALUE: $40	- BELL SOUND VOLUME, $00 = MINIMUM, $7F MAXIMUM.
0229  .byte  $0C                   				;'BELCY' - DURATION OF AUDIBLE KEY CLICK. DEFAULT VALUE: $0C - BELL SOUND DURATION IN UNITS OF COMPLETE WAVEFORM CYCLES.
022A  .byte  $07                   
022B  .byte  $08                   
022C  .byte  $09 
022D  .byte  $0C                
022E  .byte  $18                   
022F  .byte  $1B   								;'QEXCC' - ADDRESS OF EXTERNAL CONTROL CHARACTER PROCESSOR IF USED. LOW BYTE               
0230  .byte  $03                   
0231  .byte  $1B         						;'QEXFNT' - ADDRESS OF EXTERNAL FONT TABLE IF USED. LOW BYTE         
0232  .byte  $03                   
0233  .byte  $1B        						;'QEXHI7' - ADDRESS OF EXTERNAL PROCESSOR FOR CHARACTERS WITH BIT 7=1           
0234  .byte  $03              
0235  .byte  $50 								; CHARACTER FONT TABLE IN MEMORY LOW BYTE
0236  .byte  $FD                				; CHARACTER FONT TABLE IN MEMORY HIGH BYTE
0237  .byte  $00          						;'EXFTBK' - MEMORY BANK NUMBER CONTAINING EXTERNAL FONT TABLE.         
0238  .byte  $C0								;'YLNLIM' - LINE SIZE LIMIT FOR INLINE AND ENDLINE ENTRY POINTS
0239  .byte  $00                
023A  .byte  $00              					;'UKINLN' - IF BIT 7=1 THEN IRRECOGNIZED KEYS ARE ACCEPTED FOR ENTRY POINTS INLINE AND ENDLINE.     
023B  .byte  $BC								; KEYBOARD SPECIAL KEYS TABLE
023C  .byte  $C5
023D  .byte  $00             
.END 
 

;FILE .byte HEADER 58 00 00 00 0F 03 06 03 90 00

;JUMP TABLE TO I-O ROUTINES, GRAPHICS, ETC. 

* = $0306
0306   4C 75 C9             JMP $C975			; GETKEY - TO WAIT UNTIL A KEYBOARD KEY IS STRUCK AND RETURN WITH CHARACTER IN A.
0309   4C E6 CB             JMP $CBE6			; OUTCH - TO DISPLAY A PRINTABLE CHARACTER OR INTERPRET A CONTROL CHARACTER
030C   4C 36 CA             JMP $CA36			; TSTKEY - TO TEST IF A KEY IS PRESSED; HAS MULTIPLE RECOGNITION LOCKOUT.
030F   4C 11 CD             JMP $CD11			; INITIO - TO CLEAR THE SCREEN AND SET DEFAULT VALUES OF DISPLAY PARAMETERS
0312   4C 95 CD             JMP $CD95			; CLRDSP - TO CLEAR THE ENTIRE 480 BY 256 SCREEN
0315   4C D1 D1             JMP $D1D1			; DRWLEG - TO DRAW THE FUNCTION KEY LEGEND BOXES AND THEIR LABELS
0318   4C 1B 03             JMP L031B			
031B   4C 18 E6   L031B     JMP $E618			; SKIPS GRAPHIC RUTINES IF NO GRAPHIC DRIVER
031E   4C 19 C6             JMP $C619			; INLINE - TO INPUT ENTIRE LINE FROM THE KEYBOARD, TITH EDITING PERMITTED.
0321   4C 1B C6             JMP $C61B			; EDLINE - TO EDIT AN ENTIRE LINE USING THE KEYBOARD.
0324   4C 1B 03             JMP L031B			; SDRAW - TO DRAW A SOLID VECTOR FROM THE CURSOR TO (XX,YY)
0327   4C 1B 03             JMP L031B			; SMOVE - TO MOVE GRAPHIC CURSOR TO (XX,YY) WITHOUT DRAWING.
032A   4C 1B 03             JMP L031B			; SDRAWR - TO DRAW A SOLID WHITE VECTOR RELATIVE TO THE CURSOR.
032D   4C 1B 03             JMP L031B			; SMOVER - TO MOVE THE GRAPHIC CURSOR RELATIVE TO ITS PRESENT POSITION.
0330   4C 1B 03             JMP L031B			; SVEC - TO DRAW A VECTOR FROM THE CURSOR TO (XX,YY) ACCORDING TO GMODE AND DSHPAT
0333   4C 1B 03             JMP L031B			; SVECR - TO DRAW A VECTOR RELATIVE TO THE CURSOR ACCORDING TO GMODE AND DSHPAT
0336   4C 1B 03             JMP L031B			; SDOT - TO DRAW A SINGLE DOT (PIXEL) AT (XX,YY) ACCORDING TO GMODE
0339   4C 1B 03             JMP L031B			; SDOTR - TO DRAW A SINGLE DOT (PIXEL) AT A POSITION RELATIVE TO THE CURSOR ACCORDING TO GMODE
033C   4C 1B 03             JMP L031B			; SGRIN - TO ALLOW USER COORDINATE INPUT BY MANEUVERING A CURSOR WITH THE KEYBOAR CURSOR CONTROL KEYS.
033F   4C 1B 03             JMP L031B			; SLTPEN - ACTIVATE LIGHT PEN FFOR ONE FRAME AND RETURN COORDINATES OF HIT, IF ANY.
0342   4C 1B 03             JMP L031B
0345   4C 1B 03             JMP L031B			; SDRWCH - TO DRAW A SINGLE CHARACTER AT (XX,YY)
0348   4C 1B 03             JMP L031B			; SISDOT - TO DETERMINE PIXEL AT (XX,YY) IS ON OR OFF.
034B   4C 1B 03             JMP L031B			; SOFFGC - TO TURN OFF THE GRAPHIC CROSSHAIR CURSOR.
034E   4C 1B 03             JMP L031B			; SONGC - TO TURN ON THE GRAPHIC CROSSHAIR CURSOR.
0351   4C 1B 03             JMP L031B			; SINTLP - WAIT FOR END OF FRAME AND THEN ACTIVATE THE LIGHT PEN.
0354   4C 1B 03             JMP L031B			; STSTLP - TEST FOR LIGHT PEN HIT AND RETURN COORDINATES IF A HIT.
0357   4C 1B 03             JMP L031B
035A   4C 1B 03             JMP L031B
035D   4C 1B 03             JMP L031B
0360   4C 31 CA             JMP $CA31			; IFKEY - TO TEST IF A KEY IS PRESSED WITHOUT MULTIPLE RECOGNITION LOCKOUT.
0363   4C 36 CD             JMP $CD36			; INITTW - TO INITIALIZE THE TEXT WINDOW TO 24 LINES AND CLEAR THE TEXT WINDOW ONLY
0366   4C 69 CD             JMP $CD69			; DEFTW - TO SET THE POSITION AND SIZE OF THE TEXT WINDOW
0369   4C 6F CD             JMP $CD6F			; CLRHTW - TO CLEAR THE TEXT WINDOW AND HOME THE CURSOR.
036C   4C 72 CD             JMP $CD72			; HOMETW - TO PLACE THE CURSOR IN THE HOME POSITION (COL=1, LINE=1)
036F   4C 7D CD             JMP $CD7D			; CRLF - TO MOVE CURSOR TO THE LEFT SCREEN EDGE AND DOWN ONE LINE
0372   4C AF CD             JMP $CDAF			; CLRTW - TO CLEAR THE TEXT WINDOW WITHOUT MOVING THE CURSOR
0375   4C DD CD             JMP $CDDD			; CLRLEG - TO CLEAR THE LEGEND DISPLAY AREA (BOTTOMMOST 16 SCAN LINES)
0378   4C F3 CD             JMP $CDF3			; CLRTLN - TO CLEAR A SPECIFIED TEXT LINE
037B   4C 41 CE             JMP $CE41			; LINEFD - TO MOVE CURSOR DOWN  ONE TEXT LINE.
037E   4C 8C D0             JMP $D08C			; OFFTCR - TO TURN THE TEXT CURSOR OFF IF IT IS ON.
0381   4C 92 D0             JMP $D092			; ONTCR - TO TURN THE TEXT CURSOR ON
0384   4C 96 D0             JMP $D096			; FLPTCR - TO FLIP THE VIDEO SENSE OF THE CURSOR AT THE CURSOR POSITION
0387   4C 1C D1             JMP $D11C
038A   4C 2F D1             JMP $D12F
038D   4C 87 D1             JMP $D187			; BEEP - TO SOUND AN AUDIBLE BEEP
0390   4C 1B 03             JMP L031B
0393   4C 1B 03             JMP L031B
.END

;0400-04FF - FUNCTION KEY STRINGS MM
;0500-05BF - INPUT LINE BUFFER
;05C0-$05FF - FUNCTION KEY LEGENDS
;0600-06DF - OUTPUT LINE BUFFER


;FILE HEADER 58 00 00 00 0F 03 E0 06 20 00

;TABTBL - TAB STOP TABLE. $06E0-$06FF AREA.
;THIS PARAMETER IS ACTUALLY A LIST OF UP TO 32 TAB STOPS. THE VALUES STORED ACTUALLY REPRESENT THE COLUMN NUMBER THAT A TAB STOP IS LOCATED ON.
;THE FIRST ZERO VALUE MARKS THE END OF TABLE. THE VALUES MUST BE STORED IN ASCENDING SEQUENCE. REMEMBER THAT THE LEFTMOST CHARACTER POSITION IS COLUMN ONE, NOT ZERO!

* = $06E0
06E0  .byte 	$09
06E1  .byte 	$11                
06E2  .byte  	$19
06E3  .byte 	$21
06E4  .byte 	$29             
06E5  .byte 	$31
06E6  .byte 	$39                
06E7  .byte  	$41
06E8  .byte 	$49                
06E9  .byte  	$00                   
06EA  .byte  	$00                   
06EB  .byte  	$00                   
06EC  .byte  	$00                   
06ED  .byte  	$00                   
06EE  .byte  	$00                   
06EF  .byte  	$00                   
06F0  .byte  	$00                   
06F1  .byte  	$00                   
06F2  .byte  	$00                   
06F3  .byte  	$00                   
06F4  .byte  	$00                   
06F5  .byte  	$00                   
06F6  .byte  	$00                   
06F7  .byte  	$00                   
06F8  .byte  	$00                   
06F9  .byte  	$00                   
06FA  .byte  	$00                   
06FB  .byte  	$00                   
06FC  .byte  	$00                   
06FD  .byte  	$00                   
06FE  .byte  	$00                   
06FF  .byte  	$00                   
.END



; .org BANK0 - MTU-130 - 0 -C5B0 -> 5E18
; FILE HEADER: 58 00 00 00 0F 03 B0 C5 C3 0C (Start point: C5B0, lenght 0CC3, entry point 030F, Bank 0)

* = $C5B0
;KEYBOARD ENTRY
C5B0 .byte  $8A ;'*' MULTIPLY
C5B1 .byte  $2A ;'*' MULTIPLY
C5B2 .byte  $8B ;'/' DIVIDE
C5B3 .byte  $2F ;'/' DIVIDE
C5B4 .byte  $8C ;'-' MINUS
C5B5 .byte  $2D ;'-' MINUS
C5B6 .byte  $8D ;'+' PLUS
C5B7 .byte  $2B ;'+' PLUS
C5B8 .byte  $FF 
C5B9 .byte  $FF 
C5BA .byte  $FF 
C5BB .byte  $FF 

;KEYBOARD SPECIAL KEYS
C5BC .byte  $02 ;'STX'
C5BD .byte  $03 ;'ETX'
C5BE .byte  $05 ;'ENG'
C5BF .byte  $07 ;'BEL'
C5C0 .byte  $08 ;'BS'      
C5C1 .byte  $09 ;'HT'
C5C2 .byte  $0A ;'LF'      
C5C3 .byte  $0B ;'VT'      
C5C4 .byte  $0C ;'FF'     
C5C5 .byte  $0D ;'RETURN'
C5C6 .byte  $12 ;'DC2'
C5C7 .byte  $17 ;'ETB'      
C5C8 .byte  $18 ;'CAN'      
C5C9 .byte  $1A ;'SUB'      
C5CA .byte  $1B ;'ESC'      
C5CB .byte  $7F ;'DEL'      
C5CC .byte  $8E ;'ENTER'
C5CD .byte  $A0 ;'CURSOR UP'
C5CE .byte  $A1 ;'CURSOR LEFT'     
C5CF .byte  $A2 ;'CURSOR RIGHT'
C5D0 .byte  $A3 ;'CURSOR DOWN'     
C5D1 .byte  $A4 ;'HOME'
C5D2 .byte  $A5 ;'DELETE'      
C5D3 .byte  $A6 ;'INSERT'
C5D4 .byte  $B0 ;'SHIFT/CURSOR UP'   
C5D5 .byte  $B1 ;'SHIFT/CURSOR LEFT' 
C5D6 .byte  $B2 ;'SHIFT/CURSOR RIGHT' 
C5D7 .byte  $B3 ;'SHIFT/CURSOR DOWN' 
C5D8 .byte  $B4 ;'SHIFT/ HOME 
C5D9 .byte  $FF      
C5DA .byte  $FF      

;JUMP TABLE FOR UNKNOWN KEYBOARD ENTRY
C5DB .byte  $82       
C5DC .byte  $C6 
C5DD .byte  $03 ;'CTRL-C'      
C5DE .byte  $03            
C5DF .byte  $8B            
C5E0 .byte  $C6 
C5E1 .byte  $96             
C5E2 .byte  $C6 
C5E3 .byte  $9C             
C5E4 .byte  $C6
C5E5 .byte  $AE             
C5E6 .byte  $C6 
C5E7 .byte  $B4             
C5E8 .byte  $C6 
C5E9 .byte  $CF             
C5EA .byte  $C6 
C5EB .byte  $EB             
C5EC .byte  $C6 
C5ED .byte  $F4             
C5EE .byte  $C6 
C5EF .byte  $0A             
C5F0 .byte  $C7             
C5F1 .byte  $10 
C5F2 .byte  $C7             
C5F3 .byte  $16 
C5F4 .byte  $C7             
C5F5 .byte  $1C             
C5F6 .byte  $C7             
C5F7 .byte  $22             
C5F8 .byte  $C7             
C5F9 .byte  $28             
C5FA .byte  $C7             
C5FB .byte  $F4             
C5FC .byte  $C6 
C5FD .byte  $CF             
C5FE .byte  $C6 
C5FF .byte  $9C             
C600 .byte  $C6 
C601 .byte  $34             
C602 .byte  $C7             
C603 .byte  $B4 
C604 .byte  $C6             
C605 .byte  $46 
C606 .byte  $C7             
C607 .byte  $4C 
C608 .byte  $C7 
C609 .byte  $52             
C60A .byte  $C7             
C60B .byte  $CF             
C60C .byte  $C6 
C60D .byte  $59             
C60E .byte  $C7             
C60F .byte  $65 
C610 .byte  $C7             
C611 .byte  $B4 
C612 .byte  $C6             
C613 .byte  $EB             
C614 .byte  $C6 
C615 .byte  $00             
C616 .byte  $00             
C617 .byte  $00             
C618 .byte  $00             


C619   A0 00      INLINE    LDY #$00						;INLINE ROUTINE
C61B   84 FD      EDLINE    STY $FD							;EDLINE RUTINE
C61D   D8                   CLD								;CLEAR DECIMAL MODE
C61E   AD 3D 02             LDA $023D
C621   8D DA 02             STA $02DA
C624   8E D6 02             STX $02D6
C627   20 37 C8   LC627     JSR LC837
C62A   A9 00      LC62A     LDA #$00
C62C   8D D7 02             STA $02D7
C62F   20 75 C9   LC62F     JSR GETKEY						;GET KEYBOARD KEY CHARACTER
C632   C9 7F                CMP #$7F						;CHECK IF IT'S ASCII CHARACTER 00-7F
C634   B0 0A                BCS LC640
C636   C9 20                CMP #$20						;CHECK IF IT'S CONTROL CHARACTER OR SPACE?
C638   90 13                BCC LC64D
C63A   20 6F C7   LC63A     JSR LC76F
C63D   4C 2F C6             JMP LC62F
C640   F0 0B      LC640     BEQ LC64D
C642   C9 88                CMP #$88
C644   B0 07                BCS LC64D
C646   20 B3 C8             JSR LC8B3
C649   C9 0D                CMP #$0D
C64B   D0 E2                BNE LC62F
C64D   A2 1E      LC64D     LDX #$1E
C64F   DD BC C5   LC64F     CMP $C5BC,X						;CONTROL KEYS ARRARY
C652   F0 15                BEQ LC669
C654   CA                   DEX
C655   10 F8                BPL LC64F
C657   A2 0A                LDX #$0A
C659   DD B0 C5   LC659     CMP $C5B0,X						;ARITHMETIC KEYS
C65C   F0 1D                BEQ LC67B
C65E   CA                   DEX
C65F   CA                   DEX
C660   10 F7                BPL LC659
C662   2C 3A 02             BIT UKINLN						;If bit 7=1 then unrecognized keys are accepted for entry points INLINE and EDLINE. 'UKINLN'
C665   30 D3                BMI LC63A
C667   10 C6                BPL LC62F
C669   8A         LC669     TXA
C66A   0A                   ASL A
C66B   AA                   TAX
C66C   BD DB C5             LDA $C5DB,X
C66F   8D DC 02             STA $02DC
C672   BD DC C5             LDA $C5DC,X
C675   8D DD 02             STA $02DD
C678   6C DC 02             JMP ($02DC)
C67B   E8         LC67B     INX
C67C   BD B0 C5             LDA $C5B0,X						;ARITHMETIC KEYS
C67F   4C 3A C6             JMP LC63A
C682   20 17 C8             JSR LC817
C685   20 26 C9             JSR LC926
C688   4C 27 C6             JMP LC627
C68B   AD 39 02             LDA $0239
C68E   49 FF                EOR #$FF
C690   8D 39 02             STA $0239
C693   4C 2F C6             JMP LC62F
C696   20 55 D1             JSR LD155
C699   4C 2F C6             JMP LC62F
C69C   CC D5 02             CPY $02D5
C69F   F0 07                BEQ LC6A8
C6A1   88                   DEY
C6A2   20 F0 CE   LC6A2     JSR LCEF0
C6A5   4C 2A C6             JMP LC62A
C6A8   C4 FD      LC6A8     CPY $FD
C6AA   F0 F6                BEQ LC6A2
C6AC   D0 03                BNE LC6B1
C6AE   20 CE C7             JSR LC7CE
C6B1   4C 2A C6   LC6B1     JMP LC62A
C6B4   98                   TYA
C6B5   18                   CLC
C6B6   69 50                ADC #$50
C6B8   B0 0B                BCS LC6C5
C6BA   C5 FD                CMP $FD
C6BC   B0 07                BCS LC6C5
C6BE   A8                   TAY
C6BF   20 41 CE   LC6BF     JSR LINEFD
C6C2   4C 2A C6             JMP LC62A
C6C5   C4 FD      LC6C5     CPY $FD
C6C7   D0 44                BNE LC70D
C6C9   8C D5 02             STY $02D5
C6CC   4C BF C6             JMP LC6BF
C6CF   98                   TYA
C6D0   38                   SEC								;SET CARRY FLAG
C6D1   E9 50                SBC #$50
C6D3   90 0C                BCC LC6E1
C6D5   CD D5 02             CMP $02D5
C6D8   90 07                BCC LC6E1
C6DA   A8                   TAY
C6DB   20 08 CF   LC6DB     JSR LCF08
C6DE   4C 2A C6             JMP LC62A
C6E1   C4 FD      LC6E1     CPY $FD
C6E3   D0 28                BNE LC70D
C6E5   8C D5 02             STY $02D5
C6E8   4C DB C6             JMP LC6DB
C6EB   20 6F CD             JSR CLRHTW
C6EE   8C D5 02   LC6EE     STY $02D5
C6F1   4C 2A C6             JMP LC62A
C6F4   18                   CLC
C6F5   A4 FD                LDY $FD
C6F7   A9 0D      LC6F7     LDA #$0D
C6F9   91 F0                STA ($F0),Y						;FO - POINTER TO LINE-BUFFER USED FOR INLINE AND ENDLINE
C6FB   08                   PHP
C6FC   20 88 C7             JSR LC788
C6FF   20 F7 C8             JSR LC8F7
C702   28                   PLP
C703   98                   TYA
C704   A0 00                LDY #$00
C706   AE D6 02             LDX $02D6
C709   60                   RTS								;RETURN FROM SUBRUTINE
C70A   20 37 C8             JSR LC837
C70D   4C 2A C6   LC70D     JMP LC62A
C710   20 B9 C7             JSR LC7B9
C713   4C 2A C6             JMP LC62A
C716   20 17 C8             JSR LC817
C719   4C 2A C6             JMP LC62A
C71C   C0 00                CPY #$00
C71E   D0 ED                BNE LC70D
C720   F0 D5                BEQ LC6F7
C722   20 75 C9             JSR GETKEY						;GET KEYBOARD KEY CHARACTER
C725   4C 3A C6             JMP LC63A
C728   20 93 C7             JSR LC793
C72B   4C 2F C6             JMP LC62F
C72E   20 49 C8             JSR LC849
C731   4C 2F C6             JMP LC62F
C734   C4 FD                CPY $FD
C736   B0 07                BCS LC73F
C738   C8                   INY
C739   20 DA CE   LC739     JSR LCEDA
C73C   4C 2A C6             JMP LC62A
C73F   CC D5 02   LC73F     CPY $02D5
C742   F0 F5                BEQ LC739
C744   D0 C7                BNE LC70D
C746   20 72 CD             JSR HOMETW
C749   4C EE C6             JMP LC6EE
C74C   20 49 C8             JSR LC849
C74F   4C 2F C6             JMP LC62F
C752   38                   SEC								;SET CARRY FLAG
C753   6E D7 02             ROR $02D7
C756   4C 2F C6             JMP LC62F
C759   AD D5 02             LDA $02D5
C75C   8D D4 02             STA $02D4
C75F   20 A1 C8             JSR LC8A1
C762   4C 2A C6             JMP LC62A
C765   C4 FD      LC765     CPY $FD
C767   F0 A4                BEQ LC70D
C769   20 DA CE             JSR LCEDA
C76C   C8                   INY
C76D   D0 F6                BNE LC765
C76F   CC 38 02   LC76F     CPY YLNLIM						;LINE SIZE LIMIT FOR INLINE AND ENDLINE ENTRY POINTS 'YLNLIM'
C772   90 03                BCC LC777
C774   4C 55 D1             JMP LD155
C777   2C D7 02   LC777     BIT $02D7
C77A   10 03                BPL LC77F
C77C   4C 6C C8             JMP LC86C
C77F   91 F0      LC77F     STA ($F0),Y						;FO - POINTER TO LINE-BUFFER USED FOR INLINE AND ENDLINE
C781   C4 FD                CPY $FD
C783   90 02                BCC LC787
C785   E6 FD                INC $FD
C787   C8         LC787     INY
C788   2C 39 02   LC788     BIT $0239
C78B   30 03                BMI LC790
C78D   4C 09 03             JMP OUTCH						;TO DISPLAY A PRINTABLE CHARACTER OR INTERPRET COMMAND CHARACTER, 'OUTCH'
C790   4C DA CE   LC790     JMP LCEDA
C793   CC D5 02   LC793     CPY $02D5
C796   F0 20                BEQ LC7B8
C798   2C D7 02             BIT $02D7
C79B   10 07                BPL LC7A4
C79D   20 F0 CE             JSR LCEF0
C7A0   88                   DEY
C7A1   4C 49 C8             JMP LC849
C7A4   C4 FD      LC7A4     CPY $FD
C7A6   90 02                BCC LC7AA
C7A8   C6 FD                DEC $FD
C7AA   88         LC7AA     DEY
C7AB   20 F0 CE             JSR LCEF0
C7AE   A9 20                LDA #$20
C7B0   91 F0                STA ($F0),Y						;FO - POINTER TO LINE-BUFFER USED FOR INLINE AND ENDLINE
C7B2   20 88 C7             JSR LC788
C7B5   20 F0 CE             JSR LCEF0
C7B8   60         LC7B8     RTS								;RETURN FROM SUBRUTINE
C7B9   8C D4 02   LC7B9     STY $02D4
C7BC   C4 FD      LC7BC     CPY $FD
C7BE   B0 08                BCS LC7C8
C7C0   A9 20                LDA #$20
C7C2   20 88 C7             JSR LC788
C7C5   C8                   INY
C7C6   D0 F4                BNE LC7BC
C7C8   20 A1 C8   LC7C8     JSR LC8A1
C7CB   84 FD                STY $FD
C7CD   60                   RTS								;RETURN FROM SUBRUTINE
C7CE   8C D4 02   LC7CE     STY $02D4
C7D1   A2 00                LDX #$00
C7D3   BD E0 06   LC7D3     LDA $06E0,X						;TAB STOP TABLE. 'TABTBL'
C7D6   F0 3B                BEQ LC813
C7D8   A8                   TAY
C7D9   88                   DEY
C7DA   CC D4 02             CPY $02D4
C7DD   F0 2F                BEQ LC80E
C7DF   90 2D                BCC LC80E
C7E1   CC 38 02             CPY YLNLIM						;LINE SIZE LIMIT FOR INLINE AND ENDLINE ENTRY POINTS. 'YLNLIM'
C7E4   B0 2D                BCS LC813
C7E6   98                   TYA
C7E7   AC D4 02             LDY $02D4
C7EA   8D D4 02             STA $02D4
C7ED   C4 FD      LC7ED     CPY $FD
C7EF   B0 0B                BCS LC7FC
C7F1   CC D4 02             CPY $02D4
C7F4   B0 17                BCS LC80D
C7F6   20 DA CE             JSR LCEDA
C7F9   C8                   INY
C7FA   D0 F1                BNE LC7ED
C7FC   A9 20      LC7FC     LDA #$20
C7FE   CC D4 02             CPY $02D4
C801   B0 08                BCS LC80B
C803   20 88 C7             JSR LC788
C806   91 F0                STA ($F0),Y						;FO - POINTER TO LINE-BUFFER USED FOR INLINE AND ENDLINE
C808   C8                   INY
C809   D0 F1                BNE LC7FC
C80B   84 FD      LC80B     STY $FD
C80D   60         LC80D     RTS								;RETURN FROM SUBRUTINE
C80E   E8         LC80E     INX
C80F   E0 20                CPX #$20
C811   90 C0                BCC LC7D3
C813   AC D4 02   LC813     LDY $02D4
C816   60                   RTS								;RETURN FROM SUBRUTINE
C817   AD D5 02   LC817     LDA $02D5
C81A   8D D4 02             STA $02D4
C81D   20 A1 C8             JSR LC8A1
C820   A9 20                LDA #$20
C822   C4 FD      LC822     CPY $FD
C824   B0 06                BCS LC82C
C826   20 88 C7             JSR LC788
C829   C8                   INY
C82A   D0 F6                BNE LC822
C82C   20 A1 C8   LC82C     JSR LC8A1
C82F   A0 00                LDY #$00
C831   8C D5 02             STY $02D5
C834   84 FD                STY $FD
C836   60                   RTS								;RETURN FROM SUBRUTINE
C837   A0 00      LC837     LDY #$00
C839   8C D5 02             STY $02D5
C83C   C4 FD      LC83C     CPY $FD
C83E   F0 08                BEQ LC848
C840   B1 F0                LDA ($F0),Y
C842   20 88 C7             JSR LC788
C845   C8                   INY
C846   D0 F4                BNE LC83C
C848   60         LC848     RTS								;RETURN FROM SUBRUTINE
C849   C4 FD      LC849     CPY $FD
C84B   B0 1E                BCS LC86B
C84D   8C D4 02             STY $02D4
C850   C8         LC850     INY
C851   C4 FD                CPY $FD
C853   B0 0C                BCS LC861
C855   B1 F0                LDA ($F0),Y						;FO - POINTER TO LINE-BUFFER USED FOR INLINE AND ENDLINE
C857   88                   DEY
C858   91 F0                STA ($F0),Y						;FO - POINTER TO LINE-BUFFER USED FOR INLINE AND ENDLINE
C85A   C8                   INY
C85B   20 88 C7             JSR LC788
C85E   4C 50 C8             JMP LC850
C861   A9 20      LC861     LDA #$20
C863   20 88 C7             JSR LC788
C866   C6 FD                DEC $FD
C868   20 A1 C8             JSR LC8A1
C86B   60         LC86B     RTS								;RETURN FROM SUBRUTINE
C86C   8D D3 02   LC86C     STA $02D3
C86F   8C D4 02             STY $02D4
C872   A4 FD                LDY $FD
C874   CC 38 02             CPY YLNLIM						;LINE SIZE LIMIT FOR INLINE AND ENDLINE ENTRY POINTS. 'YLNLIM'
C877   90 06                BCC LC87F
C879   20 55 D1             JSR LD155
C87C   4C AF C8             JMP LC8AF
C87F   CC D4 02   LC87F     CPY $02D4
C882   F0 09                BEQ LC88D
C884   88                   DEY
C885   B1 F0                LDA ($F0),Y						;FO - POINTER TO LINE-BUFFER USED FOR INLINE AND ENDLINE
C887   C8                   INY
C888   91 F0                STA ($F0),Y						;FO - POINTER TO LINE-BUFFER USED FOR INLINE AND ENDLINE
C88A   88                   DEY
C88B   D0 F2                BNE LC87F
C88D   E6 FD      LC88D     INC $FD
C88F   AD D3 02             LDA $02D3
C892   91 F0                STA ($F0),Y						;FO - POINTER TO LINE-BUFFER USED FOR INLINE AND ENDLINE
C894   B1 F0      LC894     LDA ($F0),Y						;FO - POINTER TO LINE-BUFFER USED FOR INLINE AND ENDLINE
C896   20 88 C7             JSR LC788
C899   C8                   INY
C89A   C4 FD                CPY $FD
C89C   90 F6                BCC LC894
C89E   EE D4 02             INC $02D4
C8A1   98         LC8A1     TYA
C8A2   38                   SEC								;SET CARRY FLAG
C8A3   ED D4 02             SBC $02D4
C8A6   AA                   TAX
C8A7   F0 06                BEQ LC8AF
C8A9   20 F0 CE   LC8A9     JSR LCEF0
C8AC   CA                   DEX
C8AD   D0 FA                BNE LC8A9
C8AF   AC D4 02   LC8AF     LDY $02D4
C8B2   60                   RTS								;RETURN FROM SUBRUTINE
C8B3   29 7F      LC8B3     AND #$7F 						;INSURE 7 BIT ASCII INPUT
C8B5   0A                   ASL A
C8B6   0A                   ASL A
C8B7   0A                   ASL A
C8B8   0A                   ASL A
C8B9   0A                   ASL A
C8BA   AA                   TAX
C8BB   8E D8 02             STX $02D8
C8BE   18                   CLC
C8BF   69 20                ADC #$20
C8C1   8D D9 02             STA $02D9
C8C4   BD 00 04   LC8C4     LDA $0400,X						;FUNCTION KEY SUBSTITUTION STRING TABLE. 8 GRUPS OF 32 CHARACTERS. 'KEYSTR'
C8C7   C9 20                CMP #$20
C8C9   90 0A                BCC LC8D5
C8CB   C9 80                CMP #$80
C8CD   B0 06                BCS LC8D5
C8CF   E8                   INX
C8D0   EC D9 02             CPX $02D9
C8D3   D0 EF                BNE LC8C4
C8D5   6E 39 02   LC8D5     ROR $0239
C8D8   8E D9 02             STX $02D9
C8DB   AE D8 02             LDX $02D8
C8DE   EC D9 02   LC8DE     CPX $02D9
C8E1   B0 09                BCS LC8EC
C8E3   BD 00 04             LDA $0400,X						;FUNCTION KEY SUBSTITUTION STRING TABLE. 8 GRUPS OF 32 CHARACTERS. 'KEYSTR'
C8E6   20 6F C7             JSR LC76F
C8E9   E8                   INX
C8EA   D0 F2                BNE LC8DE
C8EC   BD 00 04   LC8EC     LDA $0400,X						;FUNCTION KEY SUBSTITUTION STRING TABLE. 8 GRUPS OF 32 CHARACTERS. 'KEYSTR'
C8EF   29 7F                AND #$7F						;INSURE 7 BIT ASCII INPUT
C8F1   C9 0D                CMP #$0D
C8F3   0E 39 02             ASL $0239
C8F6   60                   RTS								;RETURN FROM SUBRUTINE
C8F7   20 1B C9   LC8F7     JSR LC91B
C8FA   A0 FF                LDY #$FF
C8FC   C8         LC8FC     INY
C8FD   B1 F0                LDA ($F0),Y						;FO - POINTER TO LINE-BUFFER USED FOR INLINE AND ENDLINE
C8FF   AA                   TAX
C900   8C D4 02             STY $02D4
C903   AC 3D 02             LDY $023D
C906   C8                   INY
C907   20 06 D1             JSR LD106
C90A   8A                   TXA
C90B   91 F2                STA ($F2),Y
C90D   20 27 D1             JSR LD127
C910   8C 3D 02             STY $023D
C913   AC D4 02             LDY $02D4
C916   C4 FD                CPY $FD
C918   D0 E2                BNE LC8FC
C91A   60                   RTS								;RETURN FROM SUBRUTINE
C91B   A9 50      LC91B     LDA #$50
C91D   85 F2                STA $F2
C91F   A9 FC                LDA #$FC
C921   85 F3                STA $F3
C923   A0 FF                LDY #$FF
C925   60                   RTS								;RETURN FROM SUBRUTINE
C926   8C D4 02   LC926     STY $02D4
C929   20 1B C9             JSR LC91B
C92C   AC DA 02             LDY $02DA
C92F   88         LC92F     DEY
C930   CC 3D 02             CPY $023D
C933   F0 FA                BEQ LC92F
C935   20 06 D1             JSR LD106
C938   B1 F2                LDA ($F2),Y
C93A   C9 FF                CMP #$FF
C93C   D0 09                BNE LC947
C93E   AD 3D 02             LDA $023D
C941   8D DA 02             STA $02DA
C944   4C 4E C9             JMP LC94E
C947   C9 0D      LC947     CMP #$0D
C949   D0 E4                BNE LC92F
C94B   8C DA 02             STY $02DA
C94E   8C DB 02   LC94E     STY $02DB
C951   C8         LC951     INY
C952   20 06 D1             JSR LD106
C955   B1 F2                LDA ($F2),Y
C957   AA                   TAX
C958   20 27 D1             JSR LD127
C95B   8C DB 02             STY $02DB
C95E   AC D4 02             LDY $02D4
C961   8A                   TXA
C962   91 F0                STA ($F0),Y
C964   C9 0D                CMP #$0D
C966   F0 0A                BEQ LC972
C968   C8                   INY
C969   8C D4 02             STY $02D4
C96C   AC DB 02             LDY $02DB
C96F   4C 51 C9             JMP LC951
C972   84 FD      LC972     STY $FD
C974   60                   RTS								;RETURN FROM SUBRUTINE

;#$00 	= $021B ;WORKING AS FLAG FOR FLIPPING CURSOR
;TEMPX 	= $02CD ;TEMP SAVE REGISTER X
;TEMPY 	= $02CE ;TEMP SAVE REGISTER Y
;$0220  .byte  $05 								;'DBCDLA' - WAIT TIME IN MILLISECONDS ALLOWED FOR CONTACT BOUNCE.
;$020D  .byte  $00                   			;KEY READ TABLE OFFSET - TO DETERMINE WHICH KEY WAS PRESSED

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
C991   A0 00                LDY #$00               			;RESET INDEX Y
C993   AE 20 02   LC993     LDX $DBCDLA						;WAIT TIME IN MILLISECONDS ALLOWED FOR CONTACT BOUNCE. 'DBCDLA' X=05
C996   20 85 CA   LC996     JSR LCA85						;SCAN KEYBOARD AND RESETS COLUMN COUNTER
C999   D0 2B                BNE LC9C6               		;IF SOMETHING WAS PRESSED ON KEYBOARD ??
C99B   A9 00                LDA #$00                    
C99D   20 8B CA             JSR LCA8B						;RESETS KEYBOARD SCAN COUNTER
C9A0   F0 1B                BEQ LC9BD                   
C9A2   A2 07                LDX #$07                    
C9A4   AD 0D 02             LDA $020D						;INITIALLY 00
C9A7   DD DE CB   LC9A7     CMP $CBDE,X						;COMPARE WITH SOME PREDEFINIED CONTACT BOUNCE TIMES??
C9AA   F0 05                BEQ LC9B1                   
C9AC   CA                   DEX                         
C9AD   10 F8                BPL LC9A7                   
C9AF   30 E2                BMI LC993                   	;UNTIL ONE IS IDENTIFIED
C9B1   2C 0E 02   LC9B1     BIT $020E                       ;IF NOT TRY AGAIN
C9B4   30 07                BMI LC9BD                   
C9B6   88                   DEY                         
C9B7   D0 DA                BNE LC993                   
C9B9   38                   SEC								;SET CARRY FLAG
C9BA   6E 0E 02             ROR $020E                   
C9BD   AD ED BF   LC9BD     LDA $BFED						;SYSTEM 1 6522 INTERRUPT FLAG REGISTER
C9C0   29 40                AND #$40                    
C9C2   F0 CF                BEQ LC993                   
C9C4   D0 4B                BNE LCA11                   
C9C6   CA         LC9C6     DEX                         	;INITIALLY X=5 SO NOW 4
C9C7   D0 CD                BNE LC996                   	;SCAN KEYBOARD 4 MORE TIMES
C9C9   8E 0E 02             STX $020E                  		;SAVE ACTUAL X IN $020E
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
C9ED   2C 1B 02             BIT $021B                   	;COMPARE WITH #$00
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
CA33   8D 0D 02             STA $020D                   	;RESET $020D TO #$00
CA36   8E CD 02   TSTKEY    STX $02CD						;'TSTKEY' ROUTINE - TO TEST IF A KEY IS PRESSED; HAS MULTIPLE RECOGNITION LOCKOUT
CA39   8C CE 02             STY $02CE                   
CA3C   20 1C D1             JSR LD11C						;TURN ON I/O AREA
CA3F   20 D7 CA             JSR LCAD7						;SET OUTPUT DATA REGISTER
CA42   AD 0D 02             LDA $020D						;RECOVER INDEX A
CA45   F0 16                BEQ LCA5D                   	;IF 0 SKIP
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
CA73   38                   SEC								;SET CARRY FLAG - SO THAT MEANS KEY WAS PRESSED
CA74   B0 06                BCS LCA7C                  		;IF NOT MAKE SURE TO RESET SCANING ROUTINE TO BEGINING
CA76   A9 00      LCA76     LDA #$00                    
CA78   8D 0D 02             STA $020D                   
CA7B   18         LCA7B     CLC                        	;HERE WE COULD CHANGE TO SEC SO ALWAYS KEY WILL BE TRIGGERED ??
CA7C   AE CD 02   LCA7C     LDX $02CD						;RECOVER INDEX X
CA7F   AC CE 02             LDY $02CE						;RECOVER INDEX Y
CA82   4C 2F D1             JMP LD12F						;TURN OFF I/O AREA AND RTS - KEEPS PROCESSOR STATUS AND THAT'S ALL
CA85   20 B6 CA   LCA85     JSR LCAB6                  		;WASTE 1mS
CA88   AD 0D 02             LDA $020D                  	;INITIALLY HERE SHOULD BE 0
CA8B   20 1C D1   LCA8B     JSR LD11C						;TURN ON I/O AREA AND SET $02F9 "SEEIO" SEMAPHORE
CA8E   8D C5 BF             STA $BFC5						;RESET KEYBOARD SCAN COUNTER BY STORING ANYTHING TO $BFC5
CA91   86 FA                STX $FA                     	;STORE INITIAL DEBOUNCE TIME 5 TEMPORARLY IN $FA 
CA93   2C 6C CB   LCA93     BIT $CB6C                  		;READ BIT $0F - SO 16 COLUMNS(KEYS) PER ROW
CA96   F0 08                BEQ LCAA0                  		;IF 0 IN A THAN GO TO $CAA0 - INITIALIZATION
CA98   8D E1 BF             STA $BFE1						;SYSTEM 1 6522 KEYBOARD PORT DATA REGISTER
CA9B   38                   SEC								;SET CARRY FLAG
CA9C   E9 01                SBC #$01                   		;-1 OUT OF 16 POSSIBILITY COLUMNS
CA9E   D0 F3                BNE LCA93                  		;GO BACK TO PULSE ON ALL 16 COLUMNS
CAA0   4A         LCAA0     LSR A                       
CAA1   4A                   LSR A                       
CAA2   4A                   LSR A                       
CAA3   4A                   LSR A                       
CAA4   AA                   TAX                         	;INITIAL A=X=#$00
CAA5   BD B0 CA             LDA $CAB0,X                 	;LOAD FIRST ROW ($04) 
CAA8   A6 FA                LDX $FA                    		;LOAD X=5 FORM TEMPORARY BYTE
CAAA   2D E1 BF             AND $BFE1						;SYSTEM 1 6522 KEYBOARD PORT DATA REGISTER
CAAD   4C 2F D1             JMP LD12F						;TURN OFF I/O AREA AND RTS
CAB0   .byte $04                   							;%00000100 - keyboard ROW
CAB1   .byte $08       		    							;%00001000
CAB2   .byte $10											;%00010000
cab3   .byte $20        									;%00100000
CAB4   .byte $40       										;%01000000
CAB5   .byte $80                   							;%10000000
CAB6   A9 C5      LCAB6     LDA #$C5                    	;197
CAB8   E9 01      LCAB8     SBC #$01                   		;-1
CABA   D0 FC                BNE LCAB8                  		;TIME WAISTING LOOP
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
CAF6   AE 0D 02   LCAF6     LDX $020D						;OFFSET TO READ PROPER KEY PRESSED - NEVER USED AGAIN SO ******STY $020D***** WILL PRESERVE Y
CAF9   BD 5C CB             LDA $CB5C,X						;LOAD PROPER KEY CODE WHICH WAS PRESSED *******JSR $1E5A - 20 5A 1E********* FOR KIM-1 GETCH - A WILL BE ASCII CODE, X PRESERVED, Y-NOT HERE
CAFC   85 FA                STA $FA							;SAVE IDENTIFIED CHARACTER CODE TEMPORARLY *******HERE WE COULD PUT ASCII FROM TTY BUT SOME TRIGGER IS ALSO NEEDED*******
CAFE   8D C5 BF             STA $BFC5						;RESET KEYBOARD SCAN COUNTER BY SAVING ANYTHING
CB01   AD E1 BF             LDA $BFE1						;SYSTEM 1 6522 KEYBOARD PORT DATA REGISTER ********LDY $020D******* RECOVER Y - JUST TO BE SURE
CB04   2C 7C CB             BIT $CB7C                  		;#$20										*******JMP $CB12********** OMMIT SOME CHECKS AS PORT DOESN'T CONTAIN PROPER DATA
CB07   F0 1C                BEQ LCB25                   
CB09   2C 7D CB             BIT $CB7D                  		;#$40
CB0C   F0 17                BEQ LCB25                   
CB0E   29 10                AND #$10                   		;#$00
CB10   F0 04                BEQ LCB16                   
CB12   A5 FA                LDA $FA							;CHECK IT'S NOT ZERO					KEYBOARD ASCII CODE DECODING
CB14   D0 35                BNE LCB4B                   
CB16   A5 FA      LCB16     LDA $FA							;CHECK IF IT'S LOWER CASE CHARACTER OR UPPER CASE
CB18   C9 61                CMP #$61						;LOWER CASE A
CB1A   90 2F                BCC LCB4B                   
CB1C   C9 7B                CMP #$7B						;L.C.Z+1 - UPPER CASE
CB1E   B0 2B                BCS LCB4B                   
CB20   38         LCB20     SEC								;SET CARRY FLAG
CB21   E9 20                SBC #$20						;FOLD LOWER TO UPPER CASE ALPFA
CB23   D0 26                BNE LCB4B                   
CB25   E0 3D      LCB25     CPX #$3D                   		;CHECK IS IT SMALL CASE CHARACTER
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


;SOME PREDEFINIED WAIT TIMES FOR CONTACT BOUNCE.
CBDE   0F                   ;15
CBDF   1F                   ;31
CBE0   32                   ;50
CBE1   3D					;61
CBE2   49					;73
CBE3   4A             		;74
CBE4   4D					;77
CBE5   4E 					;78

;SCRATCH AREA
;$02C7 - A BACKUP
;$02C8 - X BACKUP
;$02C9 - Y BACKUP

CBE6   D8         OUTCH     CLD								;'OUTCH' RUTINE - CLEAR DECIMAL MODE ;ARGUMENTS RETURNED: None, A, X, and Y registers preserved. 
CBE7   8D C7 02             STA $02C7						;PRESERVE A
CBEA   8E C8 02             STX $02C8						;PRESERVE X
CBED   8C C9 02             STY $02C9						;PRESERVE Y
CBF0   C9 00                CMP #$00
CBF2   10 08                BPL $CBFC
CBF4   2C 19 02             BIT EXTHI						;IF BIT 7=1 THEN CALL USER RUTINE TO PROCESS ALL CHARACTERS WITH BIT 7 SET. 'EXTHI'
CBF7   10 59                BPL LCC52
CBF9   6C 33 02             JMP (QEXHI7)					;ADRES OF EXTERNAL PROCESSOR FOR CHARACTERS WITH BIT 7=1. 'QEXHT7'
CBFC   38         LCBFC     SEC								;SET CARRY FLAG
CBFD   E9 20                SBC #$20
CBFF   B0 03                BCS LCC04
CC01   4C 80 CC             JMP LCC80
CC04   48         LCC04     PHA
CC05   0E 1D 02             ASL $021D
CC08   20 3B D1             JSR LD13B
CC0B   68                   PLA
CC0C   C9 5F                CMP #$5F
CC0E   D0 13                BNE LCC23
CC10   2C 16 02             BIT SHODEL						;IF BIT 7=1 THEN DISPLAY DEL AS A ROBOUT CHARACTER SHAPE. 'SHODEL'
CC13   30 1D                BMI LCC32
CC15   20 F0 CE             JSR LCEF0
CC18   20 3B D1             JSR LD13B
CC1B   A9 00                LDA #$00
CC1D   20 0B D0             JSR LD00B
CC20   4C 48 CC             JMP LCC48
CC23   C9 3F      LCC23     CMP #$3F
CC25   D0 0B                BNE LCC32
CC27   2C 17 02             BIT SHOUL						;IF BIT 7=1 THEN CHARACTER CELL IS ERASED BEFORE THE UNDERLINE CHARACTER IS DRAWN. 'SHOUL'
CC2A   30 06                BMI LCC32
CC2C   20 D7 D0             JSR LD0D7
CC2F   4C 45 CC             JMP LCC45
CC32   20 0B D0   LCC32     JSR LD00B
CC35   2C 12 02             BIT UNDRLN						;IF BIT 7=1 THEN ALL CHARACTERS UNDERLINED WHEN DRAWN. 'UNDRLN'
CC38   10 03                BPL LCC3D
CC3A   20 D7 D0             JSR LD0D7
CC3D   2C 15 02   LCC3D     BIT RVIDEO						;IF BIT 7=1 THEN CHARACTER ARE DRAWN IN REVERSE VIDEO. 'RVIDEO'
CC40   10 03                BPL LCC45
CC42   20 A7 D0             JSR LD0A7
CC45   20 DA CE   LCC45     JSR LCEDA
CC48   AC C9 02   LCC48     LDY $02C9						;RECOVER Y
CC4B   AE C8 02             LDX $02C8						;RECOVER X
CC4E   AD C7 02             LDA $02C7						;RECOVER A
CC51   60                   RTS								;RETURN FROM SUBRUTINE
CC52   A2 08      LCC52     LDX #$08
CC54   DD FF CC   LCC54     CMP $CCFF,X
CC57   F0 21                BEQ LCC7A
CC59   CA                   DEX
CC5A   10 F8                BPL LCC54
CC5C   C9 A0                CMP #$A0
CC5E   D0 06                BNE LCC66
CC60   20 08 CF             JSR LCF08
CC63   4C 48 CC             JMP LCC48
CC66   C9 A2      LCC66     CMP #$A2
CC68   D0 06                BNE LCC70
CC6A   20 DA CE             JSR LCEDA
CC6D   4C 48 CC             JMP LCC48
CC70   C9 A4      LCC70     CMP #$A4
CC72   D0 D4                BNE LCC48
CC74   20 72 CD             JSR HOMETW
CC77   4C 48 CC             JMP LCC48
CC7A   BD 08 CD   LCC7A     LDA $CD08,X
CC7D   4C FC CB             JMP LCBFC
CC80   18         LCC80     CLC
CC81   69 20                ADC #$20
CC83   2C 18 02             BIT EXCCP						;IF BIT 7=1 THEN CALL USER CONTROL CHARACTER PROCESSOR. 'EXCCP'
CC86   10 03                BPL LCC8B
CC88   6C 2F 02             JMP (QEXCC)						;ADRES OF EXTERNAL CHARACTER PROCESSOR IF USED LOW BYTE. 'QEXCC'
CC8B   C9 0D      LCC8B     CMP #$0D
CC8D   D0 0B                BNE LCC9A
CC8F   0E 1D 02             ASL $021D
CC92   B0 B4                BCS LCC48
CC94   20 7D CD             JSR LCD7D
CC97   4C 48 CC             JMP LCC48
CC9A   C9 0A      LCC9A     CMP #$0A
CC9C   D0 06                BNE LCCA4
CC9E   20 41 CE             JSR LINEFD
CCA1   4C 48 CC             JMP LCC48
CCA4   CD 2B 02   LCCA4     CMP $022B
CCA7   D0 06                BNE LCCAF
CCA9   20 F0 CE             JSR LCEF0
CCAC   4C 48 CC             JMP LCC48
CCAF   CD 2E 02   LCCAF     CMP $022E
CCB2   D0 0E                BNE LCCC2
CCB4   AD 01 02             LDA LINE 						;CURRENT LINE NUMBER OF TEXT CURSOR
CCB7   20 F3 CD             JSR CLRTLN
CCBA   A9 01                LDA #$01
CCBC   8D 00 02             STA COL							;CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80 "COL" "COL"
CCBF   4C 48 CC             JMP LCC48
CCC2   CD 2D 02   LCCC2     CMP $022D
CCC5   D0 06                BNE LCCCD
CCC7   20 6F CD             JSR CLRHTW
CCCA   4C 48 CC             JMP LCC48
CCCD   CD 2A 02   LCCCD     CMP $022A
CCD0   D0 06                BNE LCCD8
CCD2   20 55 D1             JSR LD155
CCD5   4C 48 CC             JMP LCC48
CCD8   CD 2C 02   LCCD8     CMP $022C
CCDB   F0 03                BEQ LCCE0
CCDD   4C 48 CC   LCCDD     JMP LCC48
CCE0   A2 00      LCCE0     LDX #$00
CCE2   BD E0 06   LCCE2     LDA $06E0,X						;TAB STOP TABLE. 'TABTBL'
CCE5   F0 15                BEQ LCCFC
CCE7   CD 00 02             CMP COL							;CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80 "COL"
CCEA   F0 0B                BEQ LCCF7
CCEC   90 09                BCC LCCF7
CCEE   C9 51                CMP #$51
CCF0   B0 0A                BCS LCCFC
CCF2   8D 00 02             STA COL							;CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80 "COL"
CCF5   90 E6                BCC LCCDD
CCF7   E8         LCCF7     INX
CCF8   E0 20                CPX #$20
CCFA   D0 E6                BNE LCCE2
CCFC   4C 48 CC   LCCFC     JMP LCC48
CCFF   .byte $00          
CD00   .byte $8A          
CD01   .byte $8B          
CD02   .byte $8C 
CD03   .byte $8D 
CD04   .byte $8E          
CD05   .byte $A1 
CD06   .byte $A3          
CD07   .byte $B4 
CD08   .byte $00          
CD09   .byte $2A          
CD0A   .byte $2F          
CD0B   .byte $2D 
CD0C   .byte $2B 
CD0D   .byte $0D          
CD0E   .byte $08          
CD0F   .byte $0A          
CD10   .byte $0C          
CD11   20 36 CD   INITIO    JSR INITTW						;FILE HEADER START POINT - 'INITIO' SUBRUTINE
CD14   A9 00                LDA #$00						;LOW BYTE FOR INPUT LINE BUFFER
CD16   85 F0                STA $F0							;SET NORMAL CODOS LINE BUFFER $F0=00 AND $F1=05 - SYSTEM INPUT LINE BUFFER (192 DECIMAL BYTES) 0500-05BF
CD18   A9 05                LDA #$05
CD1A   85 F1                STA $F1							;HIGH BYTE FOR INPUT LINE BUFFER
CD1C   A2 40                LDX #$40						;64	FUNCTION KEY LEGEND SPACES 
CD1E   A9 20                LDA #$20						;SPACE INPUT IN TO KEY LEGENDS
CD20   9D BF 05   LCD20     STA $05BF,X						;$05C0-$05FF - FUNCTION KEY LEGENDS 8X8BYTES EACH	FILL 64 SPACES WITH '20' - SPACE
CD23   CA                   DEX								;NEXT PLACE
CD24   D0 FA                BNE LCD20						;IS IT DONE =X WILL BE 00 AGAIN? IF NO GO BACK
CD26   A9 80                LDA #$80						;LOAD 128
CD28   9D 00 04   LCD28     STA $0400,X						;FUNCTION KEY SUBSTITUTION STRING TABLE. 8 GRUPS OF 32 CHARACTERS. 'KEYSTR' - FILL 0400-O4FF WITH #$80
CD2B   CA                   DEX								;NEXT PLACE
CD2C   D0 FA                BNE LCD28						;FILLING COMPLETE?
CD2E   A9 00                LDA #$00			
CD30   8D 0D 02             STA $020D
CD33   4C D1 D1             JMP DRWLEG
CD36   D8         INITTW    CLD								;'INITTW' ROUTINE - CLEAR DECIMAL MODE
CD37   20 95 CD             JSR CLRDSP						;JUMP TO CLEAR DISPLAY
CD3A   A9 00                LDA #$00						;LOAD #$00
CD3C   8D 39 02             STA $0239			
CD3F   A2 0F                LDX #$0F						;LOAD 16 IN TO X
CD41   9D 0F 02   LCD41     STA KBECHO,X					;RESET $0210-$021F AREA (BIT 7 CHECKING, DISPLAY PROPERTIES ETC)
CD44   CA                   DEX
CD45   10 FA                BPL LCD41						;CHECK IS IT DONE?
CD47   A9 01                LDA #$01
CD49   AA                   TAX
CD4A   A8                   TAY
CD4B   20 87 D1             JSR BEEP
CD4E   20 1B C9             JSR LC91B
CD51   A0 00                LDY #$00
CD53   20 06 D1             JSR LD106
CD56   A9 FF                LDA #$FF
CD58   91 F2                STA ($F2),Y
CD5A   C8                   INY
CD5B   A9 0D                LDA #$0D
CD5D   91 F2                STA ($F2),Y
CD5F   8C 3D 02             STY $023D
CD62   20 27 D1             JSR LD127
CD65   A9 18                LDA #$18
CD67   A0 00                LDY #$00
CD69   8D 1E 02   DEFTW     STA NLINET						;'DEFTW' ROUTINE - NUMBER OF TEXT LINES IN THE TEXT WINDOW - NLINET
CD6C   8C 1F 02             STY YTDOWN						;255-(Y COORDINATTE OF TOP OF THE TEXT WINDOW - 'YTDOWN'
CD6F   20 AF CD   CLRHTW    JSR CLRTW						;'CLRHTW' ROUTINE
CD72   48         HOMETW    PHA								;'HOMETW' ROUTINE
CD73   A9 01                LDA #$01
CD75   8D 01 02             STA LINE						;SAVE CURRENT LINE NUMBER OF TEXT CURSOR - LINE
CD78   8D 00 02             STA COL							;CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80 "COL"
CD7B   68                   PLA
CD7C   60                   RTS								;RETURN FROM SUBRUTINE
CD7D   48         LCD7D     PHA								;'CRLF' ROUTINE
CD7E   A9 01                LDA #$01
CD80   8D 00 02             STA COL							;CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80 "COL"
CD83   2C 10 02             BIT NOLFCR						;IF BIT 7=1 THEN NO AUTOMATIC LINE FEED AFTER CR 'NOLFCR'
CD86   30 0B                BMI LCD93
CD88   8A                   TXA
CD89   48                   PHA
CD8A   98                   TYA
CD8B   48                   PHA
CD8C   20 41 CE             JSR LINEFD
CD8F   68                   PLA
CD90   A8                   TAY
CD91   68                   PLA
CD92   AA                   TAX
CD93   68         LCD93     PLA
CD94   60                   RTS								;RETURN FROM SUBRUTINE
CD95   48         CLRDSP    PHA								;'CLRDSP' ROUTINE - SAVE A ON STACK
CD96   8A                   TXA								;TRANSFER X TO A
CD97   48                   PHA								;SAVE X ON STACK
CD98   A9 00                LDA #$00						;LOAD 00 IN TO ACCUMULATOR
CD9A   85 F4                STA $F4							;STORE IN $F4 - LOW VISABLE MEMORY BYTE
CD9C   A9 C0                LDA #$C0						;LOAD C0 IN TO ACCUMULATOR
CD9E   85 F5                STA $F5							;STORE IN $F5 - HIGH VISABLE MEMORY BYTE - PAGE - FOR KIM-1 SHOULD BE F.E. #$20
CDA0   A9 00                LDA #$00						;LOAD 00 IN TO ACCUMULATOR
CDA2   85 F8                STA $F8							;STORE IN $F8 - LOW BYTE PIXEL COUNT
CDA4   A9 3C                LDA #$3C						;LOAD 3C IN TO ACCUMULATOR
CDA6   85 F9                STA $F9							;STORE IN $F9 - HIGH BYTE PIXEL COUNT	- 3C00=15360 display points on screen
CDA8   20 15 CE             JSR LCE15
CDAB   68                   PLA
CDAC   AA                   TAX
CDAD   68                   PLA
CDAE   60                   RTS								;RETURN FROM SUBRUTINE
CDAF   48         CLRTW     PHA								;'CLRTW' ROUTINE	;PRESERVE A TO STACK
CDB0   8A                   TXA													;TRANSFER X TO A
CDB1   48                   PHA													;PRESERVE X TO STACK
CDB2   AD 1F 02             LDA YTDOWN						;255-(Y COORDINATTE OF TOP OF THE TEXT WINDOW - 'YTDOWN'
CDB5   20 63 CF             JSR LCF63
CDB8   20 3E D1             JSR LD13E
CDBB   AD 1E 02             LDA NLINET						;NUMBER OF TEXT LINES IN THE TEXT WINDOW - NLINET
CDBE   A2 50                LDX #$50
CDC0   20 36 CF             JSR LCF36
CDC3   A5 F2                LDA $F2
CDC5   38                   SEC								;SET CARRY FLAG
CDC6   E5 F4                SBC $F4
CDC8   85 F8                STA $F8
CDCA   A5 F3                LDA $F3
CDCC   E5 F5                SBC $F5
CDCE   85 F9                STA $F9
CDD0   E6 F8                INC $F8
CDD2   D0 02                BNE LCDD6
CDD4   E6 F9                INC $F9
CDD6   20 15 CE   LCDD6     JSR LCE15
CDD9   68                   PLA
CDDA   AA                   TAX
CDDB   68                   PLA
CDDC   60                   RTS								;RETURN FROM SUBRUTINE
CDDD   A9 40      CLRLEG    LDA #$40						;'CLRLEG' ROUTINE - PIXEL COUNT FOR LAST 7 LINES OF SCREEN
CDDF   85 F4                STA $F4
CDE1   A9 F8                LDA #$F8						;PIXEL COUNT FOR LAST 7 LINES OF SCREEN WITH LEGEND BOXES
CDE3   85 F5                STA $F5
CDE5   A9 C0                LDA #$C0					;VISABLE MEMORY PAGE - FOR KIM-1 ~$2000?
CDE7   85 F8                STA $F8
CDE9   A9 03                LDA #$03
CDEB   85 F9                STA $F9
CDED   4C 15 CE             JMP LCE15
CDF0   AD 1E 02   LCDF0     LDA NLINET						;NUMBER OF TEXT LINES IN THE TEXT WINDOW - NLINET
CDF3   A2 50      CLRTLN    LDX #$50						;'CLRTLN' ROUTINE
CDF5   CD 1E 02             CMP NLINET						;NUMBER OF TEXT LINES IN THE TEXT WINDOW - NLINET
CDF8   90 03                BCC LCDFD
CDFA   AD 1E 02             LDA NLINET						;NUMBER OF TEXT LINES IN THE TEXT WINDOW - NLINET
CDFD   20 36 CF   LCDFD     JSR LCF36
CE00   A5 F2                LDA $F2
CE02   38                   SEC								;SET CARRY FLAG
CE03   E9 57                SBC #$57
CE05   85 F4                STA $F4
CE07   A5 F3                LDA $F3
CE09   E9 02                SBC #$02
CE0B   85 F5                STA $F5
CE0D   A9 58                LDA #$58
CE0F   85 F8                STA $F8
CE11   A9 02                LDA #$02
CE13   85 F9                STA $F9
CE15   20 06 D1   LCE15     JSR LD106
CE18   20 1E CE             JSR LCE1E
CE1B   4C 27 D1             JMP LD127
CE1E   98         LCE1E     TYA								;PUSH Y ON STACK
CE1F   48                   PHA
CE20   A9 00                LDA #$00						;LOAD A=$00
CE22   A4 F9                LDY $F9							
CE24   F0 0F                BEQ LCE35
CE26   A8                   TAY
CE27   91 F4      LCE27     STA ($F4),Y
CE29   C8                   INY
CE2A   91 F4                STA ($F4),Y
CE2C   C8                   INY
CE2D   D0 F8                BNE LCE27
CE2F   E6 F5                INC $F5
CE31   C6 F9                DEC $F9
CE33   D0 F2                BNE LCE27
CE35   A4 F8      LCE35     LDY $F8
CE37   F0 05                BEQ LCE3E
CE39   88         LCE39     DEY
CE3A   91 F4                STA ($F4),Y
CE3C   D0 FB                BNE LCE39
CE3E   68         LCE3E     PLA
CE3F   A8                   TAY
CE40   60                   RTS								;RETURN FROM SUBRUTINE
CE41   AD 01 02   LINEFD    LDA LINE						;'LINEFD' ROUTINE - CURRENT LINE NUMBER OF TEXT CURSOR - LINE
CE44   CD 1E 02             CMP NLINET						;NUMBER OF TEXT LINES IN THE TEXT WINDOW - NLINET
CE47   90 0D                BCC LCE56
CE49   2C 11 02             BIT NOSCRL						;IF BIT 7=1 THEN INSTEAD OF SCROLLING THE TEXT WINDOW IS CLEARED AND THE CURSOR IS HOMED WHEN TEXT GOES BELOW BOOTOM LINE. 'NOSCRL'
CE4C   10 0C                BPL LCE5A
CE4E   20 AF CD             JSR CLRTW
CE51   A9 00                LDA #$00
CE53   8D 01 02             STA LINE						;SAVE CURRENT LINE NUMBER OF TEXT CURSOR - LINE
CE56   EE 01 02   LCE56     INC LINE						;INCREMENT CURRENT LINE NUMBER OF TEXT CURSOR LINE+1
CE59   60                   RTS								;RETURN FROM SUBRUTINE
CE5A   AD 1E 02   LCE5A     LDA NLINET						;NUMBER OF TEXT LINES IN THE TEXT WINDOW - NLINET
CE5D   C9 02                CMP #$02
CE5F   90 39                BCC LCE9A
CE61   A2 50                LDX #$50
CE63   20 36 CF             JSR LCF36
CE66   A5 F2                LDA $F2
CE68   85 F8                STA $F8
CE6A   A5 F3                LDA $F3
CE6C   85 F9                STA $F9
CE6E   AD 1F 02             LDA YTDOWN						;255-(Y COORDINATTE OF TOP OF THE TEXT WINDOW - 'YTDOWN'
CE71   20 63 CF             JSR LCF63
CE74   20 3E D1             JSR LD13E
CE77   A5 F4                LDA $F4
CE79   18                   CLC
CE7A   69 58                ADC #$58
CE7C   85 F2                STA $F2
CE7E   A5 F5                LDA $F5
CE80   69 02                ADC #$02
CE82   85 F3                STA $F3
CE84   A5 F8                LDA $F8
CE86   38                   SEC								;SET CARRY FLAG
CE87   E5 F2                SBC $F2
CE89   85 F8                STA $F8
CE8B   A5 F9                LDA $F9
CE8D   E5 F3                SBC $F3
CE8F   85 F9                STA $F9
CE91   E6 F8                INC $F8
CE93   D0 02                BNE LCE97
CE95   E6 F9                INC $F9
CE97   20 9D CE   LCE97     JSR LCE9D
CE9A   4C F0 CD   LCE9A     JMP LCDF0
CE9D   20 06 D1   LCE9D     JSR LD106
CEA0   20 A6 CE             JSR LCEA6
CEA3   4C 27 D1             JMP LD127
CEA6   98         LCEA6     TYA
CEA7   48                   PHA
CEA8   A0 00                LDY #$00						;START FROM TOP OF SCREEN - 0
CEAA   A6 F9                LDX $F9							;249 LINES - DO NOT UPDATE LEGEND BOXES
CEAC   F0 1D                BEQ LCECB
CEAE   B1 F2      LCEAE     LDA ($F2),Y						;MOVE SCREEN UP 4 LINES LINE BY LINE. READ PREVIOUS LINE AND PUT IT ONE UP.
CEB0   91 F4                STA ($F4),Y
CEB2   C8                   INY
CEB3   B1 F2                LDA ($F2),Y
CEB5   91 F4                STA ($F4),Y
CEB7   C8                   INY
CEB8   B1 F2                LDA ($F2),Y
CEBA   91 F4                STA ($F4),Y
CEBC   C8                   INY
CEBD   B1 F2                LDA ($F2),Y
CEBF   91 F4                STA ($F4),Y
CEC1   C8                   INY
CEC2   D0 EA                BNE LCEAE						;UPDATE SCREEN PAGES
CEC4   E6 F3                INC $F3
CEC6   E6 F5                INC $F5
CEC8   CA                   DEX
CEC9   D0 E3                BNE LCEAE
CECB   A6 F8      LCECB     LDX $F8
CECD   F0 08                BEQ LCED7
CECF   B1 F2      LCECF     LDA ($F2),Y
CED1   91 F4                STA ($F4),Y
CED3   C8                   INY
CED4   CA                   DEX
CED5   D0 F8                BNE LCECF
CED7   68         LCED7     PLA
CED8   A8                   TAY
CED9   60                   RTS								;RETURN FROM SUBRUTINE
CEDA   48         LCEDA     PHA
CEDB   AD 00 02             LDA COL							;CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80 "COL"
CEDE   C9 50                CMP #$50						;CHECK IS IT END OF LINE 80 COLUMNS
CEE0   B0 05                BCS LCEE7
CEE2   EE 00 02             INC COL							;CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80 "COL"
CEE5   68                   PLA
CEE6   60                   RTS								;RETURN FROM SUBRUTINE
CEE7   20 7D CD   LCEE7     JSR LCD7D
CEEA   38                   SEC								;SET CARRY FLAG
CEEB   6E 1D 02             ROR $021D
CEEE   68                   PLA
CEEF   60                   RTS								;RETURN FROM SUBRUTINE
CEF0   CE 00 02   LCEF0     DEC COL							;CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80 "COL"
CEF3   D0 12                BNE LCF07
CEF5   48                   PHA
CEF6   A9 50                LDA #$50
CEF8   8D 00 02             STA COL							;CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80 "COL"
CEFB   CE 01 02             DEC LINE						;DECREMENT CURRENT LINE NUMBER OF TEXT CURSOR - LINE-1
CEFE   D0 06                BNE LCF06
CF00   AD 1E 02             LDA NLINET						;NUMBER OF TEXT LINES IN THE TEXT WINDOW - NLINET
CF03   8D 01 02             STA LINE						;SAVE CURRENT LINE NUMBER OF TEXT CURSOR - LINE.
CF06   68         LCF06     PLA
CF07   60         LCF07     RTS								;RETURN FROM SUBRUTINE
CF08   CE 01 02   LCF08     DEC LINE						;DECREMENT CURRENT LINE NUMBER OF TEXT CURSOR - LINE-1
CF0B   F0 01                BEQ LCF0E
CF0D   60                   RTS								;RETURN FROM SUBRUTINE
CF0E   48         LCF0E     PHA
CF0F   AD 1E 02             LDA NLINET						;NUMBER OF TEXT LINES IN THE TEXT WINDOW - NLINET
CF12   8D 01 02             STA LINE						;SAVE CURRENT LINE NUMBER OF TEXT CURSOR - LINE
CF15   68                   PLA
CF16   60                   RTS								;RETURN FROM SUBRUTINE

;$0200  .byte  $01        									;'COL' - CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80.
;$0201  .byte  $01                							;'LINE' - CURRENT LINE NUMBER OF TEXT CURSOR. 1-NLINET.
;$021E  .byte  $18                							;'NLINET' NUMBER OF TEXT LINES IN THE TEXT WINDOW. 24 LINES. 
;$021F  .byte  $00                  						;'YTDOWN' 255-(Y COORDINATE OF TOP OF THE TEXT WINDOW).
;$00FA														;TEMPORARY DATA TO COMPUTE CURSOR POSITION
;$00FC														;TEMPORARY VALUE 


;CURRENT POSITION OF THE TEXT CURSOR WITHIN THE TEXT WINDOW IS KEPT IN VARIABLES COL (1 TO 80) AND LINE (1 TO 25-10*YTDOWN)

CF17   AE 00 02   LCF17     LDX COL							;CURRENT COLUMN LOCATION OF TEXT CURSOR IN X
CF1A   F0 04                BEQ LCF20                       ;SKIP IF 0 SOMEHOW
CF1C   E0 51                CPX #$51                        ;CHECK IS IT END OF LINE - 81'ST CHARACTER
CF1E   90 05                BCC LCF25                       ;GO FOR NEW LINE
CF20   A2 01      LCF20     LDX #$01                        ;SET COLUMN 1 - FIRST 
CF22   8E 00 02             STX COL							;CURRENT COLUMN LOCATION OF TEXT CURSOR 1-80 "COL"
CF25   AD 01 02   LCF25     LDA LINE						;CURRENT LINE NUMBER OF TEXT CURSOR - LINE
CF28   F0 07                BEQ LCF31                       ;SKIP IF 0 SOMEHOW
CF2A   CD 1E 02             CMP NLINET						;NUMBER OF MAX LINES IN TEXT WINDOW - 24
CF2D   90 07                BCC LCF36                       ;IN THE MIDDLE OF SCREEN
CF2F   F0 05                BEQ LCF36                       ;OR END OF LINE IF SAME
CF31   A9 01      LCF31     LDA #$01                        ;SET TOP OF SCREEN LINE 1
CF33   8D 01 02             STA LINE						;SAVE CURRENT LINE NUMBER OF TEXT CURSOR - LINE
CF36   85 FA      LCF36     STA $FA                         ;TEMP USED TO COMPUTE PROPER SCREEN POSITION VALUE
CF38   0A                   ASL A                           
CF39   0A                   ASL A                           
CF3A   65 FA                ADC $FA                         
CF3C   0A                   ASL A                           
CF3D   6D 1F 02             ADC YTDOWN						;255-(Y COORDINATTE OF TOP OF THE TEXT WINDOW - 'YTDOWN'
CF40   38                   SEC								;SET CARRY FLAG
CF41   E9 01                SBC #$01                        
CF43   20 63 CF             JSR LCF63                       ;COMPUTE SCREEN CURSOR POSITION WITH ACTUAL VALUES
CF46   CA                   DEX                             ;DECREMENT COLUMN LOCATION OF TEXT CURSOR
CF47   8A                   TXA                             ;PUT IT IN ACCUMULATOR - PREVIOUS COLUMN LOCATION IN A
CF48   E8                   INX                             ;INCRESE COLUMN LOCATION OF TEXT CURSOR - SO VALUE AS BEFORE
CF49   85 FA                STA $FA                         ;PREVIOUS CURSOR LOCATION ON SCREEN
CF4B   0A                   ASL A                           
CF4C   65 FA                ADC $FA                         
CF4E   48                   PHA                             ;PRESERVE PREVIOUS CURSOR LOCATION ON STACK
CF4F   0A                   ASL A                           
CF50   29 07                AND #$07                        ;ISOLATE 3 LOW BYTES
CF52   85 FC                STA $FC                         ;STORE IN TEMP VALUE FOR SOMETHING?
CF54   68                   PLA                             ;RESTORE PREVIOUS CURSOR LOCATION FROM STACK
CF55   4A                   LSR A                           
CF56   4A                   LSR A                           
CF57   18                   CLC                             
CF58   65 F2                ADC $F2                         
CF5A   85 F2                STA $F2                         ;LOW BYTE OF VISABLE MEMORY 'CURSOR' PLACE
CF5C   90 02                BCC LCF60                       
CF5E   E6 F3                INC $F3                         ;UPDATE VISABLE MEMORY PAGE IF NEEDED
CF60   60         LCF60     RTS								;IN A - LOW BYTE OF VISABLE MEMORY, X - COLUMN LOCATION OF TEXT CURSOR $F2 -LOW BYTE CURSOR PLACE, $F3 -PAGE OF CURSOR PLACE

;$00FB														;TEMP VALUE TO COUNT VISABLE MEMORY POSITIONS OF LOW BYTE 

;UPDATE CURSOR POSITION ON SCREEN

CF61   49 FF                EOR #$FF					;SOMETHING UNUSED OR WHAT IS GOING ON HERE??
CF63   48         LCF63     PHA								;PRESERVE A TO STACK
CF64   A9 00                LDA #$00						;LOAD #$00
CF66   85 FB                STA $FB							;STORE AT $FB - RESET $FB TO #$00
CF68   68                   PLA								;RESTORE A FROM STACK
CF69   0A                   ASL A                       
CF6A   26 FB                ROL $FB                     
CF6C   0A                   ASL A                       
CF6D   26 FB                ROL $FB                     
CF6F   85 FA                STA $FA                     	;TEMP VALUE TO COMPUTE SCREEN CURSOR POSITION
CF71   A5 FB                LDA $FB                     	;SECOND TEMPORARY VALUE
CF73   85 F3                STA $F3                     	;PAGE IN VISABLE MEMORY OF CURSOR POSITION
CF75   A5 FA                LDA $FA                     	;SAVE TEMP VALUE OF VISABLE MEMORY PAGE 
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
CF86   85 F2                STA $F2                     ;UPDATED LOW BYTE OF VISABLE MEMORY CURSOR POSITION
CF88   A5 F3                LDA $F3                     	;LOAD VISABLE PAGE BYTE
CF8A   E5 FB                SBC $FB                     	
CF8C   18                   CLC                         
CF8D   69 C0                ADC #$C0						;START OF VISUAL MEMORY PAGE
CF8F   85 F3                STA $F3                     ;UPDATED PAGE OF CURSOR POSITION ON SCREEN`
CF91   60                   RTS								;RETURN FROM SUBRUTINE - A - PAGE OF CURSOR POSITION, $F3 - PAGE FOR CURSOR POSITION, $F2 - POINTER TO CURSOR POSITION
CF92   20 FD CF   LCF92     JSR LCFFD
CF95   20 1C D1             JSR LD11C						;TURN ON I/O AREA
CF98   AD E0 BF             LDA $BFE0						;SYSTEM 1 6522 SYSTEM CONTROL PORT DATA REGISTER
CF9B   4D D0 02             EOR $02D0						;BANK SWITCH FROM FONT TABLE
CF9E   8D E0 BF             STA $BFE0						;SYSTEM 1 6522 SYSTEM CONTROL PORT DATA REGISTER
CFA1   A0 06                LDY #$06
CFA3   A2 00                LDX #$00
CFA5   86 FA      LCFA5     STX $FA
CFA7   B1 F6                LDA ($F6),Y
CFA9   29 F8                AND #$F8
CFAB   A6 FC                LDX $FC
CFAD   F0 06                BEQ LCFB5
CFAF   4A         LCFAF     LSR A
CFB0   66 FA                ROR $FA
CFB2   CA                   DEX
CFB3   D0 FA                BNE LCFAF
CFB5   99 B4 02   LCFB5     STA $02B4,Y
CFB8   A5 FA                LDA $FA
CFBA   99 BE 02             STA $02BE,Y
CFBD   88                   DEY
CFBE   10 E5                BPL LCFA5
CFC0   C8                   INY
CFC1   B1 F6                LDA ($F6),Y
CFC3   6A                   ROR A
CFC4   90 2C                BCC LCFF2
CFC6   A2 06                LDX #$06
CFC8   BD B4 02   LCFC8     LDA $02B4,X
CFCB   9D B6 02             STA $02B6,X
CFCE   BD BE 02             LDA $02BE,X
CFD1   9D C0 02             STA $02C0,X
CFD4   CA                   DEX
CFD5   10 F1                BPL LCFC8
CFD7   A9 00                LDA #$00
CFD9   A2 02                LDX #$02
CFDB   20 01 D0             JSR LD001
CFDE   B1 F6                LDA ($F6),Y
CFE0   6A                   ROR A
CFE1   6A                   ROR A
CFE2   90 0E                BCC LCFF2
CFE4   A9 20                LDA #$20
CFE6   A6 FC                LDX $FC
CFE8   4A         LCFE8     LSR A
CFE9   6E BE 02             ROR $02BE
CFEC   CA                   DEX
CFED   10 F9                BPL LCFE8
CFEF   8D B4 02             STA $02B4
CFF2   AD E0 BF   LCFF2     LDA $BFE0						;SYSTEM 1 6522 SYSTEM CONTROL PORT DATA REGISTER
CFF5   09 03                ORA #$03
CFF7   8D E0 BF             STA $BFE0						;SYSTEM 1 6522 SYSTEM CONTROL PORT DATA REGISTER
CFFA   4C 2F D1             JMP LD12F
CFFD   A9 00      LCFFD     LDA #$00
CFFF   A2 09                LDX #$09
D001   9D B3 02   LD001     STA $02B3,X
D004   9D BD 02             STA $02BD,X
D007   CA                   DEX
D008   10 F7                BPL LD001
D00A   60                   RTS								;RETURN FROM SUBRUTINE
D00B   85 FA      LD00B     STA $FA
D00D   A2 00                LDX #$00
D00F   86 FB                STX $FB
D011   0A                   ASL A
D012   0A                   ASL A
D013   26 FB                ROL $FB
D015   0A                   ASL A
D016   26 FB                ROL $FB
D018   38                   SEC								;SET CARRY FLAG
D019   E5 FA                SBC $FA
D01B   B0 02                BCS LD01F
D01D   C6 FB                DEC $FB
D01F   18         LD01F     CLC
D020   2C 1A 02             BIT EXFONT						;IF BIT 7=1 THEN USE EXTERNAL FONT TABLE. 'EXFONT'
D023   10 12                BPL LD037
D025   6D 31 02             ADC QEXFNT						;ADRESS OF EXTERNAL FONT TABLE IF USED LOW BYTE
D028   85 F6                STA $F6
D02A   AD 32 02             LDA $0232						;ADRESS OF EXTERNAL FONT TABLE IF USED HIGH BYTE
D02D   65 FB                ADC $FB
D02F   85 F7                STA $F7
D031   AD 37 02             LDA EXFTBK						;MEMORY BANK NUMBER CONTAINING EXTERNAL FONT TABLE - DEFAULT 0. 'EXFTBK'
D034   4C 43 D0             JMP LD043
D037   69 50      LD037     ADC #$50
D039   85 F6                STA $F6							;FONT TABLE POINTER			-FOR KIM $00
D03B   A9 FD                LDA #$FD
D03D   65 FB                ADC $FB
D03F   85 F7                STA $F7							;FONT TABLE PAGE			-FOR KIM $20
D041   A9 01                LDA #$01
D043   8D D0 02   LD043     STA $02D0						;FONT TABLE BANK			-FOR KIM $00
D046   20 92 CF             JSR LCF92
D049   20 06 D1             JSR LD106
D04C   A6 FC                LDX $FC
D04E   BD 84 D0             LDA $D084,X
D051   8D B2 02             STA $02B2
D054   BD 7C D0             LDA $D07C,X
D057   8D B1 02             STA $02B1
D05A   A2 09                LDX #$09
D05C   A0 01      LD05C     LDY #$01
D05E   AD B2 02             LDA $02B2
D061   31 F4                AND ($F4),Y
D063   1D BD 02             ORA $02BD,X
D066   91 F4                STA ($F4),Y
D068   88                   DEY
D069   AD B1 02             LDA $02B1
D06C   31 F4                AND ($F4),Y
D06E   1D B3 02             ORA $02B3,X
D071   91 F4                STA ($F4),Y
D073   20 49 D1             JSR LD149
D076   CA                   DEX
D077   10 E3                BPL LD05C
D079   4C 27 D1             JMP LD127

;EQUATES LOW BYTE
D07C   03       
D07D   81 
D07E   C0       
D07F   E0
D080   F0       
D081   F8       
D082   FC       
D083   FE
;HIGH BYTE
D084   FF 
D085   FF       
D086   FF       
D087   7F       
D088   3F       
D089   1F       
D08A   0F       
D08B   07  
     
D08C   0E 1B 02   OFFTCR    ASL $021B						;'OFFTCR' ROUTINE - TO TURN THE TEXT CURSOR OFF IF IT'S ON SO CARRY HAS TO BE ADDED AS $021B IS NORMALLY "0"
D08F   B0 05                BCS FLPTCR                      ;IF CARRY SET GO TO FLPTCR
D091   60                   RTS								;RETURN FROM SUBRUTINE
D092   38         ONTCR     SEC								;'ONTCR' ROUTINE - SET CARRY FLAG - TO TURN THE TEXT CURSOR ON
D093   6E 1B 02             ROR $021B						;WILL SET CARRY IF IT WAS THERE AND LEFT $021B AS "0" AGAIN

;'FLPTCR' ROUTINE - TO FLIP THE VIDEO SENSE OF THE CURSOR AT THE CURSOR POSITION - BASICALLY INVERTS CURSOR PIXEL POSITION 
;ARGUMENTS: COL - COLUMN NUMBER OF CHARACTER TO BE FLIPPED, LINE- LINE NUMBER OF CHARACTER TO BE FLIPPED

D096   48         FLPTCR    PHA								;PRESERVE A ON STACK
D097   8A                   TXA                             
D098   48                   PHA                             ;PRESERVE X ON STACK
D099   98                   TYA                             
D09A   48                   PHA                             ;PRESERVE Y ON STACK
D09B   20 3B D1             JSR LD13B                       ;COMPUTE NEW CURSOR POSITION ON SCREEN - LOW BYTE OF VISABLE MEMORY IN A
D09E   20 A7 D0             JSR LD0A7                       ;DRAW ON SCREEN IN 6X10 CELLS HORIZONTALLY
D0A1   68                   PLA								
D0A2   A8                   TAY                             ;GET BACK Y FROM STACK
D0A3   68                   PLA                             
D0A4   AA                   TAX                             ;GET BACK X FROM STACK						
D0A5   68                   PLA                             ;GET BACK A FROM STACK
D0A6   60                   RTS								;RETURN FROM SUBRUTINE

;DRAWING ROUTINE IN 6 BY 10 CELLS FONT/CURSOR 
;$02B2  - SCRATCH POINTER FOR FONT CELL
;$02B1	- SCRATCH POINTER FOR FONT CELL
;$F4 - LOW BYTE VISABLE MEMORY POINTER

D0A7   20 3E D1   LD0A7     JSR LD13E						;UPDATE BASE VISABLE MEMORY POINTER AND PAGE TO NEW CURSOR POSITION
D0AA   20 06 D1             JSR LD106                       ;CHANGE MEMORY BANK TO ENABLE SAVE TO VISABLE MEMORY AREA
D0AD   A6 FC                LDX $FC                         ;3 LOW BYTES OF PREVIOUS CURSOR LOCATION PLACE PRESERVED EARLIER - SO SOME PREDEFINIED CELLS POSITIONS
D0AF   BD FE D0             LDA D0FE,X                      
D0B2   8D B2 02             STA $02B2                       ;FIRST TEMP BYTE FOR DISPLAY FONT/CURSOR CELL
D0B5   BD F6 D0             LDA $D0F6,X                     
D0B8   8D B1 02             STA $02B1                       ;HIGH BYTE FOR DISPLAY FONT/CURSOR CELL
D0BB   A2 09                LDX #$09                        ;8 PASSES OF DRAWING
D0BD   A0 01      LD0BD     LDY #$01                        ;TWO BYTES UPDATE IN ONE PASS
D0BF   AD B2 02             LDA $02B2                       ;LOAD FIRST POINTER
D0C2   51 F4                EOR ($F4),Y                     ;REVERSE WHAT IS IN BYTE
D0C4   91 F4                STA ($F4),Y                     ;SAVE IT ON SCREEN
D0C6   88                   DEY                             
D0C7   AD B1 02             LDA $02B1                       ;SECOND POINTER PART
D0CA   51 F4                EOR ($F4),Y                     ;
D0CC   91 F4                STA ($F4),Y                     ;SAVE SECOND PART ON SCREEN
D0CE   20 49 D1             JSR LD149                       ;CHECK PIXEL POSITION IN LINE AND UPDATE VISABLE MEMORY PAGE IF NEEDED
D0D1   CA                   DEX                             ;DECREMENT X - FOR NEW CELL POSITION PART
D0D2   10 E9                BPL LD0BD                       ;DRAW WHOLE CELL
D0D4   4C 27 D1             JMP LD127                       ;GO BACK TO BANK 0 - DISABLES ACCESS TO VISABLE MEMORY
D0D7   20 3E D1   LD0D7     JSR LD13E                       ;UPDATE VISABLE MEMORY POINTERS TO PREVIOUS VALUES
D0DA   20 49 D1             JSR LD149                       ;CHECK PIXEL POSITION IN LINE AND UPDATE VISABLE MEMORY PAGE IF NEEDED
D0DD   20 06 D1             JSR LD106                       ;CHANGE MEMORY BANK TO ENABLE SAVE TO VISABLE MEMORY AREA
D0E0   A6 FC                LDX $FC                         ;3 LOW BYTES OF PREVIOUS CURSOR LOCATION PLACE PRESERVERD EARLIER - SOME PREDEFINIED CELL POSITIONS
D0E2   BD FE D0             LDA D0FE,X                      ;FIRST TEMP BYTE FOR DISPLAY FONT/CURSOR CELL
D0E5   A0 01                LDY #$01                        ;TWO BYTES UPDATE IN ONE PASS
D0E7   51 F4                EOR ($F4),Y                     ;REVERSE WHAT IS IN BYTE
D0E9   91 F4                STA ($F4),Y                     ;SAVE IT ON SCREEN
D0EB   88                   DEY                             
D0EC   BD F6 D0             LDA $D0F6,X                     ;SECOND BYTE TO UPDATE
D0EF   51 F4                EOR ($F4),Y                     ;REVERSE WHAT'S IN IT
D0F1   91 F4                STA ($F4),Y                     ;SAVE ON SCREEN
D0F3   4C 27 D1             JMP LD127                       ;GO BACK TO BANK 0 - DISABLES ACCESS TO VISABLE MEMORY

;EQUATES FOR CURSOR CELL POSITIONS
D0F6   FC        
D0F7   7E 
D0F8   3F 
D0F9   1F        
D0FA   0F        
D0FB   07        
D0FC   03        
D0FD   01 
;EQUATES FOR CURSOR CELL POSITIONS
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
D13B   20 17 CF   LD13B     JSR LCF17						;POSITION OF TEXT CURSOR
D13E   48         LD13E     PHA                             ;SAVE A ON STACK
D13F   A5 F2                LDA $F2                         ;UPDATED VISABE MEMORY POINTER
D141   85 F4                STA $F4                         ;CURRENT VISABLE MEMORY POINTER
D143   A5 F3                LDA $F3                         ;UPDATED VISABLE MEMORY PAGE
D145   85 F5                STA $F5                         ;CURRENT VISABLE MEMORY PAGE
D147   68                   PLA                             ;RESTORE LOW BYTE OF VISABLE MEMORY FROM STACK
D148   60                   RTS								;RETURN FROM SUBRUTINE - A PRESERVED LOW VISABLE MEMORY BYTE
D149   A5 F4      LD149     LDA $F4					
D14B   38                   SEC								;SET CARRY FLAG
D14C   E9 3C                SBC #$3C						;LINE END FOR CHARACTERS - #$3C - 480PIX, FOR K-1008 - #$28 - 320 PIX LINE COUNT OF PIXELS
D14E   85 F4                STA $F4            	    	 	;UPDATE LOW VISABLE MEMORY POINTER
D150   B0 02                BCS LD154           	    	;CHECK END OF PAGE
D152   C6 F5                DEC $F5                 		;UPDATE VISABLE MEMORY PAGE
D154   60         LD154     RTS								;RETURN FROM SUBRUTINE
D155   2C 14 02   LD155     BIT NOBELL						;IF BIT 7=1 THEN BEL CHARACTER IS IGNORED 'NOBELL'
D158   30 2C                BMI LD186
D15A   48                   PHA								;SAVE REGISTERS
D15B   8A                   TXA
D15C   48                   PHA
D15D   98                   TYA
D15E   48                   PHA
D15F   AC 27 02             LDY BELPER						;BELL SOUND WAVEFORM PERIOD IN UNITS OF 200 MICROSECONDS
D162   AE 29 02             LDX BELCY						;BELL SOUND DURATION IN UNITS OF COMPLETE WAVEFORM CYCLES
D165   AD 28 02             LDA BELVOL						;BELL SOUND VOLUME. $00 MINIMUM, $7F MAXIMUM. 'BELVOL'
D168   4C 7E D1             JMP LD17E
D16B   2C 13 02   LD16B     BIT $NOCLIK						;If 7=1 then no click when a key is pressed. 
D16E   30 16                BMI LD186
D170   48                   PHA								;SAVE REGISTERS
D171   8A                   TXA
D172   48                   PHA
D173   98                   TYA
D174   48                   PHA
D175   AC 24 02             LDY CLKPER						;Click waveform period in units of 200 microseconds. 'CLKPER'
D178   AE 26 02             LDX CLKCY						;Click duration in units of complete waveform cycles. 'CLKCY'
D17B   AD 25 02             LDA CLKVOL						;Click volume, $00 = minimum, $7F = maximum. 'CLKVOL'
D17E   20 87 D1   LD17E     JSR BEEP
D181   68                   PLA
D182   A8                   TAY
D183   68                   PLA
D184   AA                   TAX
D185   68                   PLA
D186   60         LD186     RTS								;RETURN FROM SUBRUTINE
D187   C9 00      BEEP      CMP #$00						;'BEEP' ROUTINE
D189   10 01                BPL LD18C
D18B   4A                   LSR A
D18C   8D B0 02   LD18C     STA $02B0
D18F   8A                   TXA
D190   48                   PHA
D191   20 1C D1             JSR LD11C						;TURN ON I/O AREA
D194   A9 FF                LDA #$FF
D196   8D F3 BF             STA $BFF3						;SYSTEM 2 6522 AUDIO DAC PORT DIRECTION REGISTER
D199   AD B0 02   LD199     LDA $02B0
D19C   18                   CLC
D19D   69 80                ADC #$80
D19F   8D F1 BF             STA $BFF1						;SYSTEM 2 6522 AUDIO DAC PORT DATA REGISTER
D1A2   20 C2 D1             JSR LD1C2
D1A5   A9 80                LDA #$80
D1A7   38                   SEC								;SET CARRY FLAG
D1A8   ED B0 02             SBC $02B0
D1AB   8D F1 BF             STA $BFF1						;SYSTEM 2 6522 AUDIO DAC PORT DATA REGISTER
D1AE   20 C2 D1             JSR LD1C2
D1B1   CA                   DEX
D1B2   10 E5                BPL LD199
D1B4   A9 80                LDA #$80
D1B6   8D F1 BF             STA $BFF1						;SYSTEM 2 6522 AUDIO DAC PORT DATA REGISTER
D1B9   20 2F D1             JSR LD12F
D1BC   68                   PLA
D1BD   AA                   TAX
D1BE   AD B0 02             LDA $02B0
D1C1   60                   RTS								;RETURN FROM SUBRUTINE
D1C2   98         LD1C2     TYA
D1C3   48                   PHA
D1C4   A9 12      LD1C4     LDA #$12
D1C6   38                   SEC								;SET CARRY FLAG
D1C7   E9 01      LD1C7     SBC #$01
D1C9   D0 FC                BNE LD1C7
D1CB   88                   DEY
D1CC   D0 F6                BNE LD1C4
D1CE   68                   PLA
D1CF   A8                   TAY
D1D0   60                   RTS								;RETURN FROM SUBRUTINE
D1D1   20 DD CD   DRWLEG    JSR CLRLEG						;'DRWLEG' - TO DRAW THE FUNCTION KEY LEGEND BOXES AND THEIR LABELS
D1D4   A0 00                LDY #$00
D1D6   A9 05                LDA #$05
D1D8   85 FC                STA $FC
D1DA   A9 FB                LDA #$FB
D1DC   85 F3                STA $F3
D1DE   A9 88                LDA #$88
D1E0   85 F2      LD1E0     STA $F2
D1E2   A9 08      LD1E2     LDA #$08
D1E4   85 F8                STA $F8
D1E6   20 3E D1   LD1E6     JSR LD13E
D1E9   B9 C0 05             LDA $05C0,Y
D1EC   38                   SEC								;SET CARRY FLAG
D1ED   E9 20                SBC #$20
D1EF   90 04                BCC LD1F5
D1F1   C9 5F                CMP #$5F
D1F3   90 02                BCC LD1F7
D1F5   A9 00      LD1F5     LDA #$00
D1F7   84 F9      LD1F7     STY $F9
D1F9   20 0B D0             JSR LD00B
D1FC   A5 FC                LDA $FC
D1FE   18                   CLC
D1FF   69 06                ADC #$06
D201   C9 08                CMP #$08
D203   90 04                BCC LD209
D205   29 07                AND #$07
D207   E6 F2                INC $F2
D209   85 FC      LD209     STA $FC
D20B   A4 F9                LDY $F9
D20D   C8                   INY
D20E   C6 F8                DEC $F8
D210   D0 D4                BNE LD1E6
D212   E6 F2                INC $F2
D214   C0 20                CPY #$20
D216   D0 04                BNE LD21C
D218   A9 A6                LDA #$A6
D21A   D0 C4                BNE LD1E0
D21C   C0 40      LD21C     CPY #$40
D21E   90 C2                BCC LD1E2
D220   A9 C4                LDA #$C4			;?? BANK SWITCH RUTINE ??
D222   85 F2                STA $F2
D224   A9 FB                LDA #$FB
D226   85 F3                STA $F3
D228   20 2F D2             JSR LD22F
D22B   A9 E2                LDA #$E2
D22D   85 F2                STA $F2
D22F   20 06 D1   LD22F     JSR LD106
D232   A9 04                LDA #$04
D234   85 F8                STA $F8
D236   20 4D D2   LD236     JSR LD24D
D239   A5 F2                LDA $F2
D23B   18                   CLC
D23C   69 07                ADC #$07
D23E   85 F2                STA $F2
D240   C6 F8                DEC $F8
D242   D0 F2                BNE LD236
D244   20 3E D1             JSR LD13E
D247   20 60 D2             JSR LD260
D24A   4C 27 D1             JMP LD127
D24D   20 3E D1   LD24D     JSR LD13E
D250   20 56 D2             JSR LD256
D253   20 60 D2             JSR LD260
D256   A0 06      LD256     LDY #$06
D258   A9 FF                LDA #$FF
D25A   91 F4      LD25A     STA ($F4),Y
D25C   88                   DEY
D25D   10 FB                BPL LD25A
D25F   60                   RTS								;RETURN FROM SUBRUTINE
D260   A0 00      LD260     LDY #$00
D262   A2 0D                LDX #$0D
D264   D0 03                BNE LD269
D266   20 49 D1   LD266     JSR LD149
D269   B1 F4      LD269     LDA ($F4),Y
D26B   09 80                ORA #$80
D26D   91 F4                STA ($F4),Y
D26F   CA                   DEX
D270   D0 F4                BNE LD266
D272   60                   RTS								;RETURN FROM SUBRUTINE
                            .END

;D280-D2FF -AREA RESERVED FOR PRINTER DRIVER 128BYTES. - FIRST PART OF PRINTER DRIVER. SECOND PART (INITIALIZATION ROUTINE) ON $B400

;auto-generated symbols and labels
 LC837      $C837
 GETKEY     $C975
 LC640      $C640
 LC64D      $C64D
 LC76F      $C76F
 LC62F      $C62F
 LC8B3      $C8B3
 LC669      $C669
 LC64F      $C64F
 LC67B      $C67B
 LC659      $C659
 LC63A      $C63A
 LC817      $C817
 LC926      $C926
 LC627      $C627
 LD155      $D155
 LC6A8      $C6A8
 LCEF0      $CEF0
 LC62A      $C62A
 LC6A2      $C6A2
 LC6B1      $C6B1
 LC7CE      $C7CE
 LC6C5      $C6C5
 LINEFD     $CE41
 LC70D      $C70D
 LC6BF      $C6BF
 LC6E1      $C6E1
 LCF08      $CF08
 LC6DB      $C6DB
 CLRHTW     $CD6F
 LC788      $C788
 LC8F7      $C8F7
 LC7B9      $C7B9
 LC6F7      $C6F7
 LC793      $C793
 LC849      $C849
 LC73F      $C73F
 LCEDA      $CEDA
 LC739      $C739
 HOMETW     $CD72
 LC6EE      $C6EE
 LC8A1      $C8A1
 LC765      $C765
 LC777      $C777
 LC77F      $C77F
 LC86C      $C86C
 LC787      $C787
 LC790      $C790
 LC7B8      $C7B8
 LC7A4      $C7A4
 LC7AA      $C7AA
 LC7C8      $C7C8
 LC7BC      $C7BC
 LC813      $C813
 LC80E      $C80E
 LC7FC      $C7FC
 LC80D      $C80D
 LC7ED      $C7ED
 LC80B      $C80B
 LC7D3      $C7D3
 LC82C      $C82C
 LC822      $C822
 LC848      $C848
 LC83C      $C83C
 LC86B      $C86B
 LC861      $C861
 LC850      $C850
 LC87F      $C87F
 LC8AF      $C8AF
 LC88D      $C88D
 LC894      $C894
 LC8A9      $C8A9
 LC8D5      $C8D5
 LC8C4      $C8C4
 LC8EC      $C8EC
 LC8DE      $C8DE
 LC91B      $C91B
 LD106      $D106
 LD127      $D127
 LC8FC      $C8FC
 LC92F      $C92F
 LC947      $C947
 LC94E      $C94E
 LC972      $C972
 LC951      $C951
 ONTCR      $D092
 LD11C      $D11C
 LCAD7      $CAD7
 LCA85      $CA85
 LC9C6      $C9C6
 LCA8B      $CA8B
 LC9BD      $C9BD
 LC9B1      $C9B1
 LC9A7      $C9A7
 LC993      $C993
 LCA11      $CA11
 LC996      $C996
 LCAE0      $CAE0
 LCA03      $CA03
 LC9FD      $C9FD
 LC9CC      $C9CC
 LC9DE      $C9DE
 OFFTCR     $D08C
 LC9CF      $C9CF
 LCABD      $CABD
 LCA09      $CA09
 LCAF6      $CAF6
 LD16B      $D16B
 LCA28      $CA28
 OUTCH      $CBE6
 LD12F      $D12F
 LCA5D      $CA5D
 LCA4F      $CA4F
 LCA7C      $CA7C
 LCA4C      $CA4C
 LCA52      $CA52
 LCA7B      $CA7B
 LCA76      $CA76
 LCA65      $CA65
 LCAB6      $CAB6
 LCAA0      $CAA0
 LCA93      $CA93
 LCAD4      $CAD4
 LCAB8      $CAB8
 LCAC5      $CAC5
 LCABF      $CABF
 LCAF5      $CAF5
 LCAE8      $CAE8
 LCB25      $CB25
 LCB16      $CB16
 LCB4B      $CB4B
 LCB2F      $CB2F
 LCB39      $CB39
 LCB20      $CB20
 LCB3F      $CB3F
 LCB47      $CB47
 LCB5A      $CB5A
 LCBD4      $CBD4
 LCBFC      $CBFC
 LCC52      $CC52
 LCC04      $CC04
 LCC80      $CC80
 LD13B      $D13B
 LCC23      $CC23
 LCC32      $CC32
 LD00B      $D00B
 LCC48      $CC48
 LD0D7      $D0D7
 LCC45      $CC45
 LCC3D      $CC3D
 LD0A7      $D0A7
 LCC7A      $CC7A
 LCC54      $CC54
 LCC66      $CC66
 LCC70      $CC70
 LCC8B      $CC8B
 LCC9A      $CC9A
 LCD7D      $CD7D
 LCCA4      $CCA4
 LCCAF      $CCAF
 LCCC2      $CCC2
 CLRTLN     $CDF3
 LCCCD      $CCCD
 LCCD8      $CCD8
 LCCE0      $CCE0
 LCCFC      $CCFC
 LCCF7      $CCF7
 LCCDD      $CCDD
 LCCE2      $CCE2
 INITTW     $CD36
 LCD20      $CD20
 LCD28      $CD28
 DRWLEG     $D1D1
 CLRDSP     $CD95
 LCD41      $CD41
 BEEP      	$D187
 CLRTW      $CDAF
 LCD93      $CD93
 LCE15      $CE15
 LCF63      $CF63
 LD13E      $D13E
 LCF36      $CF36
 LCDD6      $CDD6
 LCDFD      $CDFD
 LCE1E      $CE1E
 LCE35      $CE35
 LCE27      $CE27
 LCE3E      $CE3E
 LCE39      $CE39
 LCE56      $CE56
 LCE5A      $CE5A
 LCE9A      $CE9A
 LCE97      $CE97
 LCE9D      $CE9D
 LCDF0      $CDF0
 LCEA6      $CEA6
 LCECB      $CECB
 LCEAE      $CEAE
 LCED7      $CED7
 LCECF      $CECF
 LCEE7      $CEE7
 LCF07      $CF07
 LCF06      $CF06
 LCF0E      $CF0E
 LCF20      $CF20
 LCF25      $CF25
 LCF31      $CF31
 LCF60      $CF60
 LCFFD      $CFFD
 LCFB5      $CFB5
 LCFAF      $CFAF
 LCFA5      $CFA5
 LCFF2      $CFF2
 LCFC8      $CFC8
 LD001      $D001
 LCFE8      $CFE8
 LD01F      $D01F
 LD037      $D037
 LD043      $D043
 LCF92      $CF92
 LD149      $D149
 LD05C      $D05C
 FLPTCR     $D096
 LD0BD      $D0BD
 D0FE      	$D0FE
 LD139      $D139
 LCF17      $CF17
 LD154      $D154
 LD186      $D186
 LD17E      $D17E
 LD18C      $D18C
 LD1C2      $D1C2
 LD199      $D199
 LD1C7      $D1C7
 LD1C4      $D1C4
 CLRLEG     $CDDD
 LD1F5      $D1F5
 LD1F7      $D1F7
 LD209      $D209
 LD1E6      $D1E6
 LD21C      $D21C
 LD1E0      $D1E0
 LD1E2      $D1E2
 LD22F      $D22F
 LD24D      $D24D
 LD236      $D236
 LD260      $D260
 LD256      $D256
 LD25A      $D25A
 LD269      $D269
 LD266      $D266




; .org BANK1 - END OF VISABLE MEMORY in MTU-130 - 1 FD50 -> 1 FFE0 
; FILE HEADER: 58 00 01 00 0F 03 50 FD A0 02

;        CHARACTER FONT TABLE
;        ENTRIES IN ORDER STARTING AT ASCII BLANK
;        96 ENTRIES
;        EACH ENTRY CONTAINS 7 BYTES
;        7 BYTES ARE CHARACTER MATRIX, TOP ROW FIRST, LEFTMOST DOT
;        IS LEFTMOST IN BYTE
;        LOWER CASE FONT IS SMALL UPPER CASE, 5 BY 5 MATRIX

CHTB:    .BYTE  $00,$00,$00    		; BLANK
         .BYTE  $00,$00,$00,$00
         .BYTE  $20,$20,$20    		; !
         .BYTE  $20,$20,$00,$20
         .BYTE  $50,$50,$50    		; "
         .BYTE  $00,$00,$00,$00
         .BYTE       $50,$50,$F8    ; #
         .BYTE  $50,$F8,$50,$50
         .BYTE       $20,$78,$A0    ; $
         .BYTE  $70,$28,$F0,$20
         .BYTE       $C8,$C8,$10    ; %
         .BYTE  $20,$40,$98,$98
         .BYTE       $40,$A0,$A0    ; &
         .BYTE  $40,$A8,$90,$68
         .BYTE       $30,$30,$30    ; '
         .BYTE  $00,$00,$00,$00
         .BYTE       $20,$40,$40    ; (
         .BYTE  $40,$40,$40,$20
         .BYTE       $20,$10,$10    ; )
         .BYTE  $10,$10,$10,$20
         .BYTE       $20,$A8,$70    ; *
         .BYTE  $20,$70,$A8,$20
         .BYTE       $00,$20,$20    ; +
         .BYTE  $F8,$20,$20,$00
         .BYTE       $00,$00,$00    ; ,
         .BYTE  $30,$30,$10,$20
         .BYTE       $00,$00,$00    ; -
         .BYTE  $F8,$00,$00,$00
         .BYTE       $00,$00,$00    ; .
         .BYTE  $00,$00,$30,$30
         .BYTE       $08,$08,$10    ; /
         .BYTE  $20,$40,$80,$80
         .BYTE       $60,$90,$90    ; 0
         .BYTE  $90,$90,$90,$60
         .BYTE       $20,$60,$20    ; 1
         .BYTE  $20,$20,$20,$70
         .BYTE       $70,$88,$10    ; 2
         .BYTE  $20,$40,$80,$F8
         .BYTE       $70,$88,$08    ; 3
         .BYTE  $30,$08,$88,$70
         .BYTE       $10,$30,$50    ; 4
         .BYTE  $90,$F8,$10,$10
         .BYTE       $F8,$80,$F0    ; 5
         .BYTE  $08,$08,$08,$F0
         .BYTE       $70,$80,$80    ; 6
         .BYTE  $F0,$88,$88,$70
         .BYTE       $F8,$08,$10    ; 7
         .BYTE  $20,$40,$80,$80
         .BYTE       $70,$88,$88    ; 8
         .BYTE  $70,$88,$88,$70
         .BYTE       $70,$88,$88    ; 9
         .BYTE  $78,$08,$08,$70
         .BYTE       $30,$30,$00    ; :
         .BYTE  $00,$00,$30,$30
         .BYTE       $30,$30,$00    ; ;
         .BYTE  $30,$30,$10,$20
         .BYTE       $10,$20,$40    ; LESS THAN
         .BYTE  $80,$40,$20,$10
         .BYTE       $00,$00,$F8    ; =
         .BYTE  $00,$F8,$00,$00
         .BYTE       $40,$20,$10    ; GREATER THAN
         .BYTE  $08,$10,$20,$40
         .BYTE       $70,$88,$08    ; ?
         .BYTE  $10,$20,$00,$20
         .BYTE       $70,$88,$08    ; @
         .BYTE  $68,$A8,$A8,$D0
         .BYTE       $20,$50,$88    ; A
         .BYTE  $88,$F8,$88,$88
         .BYTE       $F0,$48,$48    ; B
         .BYTE  $70,$48,$48,$F0
         .BYTE       $70,$88,$80    ; C
         .BYTE  $80,$80,$88,$70
         .BYTE       $F0,$48,$48    ; D
         .BYTE  $48,$48,$48,$F0
         .BYTE       $F8,$80,$80    ; E
         .BYTE  $F0,$80,$80,$F8
         .BYTE       $F8,$80,$80    ; F
         .BYTE  $F0,$80,$80,$80
         .BYTE       $70,$88,$80    ; G
         .BYTE  $B8,$88,$88,$70
         .BYTE       $88,$88,$88    ; H
         .BYTE  $F8,$88,$88,$88
         .BYTE       $70,$20,$20    ; I
         .BYTE  $20,$20,$20,$70
         .BYTE       $38,$10,$10    ; J
         .BYTE  $10,$10,$90,$60
         .BYTE       $88,$90,$A0    ; K
         .BYTE  $C0,$A0,$90,$88
         .BYTE       $80,$80,$80    ; L
         .BYTE  $80,$80,$80,$F8
         .BYTE       $88,$D8,$A8    ; M
         .BYTE  $A8,$88,$88,$88
         .BYTE       $88,$88,$C8    ; N
         .BYTE  $A8,$98,$88,$88
         .BYTE       $70,$88,$88    ; O
         .BYTE  $88,$88,$88,$70
         .BYTE       $F0,$88,$88    ; P
         .BYTE  $F0,$80,$80,$80
         .BYTE       $70,$88,$88    ; Q
         .BYTE  $88,$A8,$90,$68
         .BYTE       $F0,$88,$88    ; R
         .BYTE  $F0,$A0,$90,$88
         .BYTE       $78,$80,$80    ; S
         .BYTE  $70,$08,$08,$F0
         .BYTE       $F8,$20,$20    ; T
         .BYTE  $20,$20,$20,$20
         .BYTE       $88,$88,$88    ; U
         .BYTE  $88,$88,$88,$70
         .BYTE       $88,$88,$88    ; V
         .BYTE  $50,$50,$20,$20
         .BYTE       $88,$88,$88    ; W
         .BYTE  $A8,$A8,$D8,$88
         .BYTE       $88,$88,$50    ; X
         .BYTE  $20,$50,$88,$88
         .BYTE       $88,$88,$50    ; Y
         .BYTE  $20,$20,$20,$20
         .BYTE       $F8,$08,$10    ; Z
         .BYTE  $20,$40,$80,$F8
         .BYTE       $70,$40,$40    ; LEFT BRACKET
         .BYTE  $40,$40,$40,$70
         .BYTE       $80,$80,$40    ; BACKSLASH
         .BYTE  $20,$10,$08,$08
         .BYTE       $70,$10,$10    ; RIGHT BRACKET
         .BYTE  $10,$10,$10,$70
         .BYTE       $20,$50,$88    ; CARROT
         .BYTE  $00,$00,$00,$00
         .BYTE       $00,$00,$00    ; UNDERLINE
         .BYTE  $00,$00,$00,$F8
         .BYTE       $C0,$60,$30    ; GRAVE ACCENT
         .BYTE  $00,$00,$00,$00
         .BYTE       $00,$00,$20    ; A (LC)
         .BYTE  $50,$88,$F8,$88
         .BYTE       $00,$00,$F0    ; B (LC)
         .BYTE  $48,$70,$48,$F0
         .BYTE       $00,$00,$78    ; C (LC)
         .BYTE  $80,$80,$80,$78
         .BYTE       $00,$00,$F0    ; D (LC)
         .BYTE  $48,$48,$48,$F0
         .BYTE       $00,$00,$F8    ; E (LC)
         .BYTE  $80,$E0,$80,$F8
         .BYTE       $00,$00,$F8    ; F (LC)
         .BYTE  $80,$E0,$80,$80
         .BYTE       $00,$00,$78    ; G (LC)
         .BYTE  $80,$98,$88,$78
         .BYTE       $00,$00,$88    ; H (LC)
         .BYTE  $88,$F8,$88,$88
         .BYTE       $00,$00,$70    ; I (LC)
         .BYTE  $20,$20,$20,$70
         .BYTE       $00,$00,$38    ; J (LC)
         .BYTE  $10,$10,$50,$20
         .BYTE       $00,$00,$90    ; K (LC)
         .BYTE  $A0,$C0,$A0,$90
         .BYTE       $00,$00,$80    ; L (LC)
         .BYTE  $80,$80,$80,$F8
         .BYTE       $00,$00,$88    ; M (LC)
         .BYTE  $D8,$A8,$88,$88
         .BYTE       $00,$00,$88    ; N (LC)
         .BYTE  $C8,$A8,$98,$88
         .BYTE       $00,$00,$70    ; O (LC)
         .BYTE  $88,$88,$88,$70
         .BYTE       $00,$00,$F0    ; P (LC)
         .BYTE  $88,$F0,$80,$80
         .BYTE       $00,$00,$70    ; Q (LC)
         .BYTE  $88,$A8,$90,$68
         .BYTE       $00,$00,$F0    ; R (LC)
         .BYTE  $88,$F0,$A0,$90
         .BYTE       $00,$00,$78    ; S (LC)
         .BYTE  $80,$70,$08,$F0
         .BYTE       $00,$00,$F8    ; T (LC)
         .BYTE  $20,$20,$20,$20
         .BYTE       $00,$00,$88    ; U (LC)
         .BYTE  $88,$88,$88,$70
         .BYTE       $00,$00,$88    ; V (LC)
         .BYTE  $88,$88,$50,$20
         .BYTE       $00,$00,$88    ; W (LC)
         .BYTE  $88,$A8,$D8,$88
         .BYTE       $00,$00,$88    ; X (LC)
         .BYTE  $50,$20,$50,$88
         .BYTE       $00,$00,$88    ; Y (LC)
         .BYTE  $50,$20,$20,$20
         .BYTE       $00,$00,$F8    ; Z (LC)
         .BYTE  $10,$20,$40,$F8
         .BYTE       $10,$20,$20    ; LEFT BRACE
         .BYTE  $60,$20,$20,$10
         .BYTE       $20,$20,$20    ; VERTICAL BAR
         .BYTE  $20,$20,$20,$20
         .BYTE       $40,$20,$20    ; RIGHT BRACE
         .BYTE  $30,$20,$20,$40
         .BYTE       $10,$A8,$40    ; TILDA
         .BYTE  $00,$00,$00,$00
         .BYTE       $A8,$50,$A8    ; RUBOUT
         .BYTE  $50,$A8,$50,$A8